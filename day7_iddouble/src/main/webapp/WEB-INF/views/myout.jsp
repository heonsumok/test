<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#img1:hover
{
transform: scale(0.5);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>회원정보 결과</h2></caption>
  <tr>
    <th>아이디</th><th>비밀번호</th><th>이름</th>
    <th>거주지</th><th>이미지</th>
  </tr>
  <c:forEach items="${list}" var="aa">
    <tr>
    <td>${aa.id}</td>
    <td>${aa.pw}</td>
    <td>${aa.name}</td>
    <td>${aa.address}</td>
    <td><img id="img1" src="image/${aa.image}" width="150px" height="100px"></td>
    </tr>
  </c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>