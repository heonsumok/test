<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="loginsave" method="post">

      <table align="center">
         <caption>
            <h1>로그인</h1>
         </caption>
         <tr>
            <th>아이디</th>
            <td><input type="text" name="id"></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="text" name="pw"></td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="로그인"></td>
         </tr>
      </table>
   </form>
</body>
</html>