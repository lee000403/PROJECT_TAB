const form = document.querySelector("#newComment");
const commentsContainer = document.querySelector("#comments");
form.addEventListener("submit", function(e) {
    e.preventDefault();
    const commentInput = form.elements.comment.value;
    addComment(commentInput);
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
