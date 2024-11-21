from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .models import Student, Exam, User
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import views as auth_views
from django.contrib.auth.hashers import check_password


def register_exam(request):
    exams = Exam.objects.all()
    if not exams.exists():
        print("No exams found.")
    else:
        for exam in exams:
            print(f"Exam: {exam.exam_name}, Date: {exam.exam_date}, Location: {exam.exam_location}")
    return render(request, 'register_exam.html', {'exams': exams})



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

