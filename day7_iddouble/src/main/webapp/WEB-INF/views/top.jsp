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
	<h1>회원관리 프로그램</h1>
</header>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Student</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="main">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="input">회원정보입력</a></li>
          <li><a href="out">회원정보출력</a></li>
          <li><a href="map">찾아오시는길</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav">
      <li class="active">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">성적관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="sinput">성적입력</a></li>
          <li><a href="sout">성적출력</a></li>
          <li><a href="#">성적검색</a></li>
        </ul>
      </li>
     </ul>
  
     <ul class="nav navbar-nav navbar-right">
     <c:choose>
       <c:when test="${loginstate==true}">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>${member.id}님 Hello</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
       </c:when>
       <c:otherwise>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <li><a href="logingo"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
       </c:otherwise>
     </c:choose>
    </ul>
  </div>
</nav>

</html>