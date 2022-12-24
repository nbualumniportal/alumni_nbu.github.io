<%@page import="org.rimpa.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%
Connection connection = DBUtil.createConnection();
String regno="",fname="",lname="",gender="",pno="",email="",pic="",branch="",Yreg="",Raddress="",profile="",qualification="",Lyear="",category="",Ypass="not set",Yadm="";
String query1,query2,filename="";
String str2 = "",str3="",str4="",str5="";
int alumniID = (int) session.getAttribute("alumniID");

	
	
String query = "SELECT * FROM alumni.registration where alumniID=" + "'" + alumniID + "'" + ";";
System.out.println(query);
Statement stmt = connection.createStatement();
ResultSet rs = stmt.executeQuery(query);
if (rs.next()) {
	
regno=rs.getString("registration_no");
fname=rs.getString("f_name");
lname=rs.getString("l_name");
gender=rs.getString("gender");
pno=rs.getString("phone_no");
email=rs.getString("email");
category=rs.getString("category");
branch=rs.getString("branch");

Yreg=rs.getString("year_of_registration");
Ypass=rs.getString("year_of_passing");
Yadm=rs.getString("year_of_admission");
Raddress=rs.getString("residential_address");
profile=rs.getString("current_profile");
qualification=rs.getString("qualification");

String queryimg,queryimg2;
Blob blob;
	queryimg = "Select imageID from alumni.alumni_image_mapper where alumniID=" + "'" + alumniID + "'" + ";";
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
	fos.flush();
	fos.close();
		}
		stmt4.close();
	}
	stmt3.close();
	
	
System.out.println(profile);
if(profile.equals("Higher Education"))
{
	str4="<div class='heading'>"+"<div class='headWrap'>"+"Higher Education Details"+"</div>"+"<div class='arrow'>"+"</div>"+"</div>"+
			"<div class='details'>"+
			"<table>"+
						(str5 += "<tr>" + "<td>" + "<div class='label'>" + "Course pursuing :" + "</div>"
								+ "</td>" + "<td>" + "<div class='label'>" +rs.getString("course_pursuing") + "</div>"
								+ "</td>" + "</tr>" +
								"<tr>" + "<td>" + "<div class='label'>" + "Institute/University Name :" + "</div>"
								+ "</td>" + "<td>" + "<div class='label'>" +rs.getString("i_name") + "</div>"
								+ "</td>" + "</tr>" +
								"<tr>" + "<td>" + "<div class='label'>" + "Address of Institute/University :" + "</div>"
								+ "</td>" + "<td>" + "<div class='label'>" +rs.getString("institute_address") + "</div>"
								+ "</td>" + "</tr>") + "</table>"+"</div>";
}
}

stmt.close();

query1 = "SELECT jobID from alumni.job_alumni_mapper where alumniID=" + "'" + alumniID + "'" + ";";
Statement stmt1 = connection.createStatement();
ResultSet rs1 = stmt1.executeQuery(query1);

while (rs1.next()) {
	int jId = rs1.getInt("jobID");
	System.out.println(jId);
	query2 = "SELECT * FROM alumni.job where jobID=" + "'" + jId + "'" + ";";
	Statement stmt2 = connection.createStatement();
	ResultSet rs2 = stmt2.executeQuery(query2);
	while (rs2.next()) {
		Lyear=rs2.getString("leavingYear");
		if(Lyear.equals(""))
		{
			Lyear="Present";
		}
		str3="<div class='heading'>"+"<div class='headWrap'>"+"Employment Details"+"</div>"+"<div class='arrow'>"+"</div>"+"</div>"+
		"<div class='details'>"+
		"<table>"+
		
					(str2 += "<tr>" + "<td>" + "<div class='label'>" + "Type of Employement :" + "</div>"
							+ "</td>" + "<td>" + "<div class='label'>" + rs2.getString("type") + "</div>"
							+ "</td>" + "</tr>" + "<tr>" + "<td>" + "<div class='label'>"
							+ "Company/ Institution Name :" + "</div>" + "</td>" + "<td>"
							+ "<div class='label'>" + rs2.getString("c_name") + "</div>" + "</td>" + "</tr>"
							+ "<tr>" + "<td>" + "<div class='label'>" + "Designation :" + "</div>" + "</td>"
							+ "<td>" + "<div class='label'>" + rs2.getString("designation") + "</div>" + "</td>"
							+ "</tr>" + "<tr>" + "<td>" + "<div class='label'>" + "Official Address :"
							+ "</div>" + "</td>" + "<td>" + "<div class='label'>"
							+ rs2.getString("official_address") + "</div>" + "</td>" + "</tr>" + 
									"<tr >" + "<td>"+"<div class='label'>" + "Period of Association :"+ "</div>"+"</td>"+"<td>"+ "<div class='label'>" 
							+ rs2.getString("joiningYear") + " - "  + Lyear+"</div>"+ "</td>"
							+ "</tr>"+"<tr>"+"<td>"+"</td>"+"</tr>")+ "</table>"+"</div>";
				
		}
		stmt2.close();
	}

	stmt1.close();

