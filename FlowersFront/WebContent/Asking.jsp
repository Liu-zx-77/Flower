<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>ο��̽��</title>
<script type="text/javascript">
	function showChild(obj) {
		//var ul1 = document.getElementById("a");
		//var showBtn = document.getElementById("showPic");
		var img = obj.getElementsByTagName('div')[0];
		var button = obj.getElementsByTagName('a')[0];
		if (button.style.display == "block") {
			button.style.display = "none";
			img.style.display='block';
		} else {
			button.style.display = "block";
			img.style.display='none';
		}
	}
</script>
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
				<h4>ο��̽��</h4>
			</div>
			<hr style="color: #24D369" />
		</div>





		<%
			request.setCharacterEncoding("GBK");
			response.setCharacterEncoding("GBK");
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String username = "root";
			String password = "6482";

			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username,
					password);
			Statement stmt = conn.createStatement();
			String sql = "SELECT goodsId,goodsName,goodsMaterial,goodsPackage,goodsLanguage,goodsPrice,goodsPlace,imageId FROM goods Where  sortName LIKE'%ο��̽��%'";
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
				<td>��Ʒ��</td>
				<td>��Ʒ��</td>
				<td>��Ʒ����</td>
				<td>��Ʒ��װ</td>
				<td>��Ʒ��������</td>
				<td>��Ʒ�۸�</td>
				<td>��ƷӦ�÷�Χ</td>
				<td>�鿴��Ƭ</td>
				<td>�Ƿ���</td>


			</tr>
			<%
				request.setCharacterEncoding("GBK");
				response.setCharacterEncoding("GBK");
				while (i < pageSize && !rs.isAfterLast()) {

					int goodsId = rs.getInt(1);
					String goodsName = rs.getString(2);
					String goodsMaterial = rs.getString(3);
					String goodsPackage = rs.getString(4);
					String goodsLanguage = rs.getString(5);
					String goodsPrice = rs.getString(6);
					String goodsPlace = rs.getString(7);
					String imageId = rs.getString(8);
			%>
			<tr>
				<td><%=goodsId%></td>
				<td><%=goodsName%></td>
				<td><%=goodsMaterial%></td>
				<td><%=goodsPackage%></td>
				<td><%=goodsLanguage%></td>
				<td><%=goodsPrice%></td>
				<td><%=goodsPlace%></td>
				<td onclick="showChild(this)">
					<div style="display: none;">
						<img src="<%=imageId%>" />
					</div>
					<a style="display: block;">����鿴</a>
				</td>

				<td><a href="Buy.jsp?name=<%=goodsId%>&price=<%=goodsPrice%>">���빺�ﳵ</a></td>
			</tr>

			<%
		
				out.println("<br>");
					rs.next();
					i++;
				}
			%>
		</table>
	</div>
	<%
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("        ");
		if (list_notice < pageCount) {
			out.println(" <a href=Asking.jsp?list_notice="
					+ (list_notice + 1) + ">[��һҳ] </a>");
		}

		if (list_notice > 1) {
			out.println(" <a href=Asking.jsp?list_notice="
					+ (list_notice - 1) + ">[��һҳ] </a>");
		}
		out.println("        ");
		out.println("��" + pageCount + "ҳ");
		out.println("        ");
		out.println("��" + list_notice + "ҳ");
		out.println("        ");
		out.println(" <a href=Asking.jsp?list_notice=" + 1 + ">����ҳ�� </a>");
		out.println("        ");
		out.println(" <a href=Asking.jsp?list_notice=" + pageCount
				+ ">��βҳ�� </a>");

		rs.close();
		stmt.close();
		conn.close();
	%>

</body>
</html>