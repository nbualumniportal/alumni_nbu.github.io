<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%
	String str = "", str4 = "", str2 = "", str5 = "", str3 = "", str6 = "",filename="";
	String query, query1, query2, Lyear = "", profile, queryimg, queryimg2;
	
	Blob blob;

	int flag = 0;
	String s = request.getParameter("searchbar");
	String c = request.getParameter("category");
	System.out.println(s);
	String t = s.trim();
	System.out.println(c);
	Connection connection = DBUtil.createConnection();
	if (c.equalsIgnoreCase("branch")) {
		query = "SELECT * FROM alumni.registration where branch=" + "'" + t + "'" + ";";

	} else if (c.equalsIgnoreCase("name")) {

		if (t.contains(" ")) {
			String[] newS = t.split(" ");
			String first = newS[0];
			String last = newS[1];
			System.out.println(first);
			System.out.println(last);
			query = "SELECT * FROM alumni.registration where f_name=" + "'" + first + "'" + "and l_name=" + "'"
					+ last + "'" + ";";

		} else {
			System.out.println(s);
			query = "SELECT * FROM alumni.registration where f_name=" + "'" + t + "'" + ";";
		}
	} 
 else if (c.equalsIgnoreCase("pyear")) {
	query = "SELECT * FROM alumni.registration where year_of_passing=" + "'" + t + "'" + ";";
} 
	else {
		query = "SELECT * FROM alumni.registration where year_of_admission=" + "'" + t + "'" + ";";
	}
	
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
		flag = 1;
		int aId = rs.getInt("alumniID");
		String regno=rs.getString("registration_no");
		System.out.println("aId=" + aId);
		//img
		queryimg = "Select imageID from alumni.alumni_image_mapper where alumniID=" + "'" + aId + "'" + ";";
		Statement stmt3 = connection.createStatement();
		ResultSet rs3 = stmt3.executeQuery(queryimg);
		while (rs3.next()) {
			int imgID = rs3.getInt("imageID");
			System.out.println(imgID);
			queryimg2 = "SELECT * FROM alumni.img_upload where imgId=" + "'" + imgID + "'" + ";";
			Statement stmt4 = connection.createStatement();
			ResultSet rs4 = stmt4.executeQuery(queryimg2);
			while (rs4.next()) {
				blob=rs4.getBlob("pic");
				byte byteArray[]=blob.getBytes(1,(int)blob.length());
				FileOutputStream fos=new FileOutputStream("C:/Users/Rimpa Datta/eclipse-workspace/Alumni/WebContent/profileImg/"+regno+".png");
				fos.write(byteArray);
				filename="../profileImg/"+regno+".png";
				System.out.println(filename); 
			
			
				profile = rs.getString("current_profile");

				query1 = "SELECT jobID from alumni.job_alumni_mapper where alumniID=" + "'" + aId + "'" + ";";
				Statement stmt1 = connection.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1);
				while (rs1.next()) {
					int jId = rs1.getInt("jobID");
					System.out.println(jId);
					query2 = "SELECT * FROM alumni.job where jobID=" + "'" + jId + "'" + ";";
					Statement stmt2 = connection.createStatement();
					ResultSet rs2 = stmt2.executeQuery(query2);
					while (rs2.next()) {
						Lyear = rs2.getString("leavingYear");
						if (Lyear.equals("")) {
							Lyear = "Present";
						}
						str3 = "<div class='detailing'>" + "Employment Details" + "</div>"
								+ "<div class='innerTable'>" + "<table>"
								+ (str2 += "<tr>" + "<td>"
										+ "<div class='label' style='font-weight:bold; font-size:18px'>"
										+ rs2.getString("designation") + "</div>" + "</td>" + "</tr>" + "<tr>"
										+ "<td>" + "<div class='divsec5'>" + "</div>" + "</td>" + "</tr>"
										+ "<tr>" + "<td>" + "<div class='label'>" + rs2.getString("c_name")
										+ "</div>" + "</td>" + "</tr>" + "<tr>" + "<td>" + "<div class='label'>"
										+ rs2.getString("official_address") + "</div>" + "</td>" + "</tr>"
										+ "<tr >" + "<td>" + "<div class='label'>"
										+ rs2.getString("joiningYear") + " - " + Lyear + "</div>" + "</td>"
										+ "</tr>" + "<tr style='height:20px'>" + "<td>" + "</td>" + "</tr>")
								+ "</table>" + "</div>";
					}
					stmt2.close();
				}
				stmt1.close();

				if (profile.equals("Higher Education")) {
					str4 = "<div class='detailing'>" + "Higher Education Details" + "</div>"
							+ "<div class='innerTable'>" + "<table>"
							+ (str5 = "<tr>" + "<td>" + "<div class='label'>" + "Course pursuing :" + "</div>"
									+ "</td>" + "<td>" + "<div class='label'>" + rs.getString("course_pursuing")
									+ "</div>" + "</td>" + "</tr>" + "<tr>" + "<td>" + "<div class='label'>"
									+ "Institute/University Name :" + "</div>" + "</td>" + "<td>"
									+ "<div class='label'>" + rs.getString("i_name") + "</div>" + "</td>"
									+ "</tr>" + "<tr>" + "<td>" + "<div class='label'>"
									+ "Address of Institute/University :" + "</div>" + "</td>" + "<td>"
									+ "<div class='label'>" + rs.getString("institute_address") + "</div>"
									+ "</td>" + "</tr>")
							+ "</table>" + "</div>";

				}

				str += "<tr>" + "<td>" + "<table class='outerTable'>" + "<tr>" + "<td>" + "<div class='main'>"
						+ "<img class='profileImg' height='110px' width='110px' src='"+filename+"'>"
						+ "<div class='mainDetails'>" + "<div class='text1'>" + rs.getString("f_name") + "  "
						+ rs.getString("l_name") + " </div>" + "<div class='text2'>" + "Mobile: "
						+ rs.getString("phone_no") + "</div>" + "<div class='text2'>" + "Email: "
						+ rs.getString("email") + "</div>" + "</div>" + "</div>" + "</td>" + "</tr>" + "<tr>"
						+ "<td>" + "<div class='label'>" + "Highest Education: " + rs.getString("qualification")
						+ "</div>" + "</td>" + "</tr>" + "<tr>" + "<td>" + "<div class='label'>"
						+ "Current Profile: " + rs.getString("current_profile") + "</div>" + "</td>" + "</tr>"
						+ "<tr>" + "<td>" + str3 + "</td>" + "</tr>" + "<tr>" + "<td>" + str4 + "</td>"
						+ "</tr>" + "</table>" + "</td>" + "</tr>";
				System.out.println(str);
				str3 = "";
				str5 = "";
				str4 = "";
				str2 = "";
				System.out.print("flag=" + flag);
				fos.flush();
				fos.close();
				
		 	}
		stmt4.close();
	}
			stmt3.close(); 
	}
	if (flag == 0) {
		str6 = "<img class='error' src='../image/errorImg.png' height='220px' width='600px'>";
	}
	
	

	stmt.close();
	if (connection != null) {
		connection.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>SEARCH RESULT</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Asul&display=swap"
      rel="stylesheet"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Asul&display=swap");
    </style>
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" media="all"
	href="../css/searchAlumni.css">
</head>
<body>
	<div class="cover">
		<div class="head1">
			<div class="sub1">
				<img src="../image/nbulogo.png" width="140px" height="130px" alt="">
			</div>
			<div class="sub2">
				<div class="tag1">NORTH BENGAL UNIVERSITY</div>
				<div class="tag2">Accredited by NAAC with grade B+</div>
				<div class="tag3">Department of Computer Science and
					Technology</div>
			</div>
		</div>
		<div class="bdy">
			<div class="header">
				<div class="blinkmsg">
					<a class="alumnitext" href="../jsp/alumniMain.jsp">ALUMNI</a>
				</div>
			</div>

			<div class="box">
				<div class="heading">
					<div class="headWrap">
						<div class="arrow2"></div>
						<div class="Sresult">Your Search Results:</div>
					</div>
					<div class="arrow1"></div>
				</div>

				<table class="mTable">
					<!--<%=str%>
					<%=str6%>-->
				</table>
			</div>
		</div>
		<div class="bottom">
			<div class="contact">
				<div class="cdetails">Contact Details:</div>
				<div class="divsec1"></div>
				<div class="particular">
					<div class="Icon2">
						<img src="../image/phone.png" height="17px" width="17px" alt="">
					</div>
					<div class="txt">+91 353-2776344</div>
				</div>
				<div class="divsec2"></div>

				<div class="particular">
					<div class="Icon2">
						<img src="../image/mail.png" height="17px" width="17px" alt="">
					</div>
					<div class="txt">office.csa.nbu@gmail.com, comp_sc@nbu.ac.in</div>
				</div>
				<div class="divsec2"></div>

				<div class="particular">
					<div class="Icon2">
						<img src="../image/fax.png" height="17px" width="17px" alt="">
					</div>
					<div class="txt">+91 353 277 63</div>
				</div>
				<div class="divsec2"></div>

				<div class="particular">
					<div class="Icon2">
						<img src="../image/location.png" height="17px" width="17px" alt="">
					</div>
					<div class="txt">Department of Computer Science and
						Application, University of North Bengal, Raja Rammohunpur,
						P.O.-N.B.U., Dist-Darjeeling, West Bengal,Pin-734013</div>
				</div>
			</div>
			<div class="divsec3"></div>
			<div class="map">
				<div class="locate">LOCATE US WITH MAP</div>
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3564.05480848856!2d88.34900981456144!3d26.710695975188845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39e44668cd58131f%3A0x8cec0a941b9b8a32!2sDepartment%20of%20Computer%20Science!5e0!3m2!1sen!2sin!4v1653303379470!5m2!1sen!2sin"
					width="730" height="300" style="border: 0;"> </iframe>
			</div>
			<div class="divsec4"></div>
			<div class="foot">&copy; Copyright North Bengal University,
				Department of Computer Science and Technology</div>
		</div>

	</div>

</body>

</html>