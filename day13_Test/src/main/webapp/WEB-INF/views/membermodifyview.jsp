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
<c:forEach items="${list2}" var="cc">
<form action="membermodify2" method="post">
<table border="1" width="300px" align="center">
<caption><h2>회원 정보 수정</h2></caption>
  <tr>
    <th>아이디</th>
    <td><input type="text" name="id" value="${cc.id}" readonly="readonly"></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="text" name="pw" value="${cc.pw}"></td>
  </tr>
  <tr>
    <th>이름</th>
    <td><input type="text" name="name" value="${cc.name}"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="tel" value="${cc.tel}"></td>
  </tr>
  <tr>
    <th>거주지</th>
    <td><input type="text" name="address" value="${cc.address}"></td>
  </tr>
  <tr>
    <th>주민번호</th>
    <td><input type="text" name="jumin" value="${cc.jumin}"></td>
  </tr>
  <tr>
      <th>취미</th>
       <td>
       <input type="checkbox" name="hobby" value="${cc.hobby}">운동
       <input type="checkbox" name="hobby" value="${cc.hobby}">영화감상
       <input type="checkbox" name="hobby" value="${cc.hobby}">맛집탐방
       <input type="checkbox" name="hobby" value="${cc.hobby}">여행
       <input type="checkbox" name="hobby" value="${cc.hobby}">게임
       </td>
    </tr>
  <tr>
    <th>하고싶은말</th>
    <td>
    <textarea rows="6" cols="20" value="${cc.content}"></textarea>
    </td>
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