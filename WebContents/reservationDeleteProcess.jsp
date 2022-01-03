<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String lentno=request.getParameter("lentno");
    PreparedStatement pstmt=null;
    try{
    	String sql="delete from reservation1229 where lentno=?";
    	pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, lentno); 
        pstmt.executeUpdate();
        System.out.println("도서 대출예약정보 삭제 성공");
        %>
            <script>
              alert("도서 대출예약정보 삭제 성공");
              location.href="reservationSelect.jsp";
            </script>
        <% 
        
    	
    	
    	
    }catch(SQLException e){
    	System.out.println("도서 대출예약정보 삭제 살패");
    	e.printStackTrace();
    }
%>

