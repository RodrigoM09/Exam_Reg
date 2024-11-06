from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .models import Student, Exam, User
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import views as auth_views

def register_exam(request):
    if request.method == 'POST':
        # Get data from the form
        student_id = request.POST.get('student_id')  # For existing student selection
        new_student_id = request.POST.get('new_student_id')  # For registering new student by Student ID
        exam_name = request.POST.get('exam_name')
        exam_date = request.POST.get('exam_date')

        # Check if a new student is being registered using Student ID
        if new_student_id:
            # Ensure no duplicate Student ID exists, or create a new one
            student, _ = Student.objects.get_or_create(student_id=new_student_id)  # Ignore the 'created' variable
        elif student_id:
            # If an existing student is selected, fetch the student object
            try:
                student = Student.objects.get(id=student_id)
            except Student.DoesNotExist:
                return HttpResponse("Error: Selected student does not exist!", status=400)
        else:
            return HttpResponse("Error: No student selected or registered!", status=400)

        # Create the exam registration
        Exam.objects.create(student=student, exam_name=exam_name, exam_date=exam_date)

        return HttpResponse("Exam Registered Successfully!")

    else:
        # Display form with all students
        students = Student.objects.all()
        return render(request, 'register_exam.html', {'students': students})

def home(request):
    return render(request, 'home.html')

def view_exams(request):
    examinations = Exam.objects.all()
    return render(request, 'view_exams.html', {'exams': examinations})

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        try:
            # Check the Users table for matching credentials
            user = User.objects.get(username=username, password=password)

            # Redirect based on role
            if user.is_student:
                return redirect('/register_exam/')
            elif user.is_teacher:
                return redirect('/view_exams/')
            else:
                return HttpResponse("User role not recognized.", status=403)
        except User.DoesNotExist:
            return HttpResponse("Invalid username or password.", status=403)

    return render(request, 'login.html')


def logout_view(request):
    logout(request)
    return redirect('home')

