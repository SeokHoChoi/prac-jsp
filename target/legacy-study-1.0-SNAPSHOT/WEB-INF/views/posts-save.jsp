<%--
  Created by IntelliJ IDEA.
  User: letshack
  Date: 2023/04/03
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 작성</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<form>
    <div>
        <label for="title">제목</label>
        <input type="text" id="title" placeholder="제목이다" />
    </div>
    <input type="button" value="등록하기" onclick="createBoard()" />
</form>
<a href="/" role="button">취소</a>

<script>
    function createBoard() {
        let title = $('#title').val();
        let data = {
            "title": title
        };
        // $.ajax({
        //     url: '/posts/save',
        //     type: 'POST',
        //     contentType: 'application/json',
        //     data: JSON.stringify(data),
        //     success: function(response) {
        //         console.log(response);
        //         alert('게시글 작성이 완료되었습니다.');
        //         window.location.href = '/';
        //     },
        //     error: function(xhr, status, error) {
        //         console.log(error);
        //         alert('게시글 작성 중 오류가 발생하였습니다.');
        //     }
        // });

        fetch('/posts/save',{
            method:'POST',
            headers:new Headers({"Content-Type":"application/json"}),
            body:JSON.stringify(data)
        }).then(res=>{
                window.location.href='/';
        });
    }
</script>
</body>
</html>
