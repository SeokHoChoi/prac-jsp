<%--
  Created by IntelliJ IDEA.
  User: letshack
  Date: 2023/04/03
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            var id = window.location.href.split("/").pop(); // Get the ID from the URL
            $.ajax({
                type: "GET",
                url: "/id/" + id,
                success: function(data) {
                    // Fill in the HTML elements with the data received
                    $("#title").html(data.title);
                    $("#description").html(data.description);
                    $("#dueDate").html(data.dueDate);
                },
                error: function() {
                    alert("Failed to fetch data.");
                }
            });
        });
    </script>
</head>
<body>
<h1 id="title"></h1>
<p id="description"></p>
<p id="dueDate"></p>
</body>
</html>

