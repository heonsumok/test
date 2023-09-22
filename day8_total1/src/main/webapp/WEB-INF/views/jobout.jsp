<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>근무시간 결과</h2></caption>
  <tr>
    <th>이름</th><th>입사날짜</th>
    <th>현재날짜</th><th>기본급</th>
  </tr>
  <c:forEach items="${list}" var="ff">
    <tr>
    <td>${ff.name}</td>
    <td>${ff.ipsaday}</td>
    <td>${ff.nowday}</td>
    <td>
    <fmt:formatNumber value="${ff.kibon}" pattern="#,##0"></fmt:formatNumber>
    </td>
    </tr>
  </c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>