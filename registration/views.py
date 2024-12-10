from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from .models import Student, Exam, User, Registered
from django.http import HttpResponse, JsonResponse, HttpResponseForbidden
from django.views.decorators.csrf import csrf_exempt
import json

def site_registration(request):
    if request.method == 'POST':
        student_id = request.POST.get('student_id')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        password = request.POST.get('password')
        is_student = bool(request.POST.get('is_student'))
        is_teacher = bool(request.POST.get('is_teacher'))

        if not (student_id and first_name and last_name and username and password):
            return HttpResponse("Error: Missing required fields!", status=400)

        # Check if student_id already exists
        if User.objects.filter(student_id=student_id).exists():
            return HttpResponse("Error: Student ID already exists!", status=409)

        # Create a new User object
        user = User.objects.create_user(
            username=username,
            password=password,
            student_id=student_id,
            first_name=first_name,
            last_name=last_name,
            is_student=is_student,
            is_teacher=is_teacher
        )

        # Log the student in and set their session
        login(request, user)
        request.session['student_id'] = user.student_id

        # Redirect students to the register_exam page
        if is_student:
            return redirect('register_exam')

        # Redirect teachers to the home page
        if is_teacher:
            return redirect('home')

    return render(request, 'site_registration.html')




def confirmation(request, registration_id):
    try:
        # Fetch the registration record using registration_id
        registration = Registered.objects.get(registration_id=registration_id)
        return render(request, "confirmation.html", {"registration": registration})
    except Registered.DoesNotExist:
        # Handle case where the registration record does not exist
        return HttpResponseForbidden("Registration not found.")



def register_student(request):
        # Fetch Exam details
    exam = Exam.objects.get(id=exam_id)
    # Fetch Student details
    user = User.objects.get(student_id=student_id)

    # Populate Registered table
    Registered.objects.create(
        student_id=student_id,
        exam_id=exam_id,
        username=user.username,
        first_name=user.first_name,
        last_name=user.last_name,
        exam_name=exam.exam_name,
        exam_date=exam.exam_date,
        exam_location=exam.exam_location
    )

    return HttpResponse(f"Student {user.first_name} {user.last_name} registered for {exam.exam_name} successfully!")

def register_exam(request):
    if request.method == "POST":
        exam_id = request.POST.get("exam_id")
        student_id = request.session.get("student_id")

        if not student_id:
            return HttpResponseForbidden("You must be logged in to register for an exam.")

        # Ensure the student exists in the database
        try:
            student = User.objects.get(student_id=student_id)
        except User.DoesNotExist:
            return HttpResponseForbidden("User not found.")

        if Registered.objects.filter(student_id=student_id, exam_id=exam_id).exists():
            return HttpResponseForbidden("You are already registered for this exam.")

        try:
            exam = Exam.objects.get(id=exam_id)

            # Save the registration
            registration = Registered.objects.create(
                student_id=student.student_id,
                exam_id=exam.id,
                username=student.username,
                first_name=student.first_name,
                last_name=student.last_name,
                exam_name=exam.exam_name,
                exam_date=exam.exam_date,
                exam_location=exam.exam_location,
            )

            # Redirect to confirmation page with registration details
            return redirect("confirmation", registration_id=registration.registration_id)

        except Exam.DoesNotExist:
            return HttpResponseForbidden("Exam does not exist.")

    # For GET requests, show available exams
    student_id = request.session.get("student_id")
    if not student_id:
        return HttpResponseForbidden("You must be logged in to view available exams.")

    # Get exams not registered by the student
    registered_exam_ids = Registered.objects.filter(student_id=student_id).values_list("exam_id", flat=True)
    exams = Exam.objects.exclude(id__in=registered_exam_ids)

    return render(request, "register_exam.html", {"exams": exams})




def home(request):
    return render(request, 'home.html')

# view exams and filter exams by student_id, exam_name, exam_date, exam_location
def view_exams(request):
    student_id = request.GET.get('student_id')
    exam_name = request.GET.get('exam_name')
    exam_date = request.GET.get('exam_date')
    exam_location = request.GET.get('exam_location')

    exams = Exam.objects.all()

    if student_id:
        exams = exams.filter(student_id=student_id)
    if exam_name:
        exams = exams.filter(exam_name=exam_name)
    if exam_date:
        exams = exams.filter(exam_date=exam_date)
    if exam_location:
        exams = exams.filter(exam_location=exam_location)

    exams = Registered.objects.all()
    return render(request, "view_exams.html", {"exams": exams})


def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        if not (username and password):
            return HttpResponse("Error: Missing username or password!", status=400)

        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            return HttpResponse("Error: User does not exist!", status=404)

        if not user.check_password(password):
            return HttpResponse("Error: Incorrect password!", status=401)

        # Log in the user
        login(request, user)

        # Store student_id in session
        if hasattr(user, 'student_id'):
            request.session['student_id'] = user.student_id
        else:
            return HttpResponse("Error: Student ID not found!", status=400)

        # Redirect to the home page
        return redirect('home')

    return render(request, 'login.html')



