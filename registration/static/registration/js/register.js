// register new user in exam_registration database on register button click
// get student name, new student name, exam name and exam date from user input

$(document).ready(function() {
    $('#register').click(function() {
        register();
    });
});

$(document).ready(function() {
    $('#cancel').click(function() {
        window.location.href = '/home/';
    });
  });

function register() {
    var student = $('#student').val();
    var new_student = $('#new_student').val();
    var exam_name = $('#exam_name').val();
    var exam_date = $('#exam_date').val();
    var data = {
        'student': student,
        'new_student': new_student,
        'exam_name': exam_name,
        'exam_location': exam_location,
        'exam_date': exam_date,
        'exam_time': exam_time,
    };

    $.ajax({
        type: 'POST',
        url: '/register/',
        data: data,
        success: function(response) {
          print(response);
            if (response['status'] == 'success') {
                alert('User registered successfully');
                window.location.href = '/login/';
            } else {
                alert('User already exists');
            }
        }
    });
}
