<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="membersearch2" method="post">
<table border="1" width="300px" align="center">
<caption><h2>검색</h2></caption>
  <tr>
    <td>
    <select name="item">
      <option value="name">이름</option>
      <option value="id">아이디</option>
    </select>
    </td>
    <td><input type="text" name="value"></td>
  </tr>
  <tr>
    <td colspan="2">
    <input type="submit" value="검색">
    <input type="reset" value="취소">
    </td>
  </tr>
  <a href="main">메인으로</a>
</table>
</form>
</body>
</html>