const post_id = document.getElementById("post_id").value;
const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");

form.addEventListener("submit", function (e) {
    e.preventDefault();
    let commentInput = document.getElementById("comment").value;
    addComment(commentInput);
    showReply(commentInput);
    fetchUpdate();
    commentInput.value = " ";
})

const addComment = (comment) => {
    const newComment = document.createElement("li");
    const bTag = document.createElement("b");
    newComment.append(bTag);
    newComment.append(`${comment}`);
    console.log(newComment);
    commentsContainer.append(newComment);

};

function showReply(data) {
    console.log("successfully working")

    let replyList = data;

    let outHTML = '';

    for (let reply of replyList) {
        outHTML = `${reply.COMMENT} <tr><td> ${reply.COMMENT_DATE} </td></tr>`
    }
    outHtml += ``;
    console.log(outHTML);
    const tableBody = document.querySelector("#datashow");
    tableBody.innerHTML = outHTML;
}

function fetchUpdate() {

    commentInput = form.elements.comment.value;

    function selectReply(post_id) {
        let url = `/community_answer/${post_id}`;
        let request = fetch(url)
            .then(response => {
                return result.json();
            })
            .then(data => {
                console.log(data);
            })
            .catch((data) => {
                console.log(param);
            })
    }

    let url = 'http://localhost:8080/insertComment';
    let option = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            "comment": commentInput,
            "post_id": post_id,
            "comment_id": "COMMENT"
        })
    }

    let request = fetch(url, option)
        .then((result) => {
            return result.json();
        })
        .then((data) => {
            console.log(data);
            showReply(data);
        })
        .catch((errorMeg) => {
            console.log(errorMeg);
        })
}