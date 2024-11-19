from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .models import Student, Exam, User
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import views as auth_views
from django.contrib.auth.hashers import check_password


def register_exam(request):
    if request.method == 'POST':
        # Retrieve student ID from session
        student_id = request.session.get('student_id')
        if not student_id:
            return HttpResponse("Error: No student logged in.", status=403)

        try:
            # Query the Student table using the student_id
            student = Student.objects.get(student_id=student_id)
        except Student.DoesNotExist:
            return HttpResponse(f"Error: Student with ID {student_id} does not exist.", status=404)

        # Fetch exam details from the POST request
        exam_name = request.POST.get('exam_name')
        exam_date = request.POST.get('exam_date')
        exam_location = request.POST.get('exam_location')
        exam_time = request.POST.get('exam_time')

        if not (exam_name and exam_date and exam_location and exam_time):
            return HttpResponse("Error: Missing exam details!", status=400)

        # Create the exam registration
        Exam.objects.create(
            student=student,
            exam_name=exam_name,
            exam_date=exam_date,
            exam_location=exam_location,
            exam_time=exam_time,
        )

        return HttpResponse("Exam Registered Successfully!", status=201)

    return render(request, 'register_exam.html')

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

        if not check_password(password, user.password):
            print(f"Incorrect password for user: {username}")
            return HttpResponse("Error: Incorrect password!", status=401)

        login(request, user)
        request.session['student_id'] = user.student_id
        print(f"Login successful for user: {username}")
        return redirect('home')

    return render(request, 'login.html')


def logout_view(request):
    logout(request)
    return redirect('home')

