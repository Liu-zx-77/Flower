<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
 <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<center>
        
		<%
		 request.setCharacterEncoding("GBK");
		 response.setCharacterEncoding("GBK");
		 String usename=request.getParameter("category2");
	
		 session.setAttribute("viewId", request.getParameter("category"));
		 String url = "jdbc:mysql://localhost:3306/backadmin";
		//���ݿ������û�
		 String user = "root";
		 String dbPassword = "6482";
	%>
		<%
			//�������ݿ����
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;//�������ݿ�����
		%>
		<%
			//try..catch�����������ݿ��ǲ������쳣
			try {
				Class.forName("org.gjt.mm.mysql.Driver");
				conn = DriverManager.getConnection(url, user, dbPassword);
				String sql = "SELECT usersId,usersName,usersTureName,usersPhone,usersAddress,usersE_mail FROM users WHERE usersName='"+ usename + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
		<center>
			<table border="1" width="90%">
				<!-- �����  tr -->
				<tr>
					<td>�û���</td>
					<td>�û���</td>
					<td>��ʵ����</td>
					<td>�绰</td>
					<td>��ַ</td>
					<td>Email</td>
					<td>ɾ�����û�</td>
				</tr>
				<%
					while (rs.next()) {

							int usersId = rs.getInt(1);
							String usersName = rs.getString(2);
							String usersTureName = rs.getString(3);
							String usersPhone = rs.getString(4);
							String usersAddress = rs.getString(5);
							String usersEmail = rs.getString(6);
							 
				%>
				<tr>
					<td><%=usersId%></td>
					<td><%=usersName%></td>
					<td><%=usersTureName%></td>
					<td><%=usersPhone%></td>
					<td><%=usersAddress%></td>
					<td><%=usersEmail%></td>
					<td><a href="deleteUserSuccess.jsp?username=<%=usename%>">ɾ��</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</center>
		<%
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				rs.close();
				pstmt.close();
				conn.close();

			}
		%>

	</center>
</body>
</html>