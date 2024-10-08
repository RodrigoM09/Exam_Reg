// Exam Filtering Script, should be filterable by exam type, exam date, and exam location

$(document).ready(function() {
    $('#filter').click(function() {
        filterExams();
    });
});

$(document).ready(function() {
    $('#cancel').click(function() {
        window.location.href = '/home/';
    });
  });

function filterExams() {
    var exam_type = $('#exam_type').val();
    var exam_date = $('#exam_date').val();
    var exam_location = $('#exam_location').val();
    var data = {
        'exam_type': exam_type,
        'exam_date': exam_date,
        'exam_location': exam_location,
    };

    $.ajax({
        type: 'POST',
        url: '/filter/',
        data: data,
        success: function(response) {
          print(response);
            if (response['status'] == 'success') {
                alert('Exams filtered successfully');
                window.location.href = '/home/';
            } else {
                alert('No exams found');
            }
        }
    });
}


