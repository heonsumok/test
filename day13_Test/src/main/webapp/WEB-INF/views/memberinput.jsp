<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function check() {
    // 중복 검사
    var id = $("#id").val();
    $.ajax({
        type: "post",
        async: true,
        url: "idcheck",
        data: { "id": id },
        success: function (result) {
            if (result == "ok") {
                // 중복 검사 통과 시 유효성 검사 수행
                alert("사용가능한 ID입니다.");
                performValidation();
            } else {
                alert("사용중인 ID입니다.");
            }
        },
        error: function (result) {
            alert("에러");
        }
    });
}

function check1() {
    var f = document.form1;
  //이름을 인증절차
	var cname= f.name.value;//폼에서 입력한 이름값을 갖고온다
	var vname=/^[가-힣]{2,4}$/;//이름인증범위 가~힣 2-4자 사이만 입력 ok
	if(cname==" " || cname=="")
		{
		alert("이름 입력란에 공백이 있으면 안됩니다");
		f.name.select();
		return false;
		}
	if(!vname.test(cname))
		{
		alert("이름은 한글(2~4) 이외는 안되요")
		f.name.select();
		return false;
		}
  //아이디 인증
	var checkid=f.id.value;//폼에서 입력한 id값을 가져옴
	var vid=/^[a-zA-Z\d]{4,8}$/; //
	if(checkid==" " || checkid=="")
		{
		alert("아이디 입력란에 공백이 있으면 안됩니다");
		f.id.select();
		return false;
		}
	if(!vid.test(checkid))
		{
		alert("아이디는 (4자~8자)이어야 하거나 영문자이어야 합니다")
		f.id.select();
		return false;
		}
	//비밀번호 인증
	var checkpw=f.pw.value;//폼에서 입력한 pw값을 가져옴
	var vpw=/^[0-9]{4,8}$/; //
	if(checkpw==" " || checkpw=="")
		{
		alert("비밀번호 입력란에 공백이 있으면 안됩니다");
		f.pw.select();
		return false;
		}
	if(!vpw.test(checkpw))
		{
		alert("비밀번호는 숫자(4자~8자리) 입력할수 있습니다")
		f.pw.select();
		return false;
		}

    var arrSelect = document.getElementsByName("hobby");
    var count = 0;

    for (var i = 0; i < arrSelect.length; i++) {
        if (arrSelect[i].checked == true) {
            count += 1;
        }
    }
    
    if (count < 2) {
        alert("취미를 2개 이상 선택하세요.");
        return false;
    }

    // 모든 검사 통과 시 폼 제출
    f.submit();
}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="membersave" method="post" name="form1">
  <table border="1" width="400px" align="center">
  <caption><h2>회원가입</h2></caption>
    <tr>
      <th>아이디</th>
      <td>
      <input type="text" name="id" id="id">
      <button type="button" id="btn1" onclick="check()">id중복검사</button>
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
      <th>주민번호</th>
      <td><input type="text" name="jumin"></td>
    </tr>
    <tr>
      <th>취미</th>
       <td>
       <input type="checkbox" name="hobby" value="운동">운동
       <input type="checkbox" name="hobby" value="영화감상">영화감상
       <input type="checkbox" name="hobby" value="맛집탐방">맛집탐방
       <input type="checkbox" name="hobby" value="여행">여행
       <input type="checkbox" name="hobby" value="게임">게임
       </td>
    </tr>
    <tr>
      <th>하고싶은 말</th>
      <td>
      <textarea rows="8" cols="40" name="content"></textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2">
      <input type="button" value="전송" onclick="check1()">
      <input type="reset" value="취소">
      </td>
    </tr>
  </table>
</form>
</body>
</html>