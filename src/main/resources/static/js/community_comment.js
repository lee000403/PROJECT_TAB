const currentDate = new Date();

const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");
form.addEventListener("submit", function(e) {
    e.preventDefault();
    const commentInput = form.elements.comment.value;
    addComment(commentInput);
    fetchUpdate(commentInput);
    commentInput.value = "";
})

const addComment = (comment) => {
    const newComment = document.createElement("li");
    const bTag = document.createElement("b");
    newComment.append(bTag);
    newComment.append(`${comment}`);
    console.log(newComment);
    commentsContainer.append(newComment);

};

function fetchUpdate(post_id, commentInput, currentDate){

    let url = 'http://127.0.0.1:8080/insertComment';
    let option = {
        method : "PUT",
        headers : {
            "Content-Type" : "application/json"
        },
        body : JSON.stringify({
            "comment": commentInput,
            "comment_date": currentDate,
            "post_id": post_id,
            "comment_id": "HELP"
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