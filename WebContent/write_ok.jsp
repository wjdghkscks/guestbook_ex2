<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ict.edu.DAO"%>
<%@page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	// 파일 처리
	String path = getServletContext().getRealPath("/upload");
	
	MultipartRequest mr =
			new MultipartRequest(
				request,
				path,
				100 * 1024 * 1024,
				"UTF-8",
				new DefaultFileRenamePolicy()
			);
	
	// 파라미터 값 받기
	VO vo = new VO();
	vo.setName(mr.getParameter("name"));
	vo.setSubject(mr.getParameter("subject"));
	vo.setContent(mr.getParameter("content"));
	vo.setFile_name(mr.getParameter("file_name"));
	vo.setEmail(mr.getParameter("email"));
	vo.setPwd(mr.getParameter("pwd"));
	
	// 파일을 첨부하는 경우와 첨부하지 않는 경우를 구분
	if(mr.getFile("file_name") != null) {
		vo.setFile_name(mr.getFilesystemName("file_name"));
	} else {
		vo.setFile_name("");
	}
 	
%>

<c:choose>
	
	<c:when test="${result > 0 }">
		<script>
			alert("방명록 작성이 완료되었습니다.");
			location.href="list.jsp";
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("오류가 발생했습니다. 다시 시도해주세요.");
			location.href="write.jsp";
		</script>
	</c:otherwise>
	
</c:choose>

