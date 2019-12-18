<%@page import="com.google.gson.Gson"%>
<%@page import="com.exam.vo.CommentVo"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	CommentDao commentDao = CommentDao.getInstance();
	
	List<CommentVo> list = commentDao.selectAllByBnum(bnum);

	Gson gson = new Gson();
	String str = gson.toJson(list);
	
	System.out.println(str); // 웹서버 콘솔에 출력
	out.print(str);  // 클라이언트(브라우저)에 출력
%>