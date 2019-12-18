<%@ page import="com.exam.dao.CommentDao" %>
<%@ page import="com.exam.vo.CommentVo" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 요청데이터 한글처리
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	//DB작업
	CommentDao commentDao = CommentDao.getInstance();
	
	int cnum = commentDao.nextCommentNum(bnum);	//1번 게시판글 기억.
	
	CommentVo commentVo = new CommentVo();
	commentVo.setBnum(bnum);
	commentVo.setCnum(cnum);
	commentVo.setName(name);
	commentVo.setContent(content);

	int rowCount = commentDao.insert(commentVo);

%>