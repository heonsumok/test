<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>내정보 결과</h2></caption>
  <tr>
    <th>이름</th><th>성별</th><th>나이</th>
  </tr>
  <c:forEach items="${list}" var="gg">
    <tr>
    <td>${gg.name}</td>
    <td>${gg.gender}</td>
    <td>${gg.age}살</td>
    </tr>
  </c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>