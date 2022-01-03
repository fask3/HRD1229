<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.custname.value==""){
    alert("고객성명이 입력되지 않았습니다.");
    document.form.custname.focus();
    }else if(document.form.bookno.value==""){
    alert("도서코드가 입력되지 않았습니다.");
    document.form.bookno.focus();
    }else if(document.form.outdate.value==""){
    alert("대출일자가 입력되지 않았습니다.");
    document.form.outdate.focus();

    }else{
    	document.form.submit();
    }
  }

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>

<%
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   String lentno=request.getParameter("lentno");
   try{
	   String sql="select lentno,custname,a.bookno,bookname,to_char(outdate,'yyyy-mm-dd'),to_char(indate,'yyyy-mm-dd'),status,class from reservation1229 a,bookinfo1229 b where a.bookno=b.bookno and lentno=?";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, lentno);
	   rs=pstmt.executeQuery();
	   if(rs.next()){
		 
		   String custname=rs.getString("custname");
		   String bookno=rs.getString("bookno");
		   String bookname=rs.getString("bookname");
		   String outdate=rs.getString(5);
		   String indate=rs.getString(6);
		   String status=rs.getString("status");
		   String class1=rs.getString("class");
		   if(class1==null){
			   class1="";
		   }
		   
  
%>

<h1>도서 대출 예약 정보 수정 화면</h1>
  <form name="form" method="post" action="reservationUpdateProcess.jsp">
    <table border=1 id="tab1">

      <tr>
        <th width="20%">대출번호</th>
        <td>
          <input id="in1" type="text" name="lentno" value="<%=lentno %>">
        </td>
      <th width="20%">고객성명</th>
        <td>
          <input id="in1" type="text" name="custname" value="<%=custname %>">
        </td>
      </tr>

<tr>
   <th width="20%">도서코드</th>
    <td>
      <input id="in1" type="text" name="bookno" value="<%=bookno %>">
     </td>
    <th width="20%">도서이름</th>
    <td>
       <input id="in1" type="text" name="bookname" value=<%=bookname %>>
   </td>
</tr>

<tr>
  <th width="20%">대출일자</th>
  <td>
    <input id="in1" type="text" name="outdate" value="<%=outdate %>">
  </td>
  <th width="20%">반납일자</th>
  <td>
    <input id="in1" type="text" name="indate" value="<%=indate %>">
  </td>
</tr>

<tr>
 <th width="20%">대출상태</th>
 <td>
 <input type="radio" value="1" name="status" <%= status.equals("1")?"checked":"" %>>대출
 <input type="radio" value="2" name="status" <%= status.equals("2")?"checked":"" %>>반납
 </td>
 <th width="20%">등급</th>
 <td>
 <select name="class1">
 <option value="S" <%=class1.equals("S")? "selected":"" %>>S</option>
 <option value="A" <%=class1.equals("A")? "selected":"" %>>A</option>
 <option value="B" <%=class1.equals("B")? "selected":"" %>>B</option>
 <option value="C" <%=class1.equals("C")? "selected":"" %>>C</option>
 
 </select> 
</td>
</tr>

<tr>
 <td colspan=4 align="center">
 <input id="btn2" type="submit" value="수정" onclick="check()">
 <input id="btn2" type="reset" value="취소">
 </td>
</tr>


</table>
<%}

	   
   }catch(SQLException e){
	   System.out.println("조회 실패");
   }
 %>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>