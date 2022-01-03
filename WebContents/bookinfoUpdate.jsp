<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.bookno.value==""){
    alert("도서코드가 입력되지 않았습니다.");
    document.form.bookno.focus();
    }else if(document.form.author.value==""){
    alert("작가가 입력되지 않았습니다.");
    document.form.author.focus();
    }else if(document.form.bookname.value==""){
    alert("도서이름이 입력되지 않았습니다.");
    document.form.bookname.focus();
    }else{
    	document.form.submit();
    	alert("수정이 완료되었습니다.");
    	
        
    
    }
  }

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h1>도서 정보 수정 화면</h1>
<%@ include file="DBConn.jsp" %>
<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    String bookno=request.getParameter("bookno");
    try{
    	String sql="select*from bookinfo1229 where bookno=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, bookno);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String name=rs.getString("bookno");
    		String author=rs.getString("author");
    		String bookname=rs.getString("bookname");
    		
   
    

%>

<form name="form" method="post" action="bookinfoUpdateProcess.jsp">
<table border=1 id="tab1">

<tr>
 <th width="20%">도서코드</th>
 <td>
 <input id="in1" type="text" name="bookno" value="<%=bookno %>">
 </td>
</tr>
<tr>
 <th width="20%">저자</th>
 <td>
 <input id="in1" type="text" name="author" value="<%=author %>">
 </td>
</tr>
<tr>
 <th width="20%">도서이름</th>
 <td>
 <input id="in1" type="text" name="bookname" value="<%=bookname %>">
 </td>
</tr>
<tr>
 <td colspan=2 align="center">
 <input id="btn1" type="button" value="수정" onclick="check()">
 <input id="btn1" type="reset" value="취소">
 </td>
</tr>


</table>
</form>
<% 
 	  }
    	
    }catch(SQLException e){
    	System.out.println("조회 실패");
    	e.printStackTrace();
    }
    
%>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>