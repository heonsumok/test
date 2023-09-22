<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="myinfosave" method="post">
  <table border="1" width="400px" align="center">
  <caption><h2>회원정보 입력</h2></caption>
    <tr>
      <th>이름</th>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <th>주민번호</th>
      <td><input type="text" name="jumin"></td>
    </tr>
    <tr>
      <td colspan="2">
      <input type="submit" value="전송">
      </td>
    </tr>
  </table>
</form>
</body>
</html>