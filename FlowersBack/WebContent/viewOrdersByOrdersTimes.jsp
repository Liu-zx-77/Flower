<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
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
		 String orderstime=request.getParameter("orderstime");
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
				String sql = "SELECT ordersId,ordersName,ordersPrice,ordersDatetime FROM orders WHERE ordersDatetime LIKE '%"+ orderstime + "%'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
		<center>
			<table border="1" width="90%">
				<!-- �����  tr -->
				<tr>
					<td>������</td>
					<td>������</td>
					<td>�����۸�</td>
					<td>�µ�ʱ��</td>
				</tr>
				<%
					while (rs.next()) {
						int orderdId = rs.getInt(1);
						String ordersName = rs.getString(2);
						String orsersPrice = rs.getString(3);
						String ordersDatetime = rs.getString(4);
				
							 
				%>
				<tr>
					<td><%=orderdId%></td>
					<td><%=ordersName%></td>
					<td><%=orsersPrice%></td>
					<td><%=ordersDatetime%></td>
					<td><a href="deleteOrderSuccess.jsp?id=<%=orderdId%>">ɾ��</a></td>
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