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
<form action="bookreply" method="post">
<table border="1" width="400px" align="center">
<caption><h2>정보 표시</h2></caption>
  <tr>
  <th>이름</th>
  	<th>전화번호</th><th>사는곳</th>
    <th>성별</th><th>나이</th>
  </tr>
  <c:forEach items="${list1}" var="bb">
    <tr>
    <td>${bb.name}</td>
    <td>${bb.tel}</td>
    <td>${bb.address}</td>
    <td>${bb.gender}</td>
    <td>${bb.age}</td>
    </tr>
  </c:forEach>
</table>
</form>
<a href="main">메인</a>//
<a href="memberoutgo">결과창</a>
</body>
</html>