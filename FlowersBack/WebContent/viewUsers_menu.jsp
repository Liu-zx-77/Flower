<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="viewUsersByUsersId.jsp" method="post" name="form1" id="form1" style="text-align: center; margin-top: 300">
  <p align="center" class="style1">�� <a href="viewAllusers.jsp"> �鿴����ע���û�</a></p>
  <p align="center" class="style1">�� <span class="style4">���û��Ž��в��ң�</span>  
    <input name="category" type="text" id="category">
    <input type="submit" name="Submit" value="����">
</p>
</form>
<form action="viewUsersByUserName.jsp" method="post" name="form2" id="form2" style="text-align: center;">

  <p align="center" class="style1">�� <span class="style4">���û������в��ң�</span>    
    <input name="category2" type="text" id="category2">
    <input type="submit" name="Submit2" value="����">

  </p>

</form>
</center>
</body>
</html>