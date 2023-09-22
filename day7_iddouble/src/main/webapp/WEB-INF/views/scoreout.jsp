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
    <th>이름</th><th>국어</th><th>영어</th>
    <th>수학</th><th>총점</th><th>평균</th>
    <th>학점</th>
  </tr>
  <c:forEach items="${list}" var="bb">
    <tr>
    <td>${bb.name}</td>
    <td>${bb.kor}</td>
    <td>${bb.eng}</td>
    <td>${bb.mat}</td>
    <td>${bb.tot}</td>
    <td>
    <fmt:formatNumber value="${bb.avg}" pattern="#0.00"></fmt:formatNumber> 
    </td>
    <td>${bb.hak}</td>
    </tr>
  </c:forEach>
  
  <!-- 다른 방식의 예 
  <c:forEach items="${list}" var="dto">
<tr><td>${dto.name}</td><td>${dto.kor}</td><td>${dto.eng}</td><td>${dto.mat}</td>
<c:set var="tot" value="${dto.kor+dto.eng+dto.mat}"></c:set>
<c:set var="avg" value="${tot/3}"></c:set>
<c:choose>
<c:when test="${avg>=90}"><c:set var="grade" value="A"></c:set></c:when>
<c:when test="${avg>=80 && avg<90}"><c:set var="grade" value="B"></c:set></c:when>
<c:when test="${avg>=70 && avg<80}"><c:set var="grade" value="C"></c:set></c:when>
<c:when test="${avg>=60 && avg<70}"><c:set var="grade" value="D"></c:set></c:when>
<c:otherwise><c:set var="grade" value="F"></c:set></c:otherwise>
</c:choose>
<td>${tot}</td><td><fmt:formatNumber value="${avg}" pattern="#0.0"></fmt:formatNumber></td>
<td>${grade}</td>
</tr>
</c:forEach>
  
   -->
</table>
<a href="main">메인으로</a>
</body>
</html>