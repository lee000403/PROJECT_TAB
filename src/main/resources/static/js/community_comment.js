import swal from 'sweetalert';

const post_id = document.getElementById("post_id").value;
const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");
const delete_Buttons = document.getElementsByClassName("delete_Button");
const comment = document.getElementById("comment");
const submit_Button = document.getElementById("newComment");
let comment_Id;
let commentInput;

submit_Button.addEventListener("click", (reply) => {
    commentInput = comment.value;
    addComment(commentInput);
    comment.value = " ";
})

for (const delete_Button of delete_Buttons) {
    delete_Button.addEventListener("click", (ln) => {
        comment_Id = ln.currentTarget.getAttribute("value");
        fetchDelete(comment_Id);
        const del = ln.currentTarget.parentNode.parentNode;
        del.parentNode.removeChild(del);
    })
}

const addComment = commentInput => {
    const currentDate = new Date();
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const day = String(currentDate.getDate()).padStart(2, '0');
    const formattedDate = `${year}-${month}-${day}`;

    const tableBody = document.querySelector("#datashow");
    const templateRow = document.querySelector("#reply_template");

    const comment = commentInput

    const newRow = templateRow.cloneNode(true);

    const tds = newRow.querySelectorAll("td");
    tds[0].textContent = comment;
    tds[1].textContent = formattedDate;
    tds[2].textContent = "삭제";

    tableBody.appendChild(newRow);
    fetchUpdate(comment_Id)
    commentInput.value = " ";

};

function fetchUpdate(comment_Id) {
    console.log("comment_Id:", comment_Id);
    commentInput = comment.value;

    let url = '/insertComment';
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