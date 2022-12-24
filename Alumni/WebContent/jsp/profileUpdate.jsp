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
	int alumniID = (int) session.getAttribute("alumniID");
	System.out.println(session.getAttribute("fname"));
	String phone = "", email = "", gender = "", Raddress = "",branch="",coursepursuing="",iname="",Iaddress="",Ryear="",qualification="",category="",profile="",Pyear="",Ayear="";
	String type="",cname="",designation="",Oaddress="",jYear="",lYear="",ctc="";
	
	String query = "select * from alumni.registration where alumniID=" + alumniID + ";";
	System.out.println(query);
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	if (rs.next()) {
		phone = rs.getString("phone_no");
		email = rs.getString("email");
		Raddress = rs.getString("residential_address");
		gender = rs.getString("gender");
		category=rs.getString("category");
		branch = rs.getString("branch");
		coursepursuing = rs.getString("course_pursuing");
		iname = rs.getString("i_name");
		Iaddress = rs.getString("institute_address");
		Ryear = rs.getString("year_of_registration");
		Ayear = rs.getString("year_of_admission");
		Pyear = rs.getString("year_of_passing");
		profile = rs.getString("current_profile");
		qualification = rs.getString("qualification");

		String query1 = "select max(jobID) from alumni.job_alumni_mapper where alumniID=" + alumniID + ";";
		System.out.println(query1);
		Statement stmt1 = connection.createStatement();
		ResultSet rs1 = stmt1.executeQuery(query1);
		while (rs1.next()) {
			int jobID = rs1.getInt("max(jobID)");

			String query2 = "select * from alumni.job where jobID=" + jobID + ";";
			System.out.println(query2);
			Statement stmt2 = connection.createStatement();
			ResultSet rs2 = stmt2.executeQuery(query2);
			if (rs2.next()) {
				type = rs2.getString("type");
				cname = rs2.getString("c_name");
				designation = rs2.getString("designation");
				Oaddress = rs2.getString("official_address");
				jYear = rs2.getString("joiningYear");
				lYear = rs2.getString("leavingYear");
				ctc= rs2.getString("ctc");
			}
			stmt2.close();
		}
		stmt1.close();
	}
	stmt.close();
%>


<!DOCTYPE html>
<html>
<head>
<title>PROFILE UPDATE</title>
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
<link rel="stylesheet" type="text/css" media="all"
	href="../css/profileUpdate.css">
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript">


	function add() 
{
		var c = document.getElementById("popup");
		c.classList.toggle("hide");
		c.classList.toggle("show");
	}
	$(document).ready(function(){
		$('#Lyear').on('input change',function()
				{
			if($(this).val()=='')
				{
				$('#jobButton').prop('disabled',true);
				}
			else
				{
				$('#jobButton').prop('disabled',false);
				}
				});
	});
	
	$(document).ready(function(){
		$('#profile').on('change',function(){
			
			if(this.value=='Higher Education')
				{
			$('#popup2').show();
				}
			else
				{
				$('#popup2').hide();
				}
		});
	});
	
	$(document).ready(function(){
		$('#profile').on('change',function(){
			
			if(this.value=='Employed' )
				{
			$('#popup1').show();
				}
			else
				{
				$('#popup1').hide();
				}
		});
	});
	$(document).ready(function(){
		var d=$('#designation').val().length;
			if(d>0 )
				{
			$('#popup1').show();
				}
			else
				{
				$('#popup1').hide();
				}
		});
	$(document).ready(function(){
		var c=$('#coursepursuing').val().length;
			if(c>0 )
				{
			$('#popup2').show();
				}
			else
				{
				$('#popup2').hide();
				}
		});
</script>
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
			</div>
			<div class="heading">Welcome  <%=session.getAttribute("fname")%> !!!</div>
			<a href="../jsp/profileView.jsp" id="view" class="linkbutton">VIEW</a>
			
				<div class="box">
				<form name="UpdateForm" method="post"
					action="../actionjsp/profileUpdateAction.jsp">
					
