<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
<%@ include file="DBConn.jsp" %>
<h1>학사정보 목록</h1>
<table border=1 id="tab2">
<tr>
 <th>no</th>
 <th>도서코드</th>
 <th>작가</th>
 <th>도 서 명</th>
 <th>구분</th>
</tr>
<%
   try{
	   ResultSet rs=null;
	   PreparedStatement pstmt=null;
	   String sql="select*from bookinfo1229";
	   pstmt=conn.prepareStatement(sql);
	   rs=pstmt.executeQuery();
	   int no=0;
	   
	   while(rs.next()){
		   int bookno=rs.getInt(1);
		   String author=rs.getString(2);
		   String bookname=rs.getString(3);
		   no++;
%>

<tr>
  <td id="in3" align="center"><%=no %></td>
  <td id="in3" align="center"><a href="bookinfoUpdate.jsp?bookno=<%=bookno%>" id="c1"><%=bookno %></a></td>
  <td id="in3" align="center"><%=author %></td>
  <td id="in3" align="center"><%=bookname %></td>
  <td id="in3" align="center"><a href="bookinfoDeleteProcess.jsp?bookno=<%=bookno %>" onclick="if(!confirm('정말로 삭제하기겠습니까?')) return false;" id="c1">삭제</a></td>
</tr>

<% 

	   }
	   
	   
   }catch(SQLException e){
	   System.out.println("조회 실패");
	   e.printStackTrace();
   }

%>
</table>
<div class="btn_group">
<button id="btn2" type="button" onclick="location.href='bookinfoInsert.jsp'">도서 정보 추가
</button>
</div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>