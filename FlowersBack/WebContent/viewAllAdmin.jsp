<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<center>
		<h1>�鿴���й���Ա</h1>
		<%
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String username = "root";
			String password = "6482";

			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username,password);
			Statement stmt = conn.createStatement();
			String sql = "select adminId,adminName,adminPass from  admin";
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
				<td>����ԱID</td>
				<td>����Ա����</td>
				<td>����</td>


			</tr>
			<%
				while (i < pageSize && !rs.isAfterLast()) {
					int adminId = rs.getInt(1);
					String adminName = rs.getString(2);
					String adminPass = rs.getString(3);
			%>
			<tr>
				<td><%=adminId%></td>
					<td><%=adminName%></td>
					<td><%=adminPass%></td>
				<td><a href="deleteAdminSuccess.jsp?id=<%=adminId%>">ɾ��</a></td>
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
				out.println(" <a href=viewAllAdmin.jsp?list_notice="
						+ (list_notice + 1) + ">[��һҳ] </a>");
			}

			if (list_notice > 1) {
				out.println(" <a href=viewAllAdmin.jsp?list_notice="
						+ (list_notice - 1) + ">[��һҳ] </a>");
			}
			out.println("        ");
			out.println("��" + pageCount + "ҳ");
			out.println("        ");
			out.println("��" + list_notice + "ҳ");
			out.println("        ");
			out.println(" <a href=viewAllAdmin.jsp?list_notice=" + 1 + ">����ҳ�� </a>");
			out.println("        ");
			out.println(" <a href=viewAllAdmin.jsp?list_notice=" + pageCount
					+ ">��βҳ�� </a>");

			rs.close();
			stmt.close();
			conn.close();
		%>
	</center>
</body>
</html>