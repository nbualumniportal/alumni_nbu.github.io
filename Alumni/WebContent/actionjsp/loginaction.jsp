<%@ page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String regno = request.getParameter("regno");
	String pass = request.getParameter("password");
	session.setAttribute("regno", regno);
	Connection connection = DBUtil.createConnection();
	String query = "SELECT * FROM alumni.login where registration_no='" + regno + "' and password='" + pass
			+ "';";
	System.out.print(query);

	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(query);

	if (rs.next()) {
		int alumniID = rs.getInt("alumniID");
		String query1 = "SELECT * FROM alumni.registration where registration_no='" + regno + "';";
		System.out.print(query1);
		Statement stmt1 = connection.createStatement();
		ResultSet rs1 = stmt1.executeQuery(query1);
		if (rs1.next()) {
			String fname = rs1.getString("f_name");
			String lname = rs1.getString("l_name");

			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
		}
		session.setAttribute("alumniID", alumniID);
		stmt1.close();
		response.sendRedirect("../jsp/profileView.jsp");
	}

	else {
		out.println("<script>alert('Please enter password and registration number correctly !!!')</script>");
		out.println("<meta http-equiv='refresh' content='1;URL=../jsp/alumniMain.jsp'>");
	}
	if (connection != null) {
		connection.close();
	}
%>