$(document).ready(function () {
        const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;

        $("#filterButton").click(function () {
            const filterBy = $("#filterBy").val();
            const filterValue = $("#filter").val();

            $.ajax({
                type: "POST",
                url: "/view_exams/",
                data: {
                    filter_by: filterBy,
                    filter_value: filterValue,
                    csrfmiddlewaretoken: csrftoken,
                },
                success: function (response) {
                    const tableBody = $("#examTable tbody");
                    tableBody.empty();

                    response.exams.forEach(function (exam) {
                        const row = `
                            <tr>
                                <td>${exam.student_id}</td>
                                <td>${exam.exam_name}</td>
                                <td>${exam.exam_date}</td>
                                <td>${exam.exam_time}</td>
                                <td>${exam.room}</td>
                                <td>${exam.capacity}</td>
                            </tr>`;
                        tableBody.append(row);
                    });
                },
                error: function () {
                    alert("Error filtering exams.");
                },
            });
        });

        $("#clear").click(function () {
            $("#filter").val("");
            $("#examTable tbody tr").show();
        });
    });
