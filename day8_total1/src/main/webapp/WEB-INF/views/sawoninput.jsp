<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sawonsave" method="post">
  <table border="1" width="400px" align="center">
  <caption><h2>사원정보 입력</h2></caption>
    <tr>
      <th>번호</th>
      <td><input type="number" name="bunho"></td>
    </tr>
    <tr>
      <th>이름</th>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <th>호봉수</th>
      <td>
      <input type="radio" name="ho" value="1">1호봉
      <input type="radio" name="ho" value="2">2호봉
      <input type="radio" name="ho" value="3">3호봉
      <input type="radio" name="ho" value="4">4호봉
      <input type="radio" name="ho" value="5">5호봉
      <input type="radio" name="ho" value="6">6호봉
      <input type="radio" name="ho" value="7">7호봉
      <input type="radio" name="ho" value="8">8호봉
      <input type="radio" name="ho" value="9">9호봉
      <input type="radio" name="ho" value="10">10호봉
      </td>
    </tr>
    <tr>
      <th>가족수</th>
      <td>
      <select name="fa">
      <option value="1">1인가족</option>
      <option value="2">2인가족</option>
      <option value="3">3인가족</option>
      <option value="4">4인가족</option>
      <option value="5">5인가족</option>
      </select>
      </td>
    </tr>
    <tr>
      <th>직위</th>
      <td>
      <select name="jik">
      <option value="이사">이사</option>
      <option value="부장">부장</option>
      <option value="과장">과장</option>
      <option value="대리">대리</option>
      <option value="사원">사원</option>
      </select>
      </td>
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