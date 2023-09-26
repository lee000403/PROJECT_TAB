function fetchloginbutton(){
    event.preventDefault();
    let url = 'http://192.168.0.23:8080/TAB_PAGE/login_button';
    let id = document.getElementById("username").value;
    fetch(url, 
        {
            method: 'POST',
            body: JSON.stringify({ username: id }),
            headers: {
                'Content-Type': 'application/json'
            }
        })
    .then((result) => {
        if (!result.ok) {
            throw new Error('Network response was not ok');
        }
        return result.json();
    })
    .then((data) => {
        console.log(data);
        const updateDiv = document.getElementById('updateDiv');

        if (data.username !== ' ') {
            // 중복인 경우
            updateDiv.innerHTML = '<div>중복입니다. 다시 입력해주세요.</div>';
        } else{
            // 중복이 아닌 경우
            updateDiv.innerHTML = '<div>ID 사용 가능합니다.</div>';
        }
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}
