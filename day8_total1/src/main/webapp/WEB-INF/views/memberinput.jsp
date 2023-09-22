<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
/* 아이디 중복체크 */
$(function()
	{
		$("#btn1").click(function()
		{
			var id=$("#id").val();
			$.ajax({
				type:"post",
				async:true,
				url:"idcheck",
				data:{"id":id},
				success:function(result)
				{
					if(result==="ok")
						{
							alert("사용가능한 아이디입니다");
						}
					else
						{
							alert("이미 사용중인 아이디입니다");
						}
				},
				error:function()
				{
					alert("에러");
				}
			});
		});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="membersave" method="post" enctype="multipart/form-data">
  <table border="1" width="400px" align="center">
  <caption><h2>회원정보 입력</h2></caption>
    <tr>
      <th>아이디</th>
      <td>
      <input type="text" name="id" id="id">
      <button type="button" id="btn1">id중복검사</button>
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="text" name="pw"></td>
    </tr>
    <tr>
      <th>이름</th>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td><input type="text" name="tel"></td>
    </tr>
    <tr>
      <th>거주지</th>
      <td><input type="text" name="address"></td>
    </tr>
    <tr>
      <th>이미지</th>
      <td><input type="file" name="image"></td>
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