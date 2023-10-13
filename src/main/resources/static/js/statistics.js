let data = [];

function get_network_header_list() {
    let headers_user_agent = [];
    headers_user_agent.push('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36')
    headers_user_agent.push('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59')
    headers_user_agent.push('Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Mobile/15E148 Safari/604.1')
    headers_user_agent.push('Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0)')
    headers_user_agent.push("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36")

    const rand_num = Math.floor(Math.random() * headers_user_agent.length);

    return headers_user_agent[rand_num];
}

const chartContainer = document.getElementById("chartContainer");
const dataTable = document.getElementById("dataTable");

const url = "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1352000/ODMS_STAT_27/callStat27Api?serviceKey=ab5XSHW0eOiAmWhlVe1Qtqzmut13uzseiVqXmu35AT0zQwCwjBhHELGx3F1%2BZGkhBwcyAKzKYzLcLtjKt%2B6xLA%3D%3D&year=2015&apiType=JSON";

axios.get(url, {
})
.then(response => {
    if(response.status === 200) {
        const string = response.data;

        const province = [];
        const snptNmfcl = [];
        const hmwlfHespsNmfcl = [];
        const hmwlfVsbhsNmfcl = [];

        const length = string.length;

        for (let i = 0; i < length; i++) {
            province.push(string.items[i].dvsd);
        }
        console.log(province);
        console.log(string);
    }
})

data.forEach(item => {

})