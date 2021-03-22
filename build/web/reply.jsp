<%-- 
    Document   : reply
    Created on : Mar 22, 2021, 1:17:31 PM
    Author     : ThaiDuongNg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="public/css/style.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div>
                <p>${post.post_title}</p>
                <p>${post.content}</p>
            </div>
                <form action="reply?id=${id}" method="POST">
                <input type="text" name="cmt_content" placeholder="comment..."/>
                <br>
                 <button type="submit" class="btn">Add Reply</button>
            </form>
        </div>
    </body>
</html>
