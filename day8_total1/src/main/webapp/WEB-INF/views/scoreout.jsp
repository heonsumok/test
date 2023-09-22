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
<caption><h2>성적 결과</h2></caption>
  <tr>
    <th>번호</th><th>이름</th><th>국어</th>
    <th>영어</th><th>수학</th><th>총점</th>
    <th>평균</th><th>학점</th><th>석차</th>
  </tr>
  <c:forEach items="${list}" var="cc">
    <tr>
    <td>${cc.bunho}</td>
    <td>${cc.name}</td>
    <td>${cc.kor}</td>
    <td>${cc.eng}</td>
    <td>${cc.mat}</td>
    <td>${cc.tot}</td>
    <td><fmt:formatNumber value="${cc.avg}" pattern="#0.0"></fmt:formatNumber></td>
    <td>${cc.hak}</td>
    <td>${cc.rank}</td>
    </tr>
  </c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>