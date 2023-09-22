<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>

<header style="text-align: center;">
	<h1>Ezen Academy</h1>
</header>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main">EZEN</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="main">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원가입관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="memberinputgo">회원정보 입력</a></li>
          <li><a href="memberoutgo">회원정보 출력</a></li>
          <li><a href="membersearchgo">회원정보 검색</a></li>
          <li><a href="membernotice">페이징처리출력</a></li>
        </ul>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">성적관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="scoreinputgo">성적 입력</a></li>
          <li><a href="scoreoutgo">성적 출력</a></li>
          <li><a href="scorenotice">페이징처리출력</a></li>
        </ul>
     </ul>
  
     <ul class="nav navbar-nav navbar-right">
     <c:choose>
       <c:when test="${loginstate==true}">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>${member.id}님 Hello</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
       </c:when>
       <c:otherwise>
      <li><a href="memberinputgo"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <li><a href="logingo"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
       </c:otherwise>
     </c:choose>
    </ul>
  </div>
</nav>

</html>