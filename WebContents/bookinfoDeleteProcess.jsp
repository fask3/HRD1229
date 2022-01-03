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
   String bookno=request.getParameter("bookno");
   PreparedStatement pstmt=null;
   try{
	   String sql="delete from bookinfo1229 where bookno=?";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, bookno);
	   pstmt.executeUpdate();
	   System.out.println("삭제 성공");
	   %>
	     <script>
	      alert("도서정보가 삭제되었습니다.");
	      location.href="bookinfoSelect.jsp"
	     </script>
	   <% 
	   
	   
   }catch(SQLException e){
	   System.out.println("삭제 실패");
	   e.printStackTrace();
   }
  
%>
</body>
</html>