const commentContainer = document.getElementById('allComments');
document.getElementById('addComments').addEventListener('click', function (ev) {
    addComment(ev);
})

function addComment(ev) {
    let commentText, wrapDiv;
    const textBox = document.createElement('div');
    const replyButton = document.createElement('button');
    replyButton.innerHTML = '답글';
    replyButton.className = 'reply';
    const deleteButton = document.createElement('button');
    deleteButton.innerHTML = '삭제';
    deleteButton.className = 'deleteComment'

    wrapDiv = document.createElement('div');
    wrapDiv.className = 'wrapper';
    wrapDiv.style.marginLeft = 0;
    commentText = document.getElementById('newComment').value;
    textBox.innerHTML = commentText;
    wrapDiv.append(textBox, replyButton, deleteButton);
    commentContainer.appendChild(wrapDiv);
}