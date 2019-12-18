<%@page import="com.exam.vo.Customer"%>
<%@page import="com.exam.dao.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//스크립트릿(scriptlet) - 자바코드 영역

	//post 요청일 때 한글처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw =  request.getParameter("pw");

	Customer customer = new Customer();
	customer.setId(id);
	customer.setPw(pw);
	
	DBConn dbConn = DBConn.getInstance();
	dbConn.selectOne(id);
	boolean flag = dbConn.selectOneReturn(id,pw);

	//System.out.println(flag); // 웹서버 콘솔에 출력
	//out.print(flag);  // 클라이언트(브라우저)에 출력
	
	
	// 서버에서 클라이언트(브라우저) 당 한개씩 유지하는 객체
	session.setAttribute("customer", customer); // 로그인 처리
	// session.removeAttribute("member"); // 세션값 한개 삭제
	// session.invalidate(); // 현재 세션 비우기 // 로그아웃
	
	
	Customer mem = (Customer) session.getAttribute("customer");
	if (mem != null) {
		System.out.println(mem); // 웹서버 콘솔에 출력
		out.print(mem);  // 클라이언트(브라우저)에 출력
		%>
		<span>로그아웃</span><br>
		<%
	} else {
		%>
		<span>로그인</span><br>
		<%
	}
	
%>
<script>
	<% 
		if (flag){
	%>
		alert('아이디와 비밀번호가 일치하지 않습니다.');
		location = '/';
	<%
		}else {
	%>
	alert('로그인되었습니다.');
	location = '/';
	<%
		}
	%>
</script>