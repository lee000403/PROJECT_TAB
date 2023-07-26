<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            /* Additional CSS for popup */
            .modal-dialog {
                max-width: 600px;
                margin: 30px auto;
                height: 500px;
                /* 원하는 높이 값으로 조정 */
                max-height: 80vh;
                /* 원하는 최대 높이 값으로 조정 */
            }

            .comment-reply {
                margin-left: 50px;
            }

            body {
                padding-top: 10rem;
                background-color: #fff;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .navbar {
                justify-content: flex-end;
            }

            .navbar-nav {
                display: flex;
                align-items: center;
            }

            .navbar-nav .nav-item {
                margin-right: 10px;
            }

            .h-navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                list-style: none;
            }

            .h-navbar .h-nav-item:first-child {
                margin-right: auto;
                font-size: 16px;
                line-height: 8px;
                list-style: none;
            }


            .navbar .nav-link {
                padding: 0;
                margin: 0;
                font-size: 16px;
                line-height: 8px;
                color: #000000ab;
            }

            .navbar .nav-link:hover {
                background-color: transparent;
                font-size: 16px;
                line-height: 8px;
            }

            .navbar-brand img {
                height: 80px;
            }

            .nav-button {
                display: inline-block;
                padding: 20px 20px;
                background-color: transparent;
                color: #000;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
                border: 1px solid #00000098;
            }

            .post-title {
                font-weight: bold;
                font-size: 22px;
                border-bottom: 1px solid #0000004d;
                margin-bottom: 10px;
            }

            header {
                position: fixed;
                background-color: #fef0ea;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 100;
            }

            .btn-reply {
                background-color: #ff7f95;
            }
        </style>
    </head>

    <body>
        <%@ include file="../mainbar/header.jsp" %>
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="popupModalLabel">Thank You!</h5>
                        <form action="">
                            <button class="close" formaction="/TAB_PAGE/community" formmethod="">&times;</button>
                        </form>
                    </div>
                    <div class="modal-body">
                        <p>게시글이 성공적으로 등록되었습니다.</p>
                    </div>
                    <form action="">
                        <button formaction="/TAB_PAGE/home_after/" formmethod="">메인화면</button>
                    </form>
                </div>
            </div>
            </div>
    </body>
    <%@ include file="../mainbar/footer.jsp" %>

    </html>