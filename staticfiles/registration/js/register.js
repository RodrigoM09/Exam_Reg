$(document).ready(function () {
    $('.register-exam').click(function () {
        const row = $(this).closest('tr');
        const examId = row.data('exam-id');

        $.ajax({
            type: 'POST',
            url: '/register_exam/',
            data: {
                exam_id: examId,
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            success: function (response) {
                if (response.status === 'success') {
                    alert(response.message);
                } else {
                    alert(response.message || 'Failed to register for the exam.');
                }
            },
            error: function () {
                alert('An error occurred while registering for the exam.');
            },
        });
    });
});
