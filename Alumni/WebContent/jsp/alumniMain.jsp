<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>ALUMNI</title>
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
  <!-- <link rel="stylesheet" type="text/css" media="all"
	href="../css/respon.css">  --> 
<link rel="stylesheet" type="text/css" media="all"
	href="../css/alumniMain.css">
<link rel="stylesheet" type="text/css" media="all"
	href="../css/login.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript">
	var img = [ "../image/nbuin.png","../image/library2.png",
		"../image/campus.png","../image/department.png","../image/nbu.png",
		"../image/trees.png","../image/parade.png" ]
	var index = 0;
	setInterval(function() {
		if (index === img.length) {
			index = 0;
		}
		document.getElementById("image1").src = img[index];
		index++;
	}, 3000);
</script>
</head>
<body>
	<div class="cover">
		<div class="head1">
			<div class="sub1">
				<img src="../image/nbulogo.png"
					width="140px" height="130px" alt="">
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
				<div class="searchAlumni">
					<form action="../jsp/search.jsp" name="searchform" method="post">
					
					<select name="category" id="category" class="category"
								required>
									<option value="" style="color: gray">Select Any</option>
									<option value="name" id="name">Search by Name</option>
									<option value="ayear" id="ayear">Search by Year of Admission</option>
									<option value="pyear" id="pyear">Search by Year of Passing</option>
									<option value="branch" id="branch">Search by Branch</option>
									<!-- <option value="yearOfreg" id="yearOfreg">Search by Year of Registration</option> -->
					</select>
					<div class="search">
						<input type="text" placeholder="Search Alumni" name="searchbar"
							id="searchbar" class="searchbar">
							
						<div class="line2"></div>
						<button class="searchButton" id="searchButton" name="searchButton">
							<img src="../image/search.png" width="10px" height="10px">
							
						</button>
					</div>	
					</form>
				</div>
			</div>
			<div class="display">
				<div class="div1">
					<img src="../image/nbuout.png"
						id="image1" class="image1" width="600px" height="440px" alt="">
				</div>
				<div class="NBU">
					<div class="msg1">North</div>
					<div class="msg">Bengal</div>
					<div class="msg">University</div>
				</div>
			</div>
			<div class="box">
				<div class="alum1">
					Welcome to <br>Alumni Association of Department of Computer
					Science and Technology of North Bengal University
				</div>
				<div class="alum2">
					It is an exclusive space for all the students of department of
					computer science and technology to come together and connect to
					help each other to move ahead. <br>If you have not created
					your profile yet, please register now.
				</div>
				<div class="group">
					<div class="alum3">Want to register yourself as an alumni?</div>
					<img src="../image/hand.png"
						width="20px" height="20px" class="hand" alt=""> <a
						href="../jsp/registration.jsp" class="links">REGISTER</a>
				</div>

				<div class="group">
					<div class="alum3">Want to update your profile?</div>
					<img src="../image/hand.png"
						width="20px" height="20px" class="hand" alt="">  <a
            href="#popup"
            class="links"
            >LOG IN</a>
                </div>
                
				<!-- login	 -->
				<form action="../actionjsp/loginaction.jsp"
							method="post">	
					<div id="popup" class="overlay">
					
          <div class="wrapper">
          
            <a href="#null" class="close">&times;</a>
            
            <div class="column details">
              <div class="signin">
                <h1>Sign In</h1>
                <input
                    type="text"
                    placeholder="Registration no."
                    name="regno"
                    id="regno"
                    required />
                <input
                    type="password"
                    placeholder="Password"
                    name="password"
                    id="password"
                    required />
                    
                <a  href="../jsp/forgotPassword.jsp" class="forpass">Forgot Password?</a>
                <button type="submit" class="form-submit" name="signIn"
                    id="signIn">Sign In</button>
                <span>Not Yet Registered?<a id="signup" href="../jsp/registration.jsp">
                    Register Now</a>
                  </span
                >
              </div>
            </div>
            
            <div class="column content">
              <div class="signin">
                <h1>Welcome Back!</h1>
                <p>To stay connected with us please Login with your personal Info</p>
              </div>
            </div>
            
          </div>
         
        </div> 
 </form>
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
			<div class="foot"> &copy; Copyright North Bengal University,
				 Department of Computer Science and Technology</div>
		</div>

	</div>
	
</body>

</html>