%>

<!DOCTYPE html>
<html>
<head>
<title>PROFILE VIEW</title>
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
	href="../css/profileView.css">
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
			<marquee class="disclaimer" direction="left" scrollamount="7">After updating your image , please press F5 to view your updated picture !!</marquee>
			
			
			<div class="buttons"><a href="../jsp/profileUpdate.jsp" id="view" class="linkbutton" style="text-decoration:none">UPDATE</a>
			<a href="../actionjsp/logoutaction.jsp" class="logoutbutton">LOGOUT</a></div>
			<div class="detailHeading">YOUR DETAILS:</div>
			<div class="box">
				<div class="main">
			<img class="profileImg" style="height:110px; width:110px" src="<%=filename %>" style="object-fit:cover">
			
			<div class="mainDetails">
			<div class="text1"><%=fname %> <%=lname %></div>
			<div class="text2">Mobile: <%=pno %></div>
			<div class="text2">Email: <%=email %></div>
			</div>
			</div>
			<a href="../jsp/updateImg.jsp" class="updatebutton">Update Image</a>
			<div class="innerbox">
			<div class="heading"><div class="headWrap">Basic Details</div><div class="arrow"></div></div>
			<div class="details">
			<table>
			<tr>
			<td><div class="label">Registration No:</div></td>
			<td><div class="label"><%=regno %>  </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Year of Registration:</div></td>
			<td><div class="label"><%=Yreg %> </div></td>
		    </tr>
			<tr>
			<td><div class="label">Gender:</div></td>
			<td><div class="label"><%=gender %>  </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Category:</div></td>
			<td><div class="label"><%=category %>  </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Branch:</div></td>
			<td><div class="label"><%=branch %> </div></td>
		    </tr>
		   <tr>
			<td><div class="label">Year of Addmision:</div></td>
			<td><div class="label"><%=Yadm %> </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Year of Passing:</div></td>
			<td><div class="label"><%=Ypass %> </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Residential Address:</div></td>
			<td><div class="label"><%=Raddress %> </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Highest Qualification:</div></td>
			<td><div class="label"><%=qualification %> </div></td>
		    </tr>
		    <tr>
			<td><div class="label">Current Profile:</div></td>
			<td><div class="label"><%=profile %> </div></td>
		    </tr>
		</table>
			</div>
			<%=str3 %>
			<%=str4 %>
			</div>
			</div>
			
			
			</div>
			<div class="bottom">
			<div class="contact">
				<div class="cdetails">Contact Details:</div>
				<div class="divsec1"></div>
				<div class="particular">
					<div class="Icon2">
						<img src="../image/phone.png"
							height="17px" width="17px" alt="">
					</div>
					<div class="txt">+91 353-2776344</div>
				</div>
				<div class="divsec2"></div>

				<div class="particular">
					<div class="Icon2">
						<img src="../image/mail.png"
							height="17px" width="17px" alt="">
					</div>
					<div class="txt">office.csa.nbu@gmail.com, comp_sc@nbu.ac.in</div>
				</div>
				<div class="divsec2"></div>

				<div class="particular">
					<div class="Icon2">
						<img src="../image/fax.png"
							height="17px" width="17px" alt="">
					</div>
					<div class="txt">+91 353 277 63</div>
				</div>
				<div class="divsec2"></div>

				<div class="particular">
					<div class="Icon2">
						<img src="../image/location.png"
							height="17px" width="17px" alt="">
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