$(document).ready(function() {
    $('#login-form').submit(function(event) {
        event.preventDefault(); // Prevent default form submission

        var username  
 = $('#username').val();
        var password = $('#password').val();  


        // Validate input fields
        if (!username || !password) {
            alert("Please enter both username and password.");
            return false;
        }

        // Send AJAX request to login endpoint
        $.ajax({
            type: 'POST',
            url: '/login/',
            data: {
                username: username,
                password: password
            },
            beforeSend: function(xhr){
                xhr.setRequestHeader("X-CSRFToken", '{{ csrf_token }}');
            },
            success: function(response) {
                // Handle successful login response
                if (response.status === 'success') {
                    // Redirect based on role
                    if (response.role === 'teacher') {
                        window.location.href = '/view_exams/';
                    } else if (response.role === 'student') {
                        window.location.href = '/register_exam/';
                    }
                } else {
                    // Handle login failure
                    alert('Invalid credentials or user not found.');
                }
            },
            error: function(xhr, status, error) {
                // Handle AJAX errors
                alert('An error occurred: ' + error);
            }
        });
    });
});
