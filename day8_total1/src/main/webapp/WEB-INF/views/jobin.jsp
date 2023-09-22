<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="jobsave" method="post">
  <table border="1" width="400px" align="center">
  <caption><h2>근무시간 입력</h2></caption>
    <tr>
      <th>이름</th>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <th>입사날짜</th>
      <td><input type="date" name="ipsaday"></td>
    </tr>
    <tr>
      <th>현재날짜</th>
      <td><input type="date" name="nowday"></td>
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