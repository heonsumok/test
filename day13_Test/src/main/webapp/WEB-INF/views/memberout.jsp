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
<%
HttpSession hs=request.getSession();
if(hs.getAttribute("loginstate")==null)
{
	hs.setAttribute("loginstate",false);
}
%>
<c:choose>
<c:when test="${loginstate==true}">
<table border="1" width="400px" align="center">
<caption><h2>회원정보 결과</h2></caption>
  <tr>
    <th>아이디</th><th>비밀번호</th><th>이름</th>
    <th>취미</th><th>하고싶은말</th><th>비고</th>
  </tr>
  <c:forEach items="${list}" var="aa">
    <tr>
    <td>${aa.id}</td>
    <td>${aa.pw}</td>
    <td><a href="memberdetail?id=${aa.id}">${aa.name}</a></td>
    <td>${aa.hobby}</td>
    <td><textarea rows="8" cols="40">${aa.content}</textarea></td>
    <td>
    <a href="memberdelete?id=${aa.id}">삭제</a>/
    <a href="membermodify1?id=${aa.id}">수정</a>
    </td>
    </tr>
  </c:forEach>
</table>
</c:when>
<c:otherwise>
<script type="text/javascript">
  window.onload=function()
  {
	  alert("회원만 이용가능합니다");
  }
</script>
</c:otherwise>
</c:choose>
<a href="main">메인으로</a>
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="5" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="membernotice?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
      
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="membernotice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="membernotice?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
   </c:if>
   
   </td>
</tr>
</body>
</html>