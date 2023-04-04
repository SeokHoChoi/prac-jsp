<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${conPath}/js/index.js"></script>
    <link href="${conPath}/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<table>
    <thead>
    <th>
        글제목
    </th>
    <th>ID</th>
    <th>삭제</th>
    <th>상세보기</th>
    <th>수정</th>
    </thead>
    <tbody>
        <c:forEach items="${list}" var="list">
        <tr>
            <td class="title">${list.title}</td>
            <td id="list_id">${list.id}</td>
            <td><button class="delete-btn" data-id="${list.id}">삭제</button></td>
            <td><a href="/id/${list.id}" role="button">디테일 페이지</a></td>
            <td><a href="/put/${list.id}" role="button">글 수정</a></td>
        </tr>
        </c:forEach>
    </tbody>

</table>
<a href="/posts/save" role="button">글 등록</a>

<script>
    $(document).ready(function() {
        $('.delete-btn').click(function() {
            var id = $(this).data('id');
            $.ajax({
                type: "DELETE",
                url: "/delete/" + id,
                success: function() {
                    alert("글이 삭제되었습니다.");
                    window.location.reload();
                },
                error: function() {
                    alert("글 삭제에 실패하였습니다.");
                }
            });
        });
    });
</script>
</body>
</html>
