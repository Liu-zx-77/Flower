<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�ҵĶ���</title>
<style>
#main {
	margin: 5px auto;
	width: 940px;
	background: transparent;
	padding-bottom: 30px;
}
body {
	background:black;
	font-family: 'PT Sans', Helvetica, Arial, sans-serif;
	color: #fff;
}
</style>
</head>
<body>
<div id="main">
		<div>
			<div id="logo_text">

				<h1>
					<a href="Home.html" style="text-decoration: none">���ϻ���</a>
				</h1>
				<h4>�ҵĶ���</h4>
			</div>
			<hr style="color: #24D369" />
		</div>
	<center>
		<%
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String username = "root";
			String password = "6482";

			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username,
					password);
			Statement stmt = conn.createStatement();
			String sql = "select ordersId,ordersName,ordersPrice,ordersDatetime from  orders WHERE status =1";
			ResultSet rs = stmt.executeQuery(sql);
			rs.last();

			int pageSize = 5; //ÿҳ��ʾ�ļ�¼�� 
			int pageCount = 0; //��ҳ�� 
			int rowCount = rs.getRow(); //��ȡ��¼����
			//out.println(rowCount);
			pageCount = (rowCount + pageSize - 1) / pageSize;
			int list_notice = 1; //��ǰҳ 
			//ȡ���û���ָ����ҳ 
			String goToPage = request.getParameter("list_notice");
			if (goToPage == null) {
				goToPage = "1";
			}
			//ת�������� 
			try {
				list_notice = Integer.parseInt(goToPage);
			} catch (NumberFormatException ex) {
				list_notice = 1;
			}
			//��ǰҳС�ڵ��ڵ�һҳ �򰴵�һҳ�� ��� ��ǰҳ���ڵ�����ҳ����Ϊ���ҳ 
			if (list_notice <= 1) {
				list_notice = 1;
			} else if (list_notice >= pageCount) {
				list_notice = pageCount;
			}
			//�α��λ�� (��ǰҳ - 1) * ҳ���С + 1 
			int posion = (list_notice - 1) * pageSize + 1;
			//�����α��λ�� 
			rs.absolute(posion);
			//ѭ����ʾ���е����� pageSize(ÿҳ����ʾ�ļ�¼) 
			//rs.isAfterLast() �α��Ƿ������һ��֮�� ˵�������Ѿ�û��¼ 
			int i = 0;
		%>
		<table border="1">
			<tr>
				<td>������</td>
				<td>������</td>
				<td>�����۸�</td>
				<td>�µ�ʱ��</td>


			</tr>
			<%
				while (i < pageSize && !rs.isAfterLast()) {
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
				<td><a href="viewOrders.jsp?id=<%=orderdId%>">֧��</a></td>
				<td><a href="deleteOrderSuccess.jsp?id=<%=orderdId%>">ɾ��</a></td>
			</tr>

			<%
				out.println("<br>");
					rs.next();
					i++;
				}
			%>
		</table>
		<%
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("        ");
			if (list_notice < pageCount) {
				out.println(" <a href=viewOrders.jsp?list_notice="
						+ (list_notice + 1) + ">[��һҳ] </a>");
			}

			if (list_notice > 1) {
				out.println(" <a href=viewOrders.jsp?list_notice="
						+ (list_notice - 1) + ">[��һҳ] </a>");
			}
			out.println("        ");
			out.println("��" + pageCount + "ҳ");
			out.println("        ");
			out.println("��" + list_notice + "ҳ");
			out.println("        ");
			out.println(" <a href=viewOrders.jsp?list_notice=" + 1 + ">����ҳ�� </a>");
			out.println("        ");
			out.println(" <a href=viewOrders.jsp?list_notice=" + pageCount
					+ ">��βҳ�� </a>");

			rs.close();
			stmt.close();
			conn.close();
		%>
	</center>
</body>
</html>