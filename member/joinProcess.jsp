<%@page import="com.exam.vo.Customer"%>
<%@page import="com.exam.dao.DBConn"%>
<%@page import="com.exam.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//스크립트릿(scriptlet) - 자바코드 영역

	//post 요청일 때 한글처리
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel =  request.getParameter("tel");
	String gender = request.getParameter("gender");

	Customer customer = new Customer();
	customer.setId(id);
	customer.setPw(pw);
	customer.setName(name);
	customer.setPhonenum(tel);
	customer.setGender(gender);
	
	DBConn dbConn = DBConn.getInstance();
	dbConn.insert(customer);
%>
<script>
	alert('회원가입되었습니다.');
	location = '/';
</script>