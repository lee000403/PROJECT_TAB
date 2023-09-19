<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="/CSSs/community_end.css">
    </head>

    <body>
        <%@ include file="../mainbar/header.jsp" %>
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="popupModalLabel">업로드 성공</h5>
                        <form action="">
                            <button class="close" formaction="/TAB_PAGE/search_community/" formmethod="post">닫기</button>
                        </form>
                    </div>
                    <div class="modal-body text-center">
                        <p>게시글이 성공적으로 등록되었습니다.</p>
                    </div>
                    <form action="" class="btn_bar">
                        <button class="btn" formaction="/TAB_PAGE/home_after/" formmethod="post">메인화면으로 돌아가기</button>
                    </form>
                </div>
            </div>
            </div>
    </body>
    <%@ include file="../mainbar/footer.jsp" %>

    </html>