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
    <th>학번</th>
    <th>이름</th><th>국어</th><th>영어</th>
    <th>수학</th><th>총점</th><th>평균</th>
    <th>학점</th><th>석차</th>
  </tr>
  <c:forEach items="${list}" var="bb">
    <tr>
    <td>${bb.num}</td>
    <td>${bb.name}</td>
    <td>${bb.kor}</td>
    <td>${bb.eng}</td>
    <td>${bb.mat}</td>
    <td>${bb.tot}</td>
    <td>
    <fmt:formatNumber value="${bb.avg}" pattern="#0.00"></fmt:formatNumber> 
    </td>
    <td>${bb.hak}</td>
    <td>${bb.rank}</td>
    </tr>
  </c:forEach>
  
</table>
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="5" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="scorenotice?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
      
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="scorenotice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="scorenotice?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
   </c:if>
   
   </td>
</tr>
<a href="main">메인으로</a>
</body>
</html>