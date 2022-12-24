
<%@page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String fn = request.getParameter("fname");
	String ln = request.getParameter("lname");
	String gender = request.getParameter("gender");
	String category = request.getParameter("category");
	String regno = request.getParameter("regno");
	String year = request.getParameter("year");
	String branch = request.getParameter("branch");
	String ayear = request.getParameter("ayear");
	String pyear = request.getParameter("pyear");
	String phoneNo = request.getParameter("pno");
	String emailId = request.getParameter("email");
	String Raddress = request.getParameter("Raddress");
	String qualification = request.getParameter("qualification");
	String profile = request.getParameter("profile");
	String pass = request.getParameter("password");
	String SecurityQues = request.getParameter("securityQues");
	String SecurityAns = request.getParameter("securityAns");
	String type = request.getParameter("type");
	String cname = request.getParameter("cname");
	String designation = request.getParameter("designation");
	String ctc = request.getParameter("ctc");
	String Oaddress = request.getParameter("Oaddress");
	String Joining = request.getParameter("Jyear");
	String Leaving = request.getParameter("Lyear");
	String coursepursuing = request.getParameter("coursepursuing");
	String iname = request.getParameter("iname");
	String Iaddress = request.getParameter("Iaddress");

	System.out.println(fn + "," + ln  + "," + gender + "," + regno + "," + branch + "," + year + ","
			+ phoneNo + "," + emailId + "," + Raddress + "," + qualification + "," + profile + "," + pass + "," + SecurityQues + "," + SecurityAns + ","
			+ type + "," + cname + "," + designation + "," + Oaddress + "," + Joining + "," + Leaving + ","
			+ coursepursuing + "," + iname + "," + Iaddress+","+category+","+ayear+","+pyear+","+ctc);

	Connection connection = DBUtil.createConnection();

	String query = "INSERT IGNORE INTO alumni.registration(f_name,l_name,gender,registration_no,branch,year_of_registration,phone_no,email,residential_address,qualification,current_profile,password,security_ques,security_ans,course_pursuing,i_name,institute_address,year_of_admission,year_of_passing,category) VALUES ('"
			+ fn + "','" + ln + "','" + gender + "','" + regno + "','" + branch + "','" + year
			+ "','" + phoneNo + "','" + emailId + "','" + Raddress + "','" + qualification + "','" + profile
			+ "','" + pass +  "','" + SecurityQues + "','" + SecurityAns +"','" + coursepursuing + "','" + iname + "','" + Iaddress + "','" + ayear + "','" + pyear + "','" + category + "');";

	System.out.println(query);
	Statement stmt = connection.createStatement();
	int r = stmt.executeUpdate(query);

	String query3 = "select max(alumniID) from alumni.registration;";
	System.out.println(query3);
	Statement stmt3 = connection.createStatement();
	ResultSet rs3 = stmt3.executeQuery(query3);

	if (rs3.next()) {
		int aId = rs3.getInt("max(alumniID)");
		
		if (type != "") {
			if (r == 1) {
				String query4 = "INSERT INTO alumni.job(type,c_name,designation,official_address,joiningYear,leavingYear,ctc) VALUES ('"
						+ type + "','" + cname + "','" + designation + "','" + Oaddress + "','" + Joining
						+ "','" + Leaving + "','" + ctc + "');";

				System.out.println(query4);
				int r4 = stmt.executeUpdate(query4);

				if (r4 == 1) {
					String query5 = "select max(jobID) from alumni.job;";
					System.out.println(query5);
					Statement stmt5 = connection.createStatement();
					ResultSet rs5 = stmt5.executeQuery(query5);

					if (rs5.next()) {
						int jId = rs5.getInt("max(jobID)");

						String query6 = "INSERT INTO alumni.job_alumni_mapper (jobID,alumniID) VALUES ('" + jId
								+ "','" + aId + "');";
						System.out.println(query6);
						Statement stmt4 = connection.createStatement();
						int r6 = stmt4.executeUpdate(query6);
						stmt4.close();
					}
					stmt5.close();
				}
			}
		}
		String query2 = "INSERT INTO alumni.login (alumniID,registration_no,password) VALUES ('" + aId + "','"
				+ regno + "','" + pass + "');";
		System.out.println(query2);

		Statement stmt2 = connection.createStatement();
		int r2 = stmt2.executeUpdate(query2);
		if (r2 == 1 && r == 1) {
			out.println("<script>alert('YOU HAVE BEEN REGISTERED SUCCESSFULLY!!!')</script>");
			out.println("<meta http-equiv='refresh' content='1;URL=../jsp/addImg.jsp'>");
		} else {
			out.println("<script>alert('YOU ARE ALREADY REGISTERED!!!')</script>");
			out.println("<meta http-equiv='refresh' content='1;URL=../jsp/alumniMain.jsp'>");
		}
		stmt2.close();

		stmt3.close();
	}
	stmt.close();
	if (connection != null) {
		connection.close();
	}
%>