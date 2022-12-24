<%@ page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	Connection connection = DBUtil.createConnection();
		String regno = request.getParameter("regno");
		String password=request.getParameter("password");
		String SecurityQues = request.getParameter("securityQues");
		String SecurityAns = request.getParameter("securityAns");
		 	String query = "UPDATE alumni.registration set password=" + "'" + password + "'"
			+ "  where registration_no=" + regno +  " and security_ques=" +"'" + SecurityQues + "'" +" and security_ans="
					+"'" + SecurityAns +"'" +  ";";
	
	System.out.println(query);
	Statement stmt = connection.createStatement();
	int r = stmt.executeUpdate(query);

	String query1 = "UPDATE alumni.login set password=" + "'" + password + "'" + "  where registration_no="
			+ regno + ";";
	System.out.println(query1);
	Statement stmt1 = connection.createStatement();
	int r1 = stmt1.executeUpdate(query1);
	if (r == 1 && r1 == 1) {
		out.println("<script>alert('YOU HAVE SUCCESSFULLY CHANGED YOUR PASSWORD!!! NOW YOU CAN LOGIN!!')</script>");
		out.println("<meta http-equiv='refresh' content='1;URL=../jsp/alumniMain.jsp'>");
	} else {
		out.println("<script>alert('COULD NOT CHANGE YOUR PASSWORD !!! PLEASE ENTER YOUR DETAILS CORRECTLY AS ASKED  !!!')</script>");
		out.println("<meta http-equiv='refresh' content='1;URL=../jsp/forgotPassword.jsp'>");
	}
	stmt.close();
	if (connection != null) {
		connection.close();
	}
%>
		
		