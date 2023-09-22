<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>사원정보 결과</h2></caption>
  <tr>
    <th>번호</th><th>이름</th><th>호봉수</th>
    <th>가족수</th><th>직위</th><th>기본급</th>
    <th>직위수당</th><th>가족수당</th><th>총급여</th>
  </tr>
  <c:forEach items="${list}" var="dd">
    <tr>
    <td>${dd.bunho}</td>
    <td>${dd.name}</td>
    <td>${dd.ho}호봉</td>
    <td>${dd.fa}명</td>
    <td>${dd.jik}</td>
    <td>
    <fmt:formatNumber value="${dd.kibon}" pattern="#,##0"></fmt:formatNumber>원
    </td>
    <td>
    <fmt:formatNumber value="${dd.fasudang}" pattern="#,##0"></fmt:formatNumber>원
    </td>
    <td>
    <fmt:formatNumber value="${dd.jiksudang}" pattern="#,##0"></fmt:formatNumber>원
    </td>
    <td>
    <fmt:formatNumber value="${dd.kibon+dd.fasudang+dd.jiksudang}" pattern="#,##0"></fmt:formatNumber>원
    </td>
    </tr>
  </c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>