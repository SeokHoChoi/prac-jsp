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
  <input type="button" value="수정하기" onclick="updateBoard()" />
</form>
<a href="/" role="button">취소</a>

<script>
    var id = window.location.href.split("/").pop();
  $(document).ready(function() {
    // 수정할 게시글 정보 가져오기
    $.ajax({
      url: '/id/' + id,
      type: 'GET',
      success: function(response) {
        // 게시글 정보를 폼에 채우기
        $('#title').val(response.title);
      },
      error: function(xhr, status, error) {
        console.log(error);
        alert('게시글 정보를 가져오는 중 오류가 발생하였습니다.');
      }
    });
  });

  function updateBoard() {
    var title = $('#title').val();
    var data = {
      "title": title
    };
    $.ajax({
      url: '/id/' + id,
      type: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify(data),
      success: function(response) {
        console.log(response);
        alert('게시글 수정이 완료되었습니다.');
        window.location.href = '/';
      },
      error: function(xhr, status, error) {
        console.log(error);
        alert('게시글 수정 중 오류가 발생하였습니다.');
      }
    });
  }
</script>
</body>
</html>
