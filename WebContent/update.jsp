<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>방명록 수정</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<script type="text/javascript">
	function update_ok(f) {
		// 유효성 검사
		var pwd = f.pwd.value;
		if(pwd == "") {
			alert("비밀번호를 입력하세요.");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
		 if (f.pwd.value != "${vo.pwd}") {
			 alert("비밀번호를 잘못 입력하셨습니다.\n다시 입력해주세요.");
				f.pwd.value="";
				f.pwd.focus();
				return;
		} else {
			var chk = confirm("이대로 수정할까요?");
			if (chk == true) {
				alert("수정이 완료되었습니다.");
				f.action="update_ok.jsp";
				f.submit();
			} else {
				return false;
			}
		}
	}
	function cancel(f) {
		history.go(-1);
	}
</script>

</head>

<body>
	<h2>방명록:수정화면</h2>
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
							<td> <input type="text" name="name" value="${vo.name}"> </td>
						</tr>
						<tr>
							<td style="background-color: #55aaff">제목</td>
							<td> <input type="text" name="subject" value="${vo.subject}"> </td>
						</tr>
						<tr>
							<!-- 보안 문제 때문에 <input type="file"> 에는 value 를 사용할 수 없음 -->
							<td style="background-color: #55aaff">파일</td>
							<td> <input type="file" name="file_name"> ${vo.file_name} </td>
						</tr>
						<tr>
							<td style="background-color: #55aaff">email</td>
							<td> <input type="text" name="email" value="${vo.email}"> </td>
						</tr>
						<tr>
							<td style="background-color: #55aaff">비밀번호</td>
							<td> <input type="password" name="pwd"> </td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="8" cols="60" name="content"> ${vo.content} </textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="button" value="수정하기" onclick="update_ok(this.form)"> 
								<input type="button" value="취소" onclick="cancel(this.form)">
								<input type="hidden" name="idx" value="${vo.idx}">
								<!-- 수정 시 파일 업로드를 하지 않는 경우에 사용하기 위해 생성 -->
								<input type="hidden" name="f_name" value="${vo.file_name}">
							</td>
						</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>