def logout_view(request):
    logout(request)
    return redirect('home')

def profile_view(request):
    if not request.user.is_authenticated:
        return HttpResponseForbidden("You must be logged in to view your profile.")

    user = request.user
    # Fetch the user's registered tests
    registered_tests = Registered.objects.filter(student_id=user.student_id)
    exams = Exam.objects.all()  # All available exams for rescheduling

    context = {
        "user": user,
        "registered_tests": registered_tests,
        "exams": exams,
    }

    return render(request, "profile.html", context)


# Remove a test registration
def remove_test(request, registration_id):
    if request.method == "POST":
        try:
            registration = Registered.objects.get(registration_id=registration_id)
            registration.delete()  # Delete the test registration
            return redirect("profile")
        except Registered.DoesNotExist:
            return HttpResponseForbidden("Test not found.")

# Reschedule a test
def reschedule_test(request, registration_id):
    if request.method == "POST":
        exam_id = request.POST.get("exam_id")
        try:
            registration = Registered.objects.get(registration_id=registration_id)
            exam = Exam.objects.get(id=exam_id)
            # Update the registration details
            registration.exam_id = exam.id
            registration.exam_name = exam.exam_name
            registration.exam_date = exam.exam_date
            registration.exam_location = exam.exam_location
            registration.save()
            return redirect("profile")
        except (Registered.DoesNotExist, Exam.DoesNotExist):
            return HttpResponseForbidden("Invalid test or exam data.")

def edit_profile(request):
    if not request.user.is_authenticated:
        return HttpResponseForbidden("You must be logged in to edit your profile.")

    user = request.user

    if request.method == "POST":
        user.first_name = request.POST.get("first_name")
        user.last_name = request.POST.get("last_name")
        user.email = request.POST.get("email")
        user.save()
        return redirect("profile")

    context = {
        "user": user,
    }

    return render(request, "edit_profile.html", context)

def manage_exams(request):
    exams = Exam.objects.all()
    return render(request, "manage_exams.html", {"exams": exams})

@csrf_exempt
def add_exam(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)  # Parse JSON request body
            exam_name = data.get("exam_name")
            exam_date = data.get("exam_date")
            exam_location = data.get("exam_location")
            capacity = data.get("capacity")

            # Validate data
            if not all([exam_name, exam_date, exam_location, capacity]):
                return JsonResponse({"success": False, "error": "All fields are required."})

            # Create the new exam
            Exam.objects.create(
                exam_name=exam_name,
                exam_date=exam_date,
                exam_location=exam_location,
                capacity=capacity,
            )
            return JsonResponse({"success": True})
        except Exception as e:
            return JsonResponse({"success": False, "error": str(e)})
    return JsonResponse({"success": False, "error": "Invalid request method."})

def get_exam(request, exam_id):
    try:
        # Fetch the exam by ID
        exam = Exam.objects.get(id=exam_id)

        # Return the exam details in JSON format
        return JsonResponse({
            "success": True,
            "exam": {
                "id": exam.id,
                "exam_name": exam.exam_name,
                "exam_date": str(exam.exam_date),  # Convert date to string
                "exam_location": exam.exam_location,
                "capacity": exam.capacity,
            }
        })
    except Exam.DoesNotExist:
        return JsonResponse({"success": False, "error": "Exam not found."})
    except Exception as e:
        return JsonResponse({"success": False, "error": str(e)})

@csrf_exempt
def edit_exam(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            exam_id = data.get("id")
            exam_name = data.get("exam_name")
            exam_date = data.get("exam_date")
            exam_location = data.get("exam_location")
            capacity = data.get("capacity")

            exam = Exam.objects.get(id=exam_id)
            exam.exam_name = exam_name
            exam.exam_date = exam_date
            exam.exam_location = exam_location
            exam.capacity = capacity
            exam.save()

            return JsonResponse({"success": True})
        except Exam.DoesNotExist:
            return JsonResponse({"success": False, "error": "Exam not found."})
        except Exception as e:
            return JsonResponse({"success": False, "error": str(e)})

    return JsonResponse({"success": False, "error": "Invalid request method."})

@csrf_exempt
def delete_exam(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            exam_id = data.get("id")

            # Validate exam ID
            if not exam_id:
                return JsonResponse({"success": False, "error": "Invalid exam ID."})

            # Find and delete the exam
            try:
                exam = Exam.objects.get(id=exam_id)
                exam.delete()
                return JsonResponse({"success": True})
            except Exam.DoesNotExist:
                return JsonResponse({"success": False, "error": "Exam not found."})
        except json.JSONDecodeError:
            return JsonResponse({"success": False, "error": "Invalid JSON data."})

    return JsonResponse({"success": False, "error": "Invalid request method."})


