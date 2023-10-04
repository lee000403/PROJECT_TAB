document.getElementById('title_button').addEventListener('click', function() {
    let element = event.target;
    let parts = element.split('/');
    let post_id = parts[parts.length - 1];
    fetchUpdate(post_id);
})