<div class="innerbox">
					<div class="section">
						<div class="details">Basic Details</div>
						<div class="asterisk">*</div>
						<div class="divsec5"></div>
					</div>
					<table class="table1">
						<tr>
							<td><div class="element">First Name :</div></td>
							<td><input type="text" name="fname" id="fname"
								class="input1" value="<%=session.getAttribute("fname")%>"></td>
						</tr>
						<tr>
							<td><div class="element">Last Name :</div></td>
							<td><input type="text" name="lname" id="lname"
								class="input1" value="<%=session.getAttribute("lname")%>"></td>
						</tr>
						<tr>
							<td><div class="element">Gender:</div></td>
							<td><input type="text" name="gender" id="gender"
								class="input1" value="<%=gender%>"></td>
						</tr>
						<tr>
							<td><div class="element">Category:</div></td>
							<td><select name="category" id="category" class="selection"
								required>
									<option <%=(category.equals("")?"selected='selected'":"") %> style="color: gray">Select Any</option>
									<option <%=(category.equals("GENERAL")?"selected='selected'":"") %>>GENERAL</option>
									<option <%=(category.equals("OBC")?"selected='selected'":"") %>>OBC</option>
									<option <%=(category.equals("SC")?"selected='selected'":"") %>>SC</option>
									<option <%=(category.equals("ST")?"selected='selected'":"") %>>ST</option>
									<option <%=(category.equals("PWD")?"selected='selected'":"") %>>PWD</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Year of Registration :</div></td>
							<td><input type="number" name="year" id="year"
								class="input1" placeholder="YYYY" min="1988" max="2100" value="<%=Ryear%>"></td>
						</tr>
						<tr>
							<td><div class="element">Branch:</div></td>
							<td><select name="branch" id="branch" class="selection">
									<option <%=(branch.equals("")?"selected='selected'":"") %>style="color: gray" >Select Any</option>
									<option <%=(branch.equals("MCA")?"selected='selected'":"") %>>MCA</option>
									<option <%=(branch.equals("Msc")?"selected='selected'":"") %>>Msc</option>
									<option <%=(branch.equals("PhD")?"selected='selected'":"") %>>PhD</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Year of Admission :</div></td>
							<td><input type="number" name="ayear" id="ayear"
								class="input1" placeholder="YYYY" min="1988" max="2100" value="<%=Ayear%>"></td>
						</tr>
						<tr>
							<td><div class="element">Year of Passing :</div></td>
							<td><input type="number" name="pyear" id="pyear"
								class="input1" placeholder="YYYY" min="1988" max="2100" value="<%=Pyear%>"></td>
						</tr>
						<tr>
							<td><div class="element">Phone no :</div></td>
							<td><input type="text" name="pno" id="pno" class="input1"
							 value="<%=phone %>"></td>
						</tr>
						<tr>
							<td><div class="element">Email :</div></td>
							<td><input type="text" name="email" id="email"
								class="input1" value="<%=email %>"></td>
						</tr>
						<tr>
							<td><div class="element">Residential Address :</div></td>
							<td><textarea name="Raddress" id="Raddress" class="tarea"
									 ><%=Raddress %></textarea></td>
						</tr>
						<tr>
							<td><div class="element">Highest Qualification :</div></td>
							<td><select name="qualification" id="qualification"
								class="selection">
									<option <%=(qualification.equals("")?"selected='selected'":"") %> style="color: gray">Select Any</option>
									<option <%=(qualification.equals("MCA")?"selected='selected'":"") %>>MCA</option>
									<option <%=(qualification.equals("Msc")?"selected='selected'":"") %>>Msc</option>
									<option <%=(qualification.equals("Mtech")?"selected='selected'":"") %>>Mtech</option>
									<option <%=(qualification.equals("Doctorate")?"selected='selected'":"") %>>Doctorate</option>
									<option <%=(qualification.equals("Post Doctorate")?"selected='selected'":"") %>>Post Doctorate</option>
									<option <%=(qualification.equals("Others")?"selected='selected'":"") %>>Others</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Current Profile:</div></td>
							<td><select name="profile" id="profile" class="selection"
								>
									<option <%=(profile.equals("")?"selected='selected'":"") %> style="color: gray">Select Any</option>
									<option <%=(profile.equals("Employed")?"selected='selected'":"") %>>Employed</option>
									<option <%=(profile.equals("Higher Education")?"selected='selected'":"") %>>Higher Education</option>
									<option <%=(profile.equals("Self Employed")?"selected='selected'":"") %>>Self Employed</option>
									<option <%=(profile.equals("Entrepreneur")?"selected='selected'":"") %>>Entrepreneur</option>
									<option <%=(profile.equals("Homemaker")?"selected='selected'":"") %>>Homemaker</option>
									<option <%=(profile.equals("Others")?"selected='selected'":"") %>>Others</option>
							</select></td>
						</tr>
					</table>
					</div>
					<div class="hide" id="popup1">
					<div class="innerbox">
					<div class="section">
						<div class="details">Current Employment Details</div>
						<div class="divsec6"></div>
					</div>
					<table class="table2">
						<tr>
							<td><div class="element">Type of Employment :</div></td>
							<td><select name="type" id="type" class="selection">
									<option <%=(type.equals("")?"selected='selected'":"") %> style="color: gray">Select Any</option>
									<option <%=(type.equals("Govt")?"selected='selected'":"") %>>Govt</option>
									<option <%=(type.equals("Private")?"selected='selected'":"") %>>Private</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Company/ Institution Name :</div></td>
							<td><input type="text" name="cname" id="cname"
								class="input1" value="<%=cname%>"></td>
						</tr>
						<tr>
							<td><div class="element">Designation :</div></td>
							<td><input type="text" name="designation" id="designation"
								class="input1" value="<%=designation%>"></td>
						</tr>
						<tr>
								<td><div class="element">CTC :(will not be displayed publicly,needed for official data maintenance)</div></td>
								<td><input type="text" name="ctc" id="ctc"
									class="input1" value="<%=ctc%>"></td>
							</tr>
						<tr>
							<td><div class="element">Official Address :</div></td>
							<td><textarea name="Oaddress" id="Oaddress" class="tarea"
									cols="" rows=""><%=Oaddress %></textarea></td>
						</tr>

						<tr>
							<td></td>
							<td>
								<div class="year">
									<div class="element2">Joining Year:</div>
									<input type="number" name="Jyear" id="Jyear" class="input2"
										placeholder="YYYY" min="1988" max="2100"
										value="<%=jYear%>">

									<div class="element2" >Leaving Year:</div>
									<input type="number" name="Lyear" id="Lyear" class="input2"
										placeholder="YYYY" min="1988" max="2100"
										value="<%=lYear%>">
								</div>
							</td>
						</tr>
					</table>
					<button type="button" id="jobButton" class="jobButton" onclick="add()" disabled="disabled" >+</button>
					<div class="hide" id="popup">
					<table class="table2">
						<tr>
							<td><div class="element">Type of Employment :</div></td>
							<td><select name="type1" id="type1" class="selection" onselect="check()">
									<option value="" style="color: gray">Select Any</option>
									<option value="Govt">Govt</option>
									<option value="Private">Private</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Company/ Institution Name :</div></td>
							<td><input type="text" name="cname1" id="cname1"
								class="input1"></td>
						</tr>
						<tr>
							<td><div class="element">Designation :</div></td>
							<td><input type="text" name="designation1" id="designation1"
								class="input1"></td>
						</tr>
						<tr>
								<td><div class="element">CTC :(will not be displayed publicly,needed for official data maintenance)</div></td>
								<td><input type="text" name="ctc1" id="ctc1"
									class="input1"></td>
							</tr>
						<tr>
							<td><div class="element">Official Address :</div></td>
							<td><textarea name="Oaddress1" id="Oaddress1" class="tarea"
									cols="" rows=""></textarea></td>
						</tr>

						<tr>
							<td></td>
							<td>
								<div class="year">
									<div class="element2">Joining Year:</div>
									<input type="number" name="Jyear1" id="Jyear1" class="input2"
										placeholder="YYYY" min="1988" max="2100">
									<div class="element2">Leaving Year:</div>
									<input type="number" name="Lyear1" id="Lyear1" class="input2"
										placeholder="YYYY" min="1988" max="2100">
								</div>
							</td>
						</tr>
					</table >
					</div>
					</div>
					</div>
					<div class="hide" id="popup2">
					<div class="innerbox">
					<div class="section">
						<div class="details">Higher Education Details(if any)</div>
						<div class="divsec7"></div>
					</div>
					<table class="table3">
						<tr>
							<td><div class="element">Course pursuing :</div></td>
							<td><input type="text" name="coursepursuing"
								id="coursepursuing" class="input1" value="<%=coursepursuing%>"></td>
						</tr>
						<tr>
							<td><div class="element">Institute/University Name :</div></td>
							<td><input type="text" name="iname" id="iname"
								class="input1" value="<%=iname %>"></td>
						</tr>
						<tr>
							<td><div class="element">Address of
									Institute/University :</div></td>
							<td><textarea name="Iaddress" id="Iaddress" class="tarea"
									><%=Iaddress %></textarea></td>
						</tr>
					</table>
					
</div>
</div>
<table class="table4">
					<tr>
							<td></td>
							<td><input type="submit" name="update" id="update"
								class="submitbutton" value="UPDATE"/></td>
						</tr>
						</table>
				</form>
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