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
    	form.action="reservationInsertProcess.jsp";
    }
  }
function changesubmit(){
	document.form.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
<%@ include file="DBConn.jsp" %>
<%
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   int no=0;
   
   try{
	   String sql="select reserv_seq.nextval from dual";
	   pstmt=conn.prepareStatement(sql);
	   rs=pstmt.executeQuery();
	   if(rs.next()){
		  no=rs.getInt(1); 
	   }
   }catch(SQLException e){
	   System.out.println("sequence 오류");
	   e.printStackTrace();
   }
   
   String bookno=request.getParameter("bookno");
   String custname=request.getParameter("custname");
   String indate=request.getParameter("indate");
   String outdate=request.getParameter("outdate");
   int sel=0;
   
   String t_bookno="",t_bookname="";
   if(bookno==null){
	   bookno="";
	   custname="";
	   indate="";
	   outdate="";
	   
   }else{
	   
   try{
	   String sql="select bookno,bookname from bookinfo1229 where bookno=?";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, bookno);
	   rs=pstmt.executeQuery();
	   if(rs.next()){
		   t_bookno=rs.getString(1);
		   t_bookname=rs.getString("bookname");
		   
		   
	   }else{
		   %>
		   <script>
		     alert("등로되지 않은 도서코드 입니다.");
		     
		   </script>
		   <% 
	   }
			   
   }catch(SQLException e){
	   System.out.println("bookinfo 테이블 오류");
	   e.printStackTrace();
   }
   
   }

%>
<h1>도서 대출 예약 정보 등록 화면</h1>
  <form name="form" method="post" action="reservationInsert.jsp">
    <table border=1 id="tab1">

      <tr>
        <th width="20%">대출번호</th>
        <td>
          <input id="in1" type="text" name="lentno" value="<%=no %>">
        </td>
      <th width="20%">고객성명</th>
        <td>
          <input id="in1" type="text" name="custname" value="<%=custname %>">
        </td>
      </tr>

<tr>
   <th width="20%">도서코드</th>
    <td>
      <input id="in1" type="text" name="bookno" value="<%=t_bookno %>" onchange="changesubmit();">
     </td>
    <th width="20%">도서이름</th>
    <td>
       <input id="in1" type="text" name="bookname" value="<%=t_bookname %>">
   </td>
</tr>

<tr>
  <th width="20%">대출일자</th>
  <td>
    <input id="in1" type="text" name="outdate" value="<%=outdate %>">
  </td>
  <th width="20%">반납일자</th>
  <td>
    <input id="in1" type="text" name="indate" value="<%=indate %>" onchange="changesubmit();"
    <%if(indate==""){sel=1;}else{sel=0;} %>>
  </td>
</tr>

<tr>
 <th width="20%">대출상태</th>
 <td>
 <input type="radio" value="1" name="status" <%if(sel==1){ %>checked<%} %>>대출
 <input type="radio" value="2" name="status" <%if(sel==0){ %>checked<%} %>>반납
 </td>
 <th width="20%">등급</th>
 <td>
 <select name="class1">
 <option value="s">S</option>
 <option value="A">A</option>
 <option value="B">B</option>
 <option value="C">C</option>

 </select> 
</td>
</tr>

<tr>
 <td colspan=4 align="center">
 <input id="btn2" type="submit" value="저장" onclick="check()">
 <input id="btn2" type="reset" value="취소">
 </td>
</tr>


</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>