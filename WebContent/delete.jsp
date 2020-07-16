<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<script type="text/javascript">
	function del_ok(f) {
		// 유효성 검사
		var pwd = f.pwd.value;
		if(pwd == "") {
			alert("비밀번호를 입력하세요.");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
		
		if (f.pwd.value == "${vo.pwd}") {
		// alerm 과 달리 confirm 은 Y/N 을 선택하며, 이에따라 제출값이 달라짐
			var chk = confirm("정말 삭제할까요?");
			if (chk == true) {
				f.action="delete_ok.jsp";
				f.submit();
			} else {
			// return false 가 없으면 취소를 눌러도 삭제되는 오류 발생
				return false;
				history.go(-1);
			}
		} else {
			alert("비밀번호가 틀렸습니다.\n다시 입력해주세요.");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
		f.action="delete_ok.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<h2>방명록:삭제화면</h2>
	<hr>
	<div class="link">
		<a href="list.jsp">[방명록 목록]</a>	
	</div>
	<div>
		<form method="post">
			<table>
					<tbody>
							<tr>
								<td style="background-color: #55aaff">비밀번호</td>
								<td> <input type="password" name="pwd"> </td>
							</tr>
							<tr>
								<td colspan="2"> 
									<input type="button" value="삭제" onclick="del_ok(this.form)">
								</td>
							</tr>
					</tbody>
			</table>
		</form>
	</div>
</body>
</html>