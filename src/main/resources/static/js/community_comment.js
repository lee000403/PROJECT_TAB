const post_id = document.getElementById("post_id").value;
const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");
const delete_Buttons = document.getElementsByClassName("delete_Button");
const comment = document.getElementById("comment");
const submit_Button = document.getElementById("newComment");
const member_id = document.getElementById("member_id").value;
const lastDiv = document.getElementById("new_deleteButtonBox");


let ln;
let comment_Id;
let commentInput;

submit_Button.addEventListener("click", (reply) => {
    commentInput = comment.value;
    addComment(commentInput);
    comment.value = " ";
    swal("등록 완료!", "댓글을 등록하였습니다", "success");
})


for (const delete_Button of delete_Buttons) {
    delete_Button.addEventListener("click", (ln) => {
        comment_Id = event.currentTarget.getAttribute("value");
        const del = event.currentTarget.parentNode.parentNode;
        swal("삭제하시겠습니까?", {
            dangerMode: true,
            buttons: true,
            icon: "warning"
        })
        .then((willDelete) => {
            if(willDelete) {
                fetchDelete(comment_Id);
                del.parentNode.removeChild(del);
                swal("삭제 완료!", "댓글을 삭제하였습니다", "success");
            } else {}
        })
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
    fetchUpdate(comment_Id);
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
            "member_id": member_id
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
