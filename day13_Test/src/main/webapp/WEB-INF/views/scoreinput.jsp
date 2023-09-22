<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="scoresave" method="post">
  <table border="1" width="400px" align="center">
  <caption><h2>성적 입력</h2></caption>
    <tr>
      <th>학번</th>
      <td><input type="number" name="num"></td>
    </tr>
    <tr>
      <th>이름</th>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <th>국어</th>
      <td><input type="number" name="kor"></td>
    </tr>
    <tr>
      <th>영어</th>
      <td><input type="number" name="eng"></td>
    </tr>
    <tr>
      <th>수학</th>
      <td><input type="number" name="mat"></td>
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