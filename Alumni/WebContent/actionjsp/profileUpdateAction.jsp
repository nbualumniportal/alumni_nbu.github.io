<%@ page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	System.out.println(session);

	if (session.getAttribute("alumniID") == null) {
		response.sendRedirect("../jsp/alumniMain.jsp");
	} else {

		Connection connection = DBUtil.createConnection();
		int alumniID = (int) session.getAttribute("alumniID");
		String fn = request.getParameter("fname");
		String ln = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String branch = request.getParameter("branch");
		String year = request.getParameter("year");
		String ayear = request.getParameter("ayear");
		String pyear = request.getParameter("pyear");
		String category = request.getParameter("category");
		String phoneNo = request.getParameter("pno");
		String emailId = request.getParameter("email");
		String Raddress = request.getParameter("Raddress");
		String qualification = request.getParameter("qualification");
		String profile = request.getParameter("profile");
		String type = request.getParameter("type");
		String cname = request.getParameter("cname");
		String designation = request.getParameter("designation");
		String ctc = request.getParameter("ctc");
		String Oaddress = request.getParameter("Oaddress");
		String Joining = request.getParameter("Jyear");
		String Leaving = request.getParameter("Lyear");
		String type1 = request.getParameter("type1");
		String cname1 = request.getParameter("cname1");
		String designation1 = request.getParameter("designation1");
		String ctc1 = request.getParameter("ctc1");
		String Oaddress1 = request.getParameter("Oaddress1");
		String Joining1 = request.getParameter("Jyear1");
		String Leaving1 = request.getParameter("Lyear1");
		String coursepursuing = request.getParameter("coursepursuing");
		String iname = request.getParameter("iname");
		String Iaddress = request.getParameter("Iaddress");

		String query1 = "UPDATE alumni.registration set f_name=" + "'" + fn + "'" + " , l_name=" + "'" + ln
				+ "'"  + ", gender=" + "'" + gender + "'" + ", branch=" + "'" + branch + "'" + ", year_of_registration=" + "'" + year
				+ "'" + ", category=" + "'" + category + "'" + ", year_of_admission=" + "'" + ayear + "'"+ ", year_of_passing=" + "'" + pyear
				+ "'" + ", phone_no=" + "'" + phoneNo + "'" + ", email=" + "'" + emailId + "'"
				+ ", residential_address=" + "'" + Raddress + "'" + ", qualification=" + "'" + qualification
				+ "'" + ", current_profile=" + "'" + profile + "'" + ", course_pursuing= " + "'"
				+ coursepursuing + "'" + ", i_name=" + "'" + iname + "'" + ", institute_address=" + "'"
				+ Iaddress + "'" + "  where alumniID=" + alumniID + ";";

		System.out.println(query1);
		Statement stmt = connection.createStatement();
		int r1 = stmt.executeUpdate(query1);
		if (Leaving!="") {
			String query2 = "select max(jobID) from alumni.job_alumni_mapper where alumniID=" + alumniID + ";";
			System.out.println(query2);
			Statement stmt2 = connection.createStatement();
			ResultSet rs2 = stmt2.executeQuery(query2);
			if (rs2.next()) {
				int jobID = rs2.getInt("max(jobID)");

				String query3 = "UPDATE alumni.job set type=" + "'" + type + "'" + " , c_name=" + "'" + cname
						+ "'" + ", designation=" + "'" + designation + "'" + ", official_address=" + "'"
						+ Oaddress + "'" + ", joiningYear=" + "'" + Joining + "'" + ", leavingYear=" + "'"
						+ Leaving + "'" +", ctc=" + "'"+ ctc + "'" + "  where jobID=" + jobID + ";";
				System.out.println(query3);
				Statement stmt3 = connection.createStatement();
				int r3 = stmt3.executeUpdate(query3);
System.out.println(type1);
if(type1!="")
{
	String query4 = "INSERT INTO alumni.job(type,c_name,designation,official_address,joiningYear,leavingYear,ctc) VALUES ('"
			+ type1 + "','" + cname1 + "','" + designation1 + "','" + Oaddress1 + "','" + Joining1
			+ "','" + Leaving1 + "','" + ctc1 + "');";
	Statement stmt4 = connection.createStatement();
	System.out.println(query4);
	int r4 = stmt4.executeUpdate(query4);
	if (r4 == 1) {
		String query5 = "select max(jobID) from alumni.job;";
		System.out.println(query5);
		Statement stmt5 = connection.createStatement();
		ResultSet rs5 = stmt5.executeQuery(query5);

		if (rs5.next()) {
			int jId = rs5.getInt("max(jobID)");

			String query6 = "INSERT INTO alumni.job_alumni_mapper (jobID,alumniID) VALUES ('" + jId
					+ "','" + alumniID + "');";
			System.out.println(query6);
			int r6 = stmt4.executeUpdate(query6);
			
		}
		stmt5.close();
	}

	stmt4.close();
}
				if (r1 == 1 || r3 == 1) {
					out.println("<script>alert('YOU HAVE SUCCESSFULLY UPDATED YOUR PROFILE!!!')</script>");
					out.println("<meta http-equiv='refresh' content='1;URL=../jsp/profileView.jsp'>");
				}
				stmt3.close();
			}
			stmt2.close();
			
		}
		
		if (type != "" && Leaving=="") {
			String query7 = "INSERT INTO alumni.job(type,c_name,designation,official_address,joiningYear,leavingYear) VALUES ('"
					+ type + "','" + cname + "','" + designation + "','" + Oaddress + "','" + Joining
					+ "','" + Leaving + "');";
			Statement stmt7 = connection.createStatement();
			System.out.println(query7);
			int r7 = stmt7.executeUpdate(query7);
			if (r7 == 1) {
				String query8 = "select max(jobID) from alumni.job;";
				System.out.println(query8);
				Statement stmt8 = connection.createStatement();
				ResultSet rs8 = stmt8.executeQuery(query8);

				if (rs8.next()) {
					int jId = rs8.getInt("max(jobID)");

					String query9 = "INSERT INTO alumni.job_alumni_mapper (jobID,alumniID) VALUES ('" + jId
							+ "','" + alumniID + "');";
					System.out.println(query9);
					int r9 = stmt7.executeUpdate(query9);
					if(r9==1 && r1==1)
					{
						out.println("<script>alert('YOU HAVE SUCCESSFULLY UPDATED YOUR PROFILE!!!')</script>");
						out.println("<meta http-equiv='refresh' content='1;URL=../jsp/profileView.jsp'>");
					}
					
				}
				stmt8.close();
			}

			stmt7.close();
		}
		stmt.close();
		if (connection != null) {
			connection.close();
		}
	}
%>