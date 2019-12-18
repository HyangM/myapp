<%@page import="com.exam.dao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	
	CommentDao commentDao = CommentDao.getInstance();
	int rowCount = commentDao.deleteByBnumCnum(bnum, cnum);

	out.println(rowCount);
%>