<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>방명록 작성하기</title>

<link rel="stylesheet" type="text/css" href="mystyle.css">

<script type="text/javascript">
	function save_go(f) {
		// 유효성 검사
		var name = f.name.value;
		if(name == "") {
			alert("작성자 이름을 입력하세요.");
			f.name.value="";
			f.name.focus();
			return;
		}
		var subject = f.subject.value;
		if(subject == "") {
			alert("제목을 입력하세요.");
			f.subject.value="";
			f.subject.focus();
			return;
		}
		var email = f.email.value;
		if(email == "") {
			alert("이메일을 입력하세요.");
			f.email.value="";
			f.email.focus();
			return;
		}
		var pwd = f.pwd.value;
		if(pwd == "") {
			alert("비밀번호를 입력하세요.");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
		var content = f.content.value;
		if(content == "") {
			alert("내용을 입력하세요.");
			f.content.value="";
			f.content.focus();
			return;
		}
		f.action="write_ok.jsp";
		f.submit();
	}
	function cancel_go() {
		history.go(-1);
	}
</script>

</head>

<body>

	<h2>방명록:작성하기</h2>
	<hr>
	<div class="link">
		<a href="list.jsp">[방명록 목록]</a>	
	</div>
	<div>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td style="background-color: #55aaff">작성자</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td style="background-color: #55aaff">제목</td>
						<td><input type="text" name="subject"></td>
					</tr>
					<tr>
						<td style="background-color: #55aaff">email</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td style="background-color: #55aaff">비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td style="background-color: #55aaff">첨부 파일</td>
						<td><input type="file" name="file_name"></td>
					</tr>
					<tr class="content">
						<td colspan="2">
							<textarea rows="10" cols="55" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"> 
							<input type="button" value="저장" onclick="save_go(this.form)"> 
							<input type="button" value="취소" onclick="cancel_go()">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>
			