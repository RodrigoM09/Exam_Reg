from django.shortcuts import render, redirect
from .models import Student, Exam
from django.http import HttpResponse

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

def login(request):
    return render(request, 'login.html')

def logout(request):
    return redirect('home')

