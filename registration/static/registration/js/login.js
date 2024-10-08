$(document).ready(function() {
    $('#login').click(function() {
        login();
    });
});

function login() {
    var username = $('#user').val();
    var password = $('#password').val();

    if (!username || !password) {
        alert("Please enter both username and password");
        return;
    }

    var data = {
        'username': username,
        'password': password
    };

    $.ajax({
        type: 'POST',
        url: '/login/',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(response) {
            if (response.status === 'success') {
                alert('User logged in successfully');

                // Redirect based on role
                if (response.role === 'teacher') {
                    window.location.href = '/view_exams/';  // Redirect teachers to the exams page
                } else if (response.role === 'student') {
                    window.location.href = '/register_exam/';  // Redirect students to the registration page
                }
            } else {
                alert('Invalid credentials or user not found');
            }
        },
        error: function(xhr, status, error) {
            alert('An error occurred: ' + error);
        }
    });
}
