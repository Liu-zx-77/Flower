<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="java.sql.*"%> 
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
		 String username=request.getParameter("username");
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
				String sql = "SELECT leaveLanguageId,leaveLanguageName,leaveLanguage,leaveLanguageTime FROM leavelanguage WHERE leaveLanguageName LIKE '%"+ username + "%'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
		<center>
			<table border="1" width="90%">
				<!-- �����  tr -->
				<tr>
					<td>������� </td>
					<td>������</td>
					<td>��������</td>
					<td>����ʱ��</td>
				</tr>
				<%
					while (rs.next()) {
						int leaveLanguageId = rs.getInt(1);
						String leaveLanguageName = rs.getString(2);
						String leaveLanguage = rs.getString(3);
						String leaveLanguageTime = rs.getString(4);
				
							 
				%>
				<tr>
					<td><%=leaveLanguageId%></td>
					<td><%=leaveLanguageName%></td>
					<td><%=leaveLanguage%></td>
					<td><%=leaveLanguageTime%></td>
					<td><a href="deleteLanguageSuccess.jsp?id=<%=leaveLanguageId%>">ɾ��</a></td>
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