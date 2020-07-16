<%@page import="com.ict.edu.VO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	//파일 처리
	String path = getServletContext().getRealPath("/upload");
	MultipartRequest mr =
			new MultipartRequest(
				request,
				path,
				100 * 1024 * 1024,
				"UTF-8",
				new DefaultFileRenamePolicy()
			);
	
	VO vo = new VO();
	vo.setIdx(mr.getParameter("idx"));
	vo.setName(mr.getParameter("name"));
	vo.setSubject(mr.getParameter("subject"));
	vo.setContent(mr.getParameter("content"));
	vo.setFile_name(mr.getParameter("file_name"));
	vo.setEmail(mr.getParameter("email"));
	vo.setPwd(mr.getParameter("pwd"));
	
	// 파일을 업로드 할 때와 하지 않을 때를 구별
	if(mr.getFile("file_name") != null) {
		vo.setFile_name(mr.getFilesystemName("file_name"));
	} else {
		vo.setFile_name(mr.getParameter("f_name"));
	}
	int result = DAO.getInstance().getUpdate(vo);
%>

<<jsp:forward page="onelist.jsp?idx=${vo.idx}"></jsp:forward>
