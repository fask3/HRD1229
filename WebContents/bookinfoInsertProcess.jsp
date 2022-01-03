<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
   request.setCharacterEncoding("utf-8");
   String bookcode=request.getParameter("bookcode");
   String author=request.getParameter("author");
   String bookname=request.getParameter("bookname");
   PreparedStatement pstmt=null;
   try{
	   String sql="insert into bookinfo1229 values(?,?,?)";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, bookcode);
	   pstmt.setString(2, author);
	   pstmt.setString(3, bookname);
	   pstmt.executeUpdate();
	   System.out.println("저장 성공");
	   
	   
   }catch(SQLException e){
	   System.out.println("저장 실패");
	   e.printStackTrace();
   }
  
%>
</body>
</html>