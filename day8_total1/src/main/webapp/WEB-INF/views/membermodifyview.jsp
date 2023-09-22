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
<c:forEach items="${list}" var="bb">
<form action="membermodify2" method="post" enctype="multipart/form-data">
<table border="1" width="300px" align="center">
<caption><h2>회원 정보 수정</h2></caption>
  <tr>
    <th>아이디</th>
    <td><input type="text" name="id" value="${bb.id}" readonly="readonly"></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="text" name="pw" value="${bb.pw}"></td>
  </tr>
  <tr>
    <th>이름</th>
    <td><input type="text" name="name" value="${bb.name}"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="tel" value="${bb.tel}"></td>
  </tr>
  <tr>
    <th>거주지</th>
    <td><input type="text" name="address" value="${bb.address}"></td>
  </tr>
  <tr>
    <th>이미지</th>
    <td><input type="file" name="image" value="${bb.image}"></td>
  </tr>
  <tr>
    <td colspan="2">
    <input type="submit" value="수정">
    </td>
  </tr>
  <a href="main">메인으로</a>
</table>
</form>
</c:forEach>
</body>
</html>