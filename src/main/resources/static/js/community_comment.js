const post_id = document.getElementById("post_id").value;
const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");


form.addEventListener("submit", function (e) {
    e.preventDefault();
    let commentInput = document.getElementById("comment").value;
    addComment(commentInput);
    commentInput.value = " ";
})

const addComment = (comment) => {
    const currentDate = new Date();
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const day = String(currentDate.getDate()).padStart(2, '0');
    const formattedDate = `${year}-${month}-${day}`;

    const tableBody = document.querySelector("#datashow");
    const templateRow = document.querySelector("#reply_template").cloneNode(true);
    templateRow.querySelector("td:first-child").textContent = comment;
    templateRow.querySelector("td:last-child").textContent = formattedDate;
    tableBody.appendChild(templateRow);

};

function fetchUpdate() {

    commentInput = form.elements.comment.value;

    let url = 'http://localhost:8080/insertComment';
    let option = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            "comment": commentInput,
            "post_id": post_id,
        })
    }

    let request = fetch(url, option)
        .then((result) => {
            return result.json();
        })
        .then((data) => {
            console.log(data);
        })
        .catch((errorMeg) => {
            console.log(errorMeg);
        })
}

function fetchDelete(comment_Id) {

    let url = '/deleteComment';
    let option = {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            "COMMENT_ID": comment_Id
        })
    };

    let request = fetch(url, option)
    .then((result) => {
        return result.json();
    })
    .then((data) => {
        console.log(data);
    })
    .catch((errorMeg) => {
        console.log(errorMeg);
    });
}