<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ict.edu.DAO"%>
<%@page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	// idx 파라미터 값 받기
	String idx = request.getParameter("idx");
	
	VO vo = DAO.getInstance().getOnelist(idx);
	
	// 수정 및 삭제를 위해 session 에 저장
	session.setAttribute("vo", vo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<script type="text/javascript">
	function update_go(f) {
		f.action="update.jsp";
		f.submit();
	}
	function del_go(f) {
		f.action="delete.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<h2>방명록:상세화면</h2>
	<hr>
	<div class="link">
		<a href="list.jsp">[방명록 목록]</a>	
	</div>
	<div>
		<form method="post">
			<table>
					<tbody>
							<tr>
								<td style="background-color: #55aaff">작성자</td>
								<td>${vo.name}</td>
							</tr>
							<tr>
								<td style="background-color: #55aaff">제목</td>
								<td>${vo.subject}</td>
							</tr>
							<tr>
								<td style="background-color: #55aaff">email</td>
								<td>${vo.email}</td>
							</tr>
							<tr>
								<td style="background-color: #55aaff">파일</td>
								<!-- 파일유무에 따라 구별 -->
								<c:choose>
									<c:when test="${empty vo.file_name}">
										<td><b>파일 없음</b></td>
									</c:when>
									<c:otherwise>
										<td>
											<img src="upload/${vo.file_name}" style="width:100px;">
											<br>
											<a href="downdload.jsp?path=upload&file_name=${vo.file_name}"> ${vo.file_name} </a>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="pre">
								<td colspan="2">
									<pre>${vo.content}</pre>
								</td>
							</tr>
							<tr>
								<td colspan="2"> 
									<input type="button" value="수정" onclick="update_go(this.form)"> 
									<input type="button" value="삭제" onclick="del_go(this.form)">
								</td>
							</tr>
					</tbody>
			</table>
		</form>
	</div>
</body>
</html>