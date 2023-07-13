let keydownObject = document.querySelector('#keydownEnter')

keydownObject.addEventListener('keydown', (event) => { // keydown은 내가 하려는 것을 적는것이다 click 도 가능하다.
  if (event.code == 'Enter') { // enter 했을때만 작동하게 만드는 문법
    comOption();
  }
});

function comOption() {
    // url 입력
    let url = `http://192.168.0.35:8080/selectAll_Com/1`; // 입력값을 url에 넣는 방법
    // fetch 사용
    return fetch(url)
      .then(response => {
        return response.json();
      })
      .then(data => {
        // data에 hashmap 파일 저장이 되있으므로 data 사용
        let outHtml = `<option>Select an option...</option>`;
        for (let testMap of data) {
          outHtml += `<option value="${testMap.COLUMN_NAME}">${testMap.COLUMN_NAME} </option>`;
        }
        let comOptionElment = document.querySelector('#comoption');
        comOptionElment.innerHTML = outHtml;
      })
      .catch(error => {
        console.log(error);
      });
  }