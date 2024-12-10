document.addEventListener("DOMContentLoaded", function () {
  const addExamButton = document.getElementById("addExamButton");
    if (addExamButton) {
        addExamButton.addEventListener("click", function (event) {
            event.preventDefault();

            const examData = {
                exam_name: document.getElementById("addExamName").value,
                exam_date: document.getElementById("addExamDate").value,
                exam_location: document.getElementById("addExamLocation").value,
                capacity: document.getElementById("addExamCapacity").value,
                csrfmiddlewaretoken: document.querySelector('input[name="csrfmiddlewaretoken"]').value
            };

            fetch("/add_exam/", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRFToken": examData.csrfmiddlewaretoken
                },
                body: JSON.stringify(examData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Exam added successfully!");

                    // Clear the form fields
                    document.getElementById("addExamName").value = "";
                    document.getElementById("addExamDate").value = "";
                    document.getElementById("addExamLocation").value = "";
                    document.getElementById("addExamCapacity").value = "";

                    // Optionally reload the page or update the table dynamically
                    location.reload();
                } else {
                    alert("Error: " + data.error);
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("An error occurred while adding the exam.");
            });
        });
    }
    document.querySelectorAll(".deleteButton").forEach((button) => {
        button.addEventListener("click", function () {
            const examId = this.getAttribute("data-id");

            if (confirm("Are you sure you want to delete this exam?")) {
                fetch(`/delete_exam/`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "X-CSRFToken": document.querySelector('input[name="csrfmiddlewaretoken"]').value,
                    },
                    body: JSON.stringify({ id: examId }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert("Exam deleted successfully!");
                        location.reload(); // Reload the page to reflect changes
                    } else {
                        alert("Error deleting exam: " + data.error);
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("An error occurred while deleting the exam.");
                });
            }
        });
    });
 document.querySelectorAll(".editButton").forEach((button) => {
    button.addEventListener("click", async () => {
        const examId = button.getAttribute("data-id");

        const response = await fetch(`/get_exam/${examId}/`);
        if (response.ok) {
            const data = await response.json();

            if (data.success) {
                document.getElementById("editExamId").value = data.exam.id;
                document.getElementById("editExamName").value = data.exam.exam_name;
                document.getElementById("editExamDate").value = data.exam.exam_date;
                document.getElementById("editExamLocation").value = data.exam.exam_location;
                document.getElementById("editExamCapacity").value = data.exam.capacity;

                document.getElementById("editExamSection").style.display = "block";
                window.scrollTo(0, document.getElementById("editExamSection").offsetTop);
            } else {
                alert("Error: " + data.error);
            }
        } else {
            alert("Failed to fetch exam details.");
        }
    });
});

document.getElementById("editExamForm").addEventListener("submit", function (event) {
    event.preventDefault();

    const examData = {
        id: document.getElementById("editExamId").value,
        exam_name: document.getElementById("editExamName").value,
        exam_date: document.getElementById("editExamDate").value,
        exam_location: document.getElementById("editExamLocation").value,
        capacity: document.getElementById("editExamCapacity").value,
        csrfmiddlewaretoken: document.querySelector('input[name="csrfmiddlewaretoken"]').value,
    };

    fetch("/edit_exam/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": examData.csrfmiddlewaretoken,
        },
        body: JSON.stringify(examData),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                alert("Exam updated successfully!");
                location.reload(); // Reload the page to reflect changes
            } else {
                alert("Error updating exam: " + data.error);
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            alert("An error occurred while updating the exam.");
        });
});
});
