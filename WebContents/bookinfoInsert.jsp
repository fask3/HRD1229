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
    	alert("등록이 완료되었습니다.");
    }
  }

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h1>도서 정보 등록 화면</h1>
<form name="form" method="post" action="bookinfoInsertProcess.jsp">
<table border=1 id="tab1">

<tr>
 <th width="20%">도서코드</th>
 <td>
 <input id="in1" type="text" name="bookno">
 </td>
</tr>
<tr>
 <th width="20%">저자</th>
 <td>
 <input id="in1" type="text" name="author">
 </td>
</tr>
<tr>
 <th width="20%">도서이름</th>
 <td>
 <input id="in1" type="text" name="bookname">
 </td>
</tr>
<tr>
 <td colspan=2 align="center">
 <input id="btn1" type="button" value="등록" onclick="check()">
 <input id="btn1" type="reset" value="취소">
 </td>
</tr>


</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>