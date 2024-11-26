from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .models import Student, Exam, User, Registered
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import views as auth_views
from django.contrib.auth.hashers import check_password
from django.http import HttpResponseForbidden

def confirmation(request, registration_id):
    try:
        registration = Registered.objects.get(registration_id=registration_id)
        return render(request, "confirmation.html", {"registration": registration})
    except Registered.DoesNotExist:
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

        try:
            exam = Exam.objects.get(id=exam_id)
            student = User.objects.get(student_id=student_id)

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
        except User.DoesNotExist:
            return HttpResponseForbidden("User does not exist.")

    # For GET requests, render the exam list
    exams = Exam.objects.all()
    return render(request, "register_exam.html", {"exams": exams})




def home(request):
    return render(request, 'home.html')

def view_exams(request):
    examinations = Exam.objects.all()
    return render(request, 'view_exams.html', {'exams': examinations})

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(f"Username: {username}, Password: {password}")

        if not (username and password):
            return HttpResponse("Error: Missing username or password!", status=400)

        try:
            user = User.objects.get(username=username)
            print(f"User found: {user}")
        except User.DoesNotExist:
            return HttpResponse("Error: User does not exist!", status=404)

        if not user.check_password(password):  # Use the User model's password check
            print(f"Incorrect password for user: {username}")
            return HttpResponse("Error: Incorrect password!", status=401)

        # Log in the user
        login(request, user)

        # Store student_id in session (if applicable)
        request.session['student_id'] = user.student_id

        # Print first name and last name from the database
        print(f"First Name: {user.first_name}, Last Name: {user.last_name}")

        # Redirect to the home page
        return redirect('home')

    return render(request, 'login.html')


def logout_view(request):
    logout(request)
    return redirect('home')

