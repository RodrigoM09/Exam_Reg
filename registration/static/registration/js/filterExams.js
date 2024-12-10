document.getElementById("filterButton").addEventListener("click", function (e) {
    e.preventDefault();

    const filterBy = document.getElementById("filterBy").value;
    const filterValue = document.getElementById("filter").value;
    const csrfToken = document.querySelector('[name="csrfmiddlewaretoken"]').value;

    fetch("/view_exams/", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "X-CSRFToken": csrfToken,
        },
        body: new URLSearchParams({
            filter_by: filterBy,
            filter_value: filterValue,
        }),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                const tableBody = document.querySelector("#examTable tbody");
                tableBody.innerHTML = ""; // Clear existing rows

                data.exams.forEach((exam) => {
                    const row = `
                        <tr>
                            <td>${exam.id}</td>
                            <td>${exam.exam_name}</td>
                            <td>${exam.exam_date}</td>
                            <td>${exam.exam_time}</td>
                            <td>${exam.exam_location}</td>
                            <td>${exam.capacity}</td>
                        </tr>`;
                    tableBody.innerHTML += row;
                });
            } else {
                alert("Error: " + data.error);
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            alert("An error occurred while filtering exams.");
        });
});
