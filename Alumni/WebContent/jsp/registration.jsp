<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>ALUMNI REGISTRATION</title>
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
	href="../css/registrationpage.css">
<script src="../js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	function check() {
		var password = $("#password").val();
		var confirmpassword = $("#confirmpass").val();
		if (password != confirmpassword) {
			alert("passwords do not match !!");
			return false;
		}

	}
	
	function validatePassword()
    {
		
			var number = /([0-9])/;
			var alphabets = /([a-zA-Z])/;
			var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
			var password = $('#password').val().trim();
			if (password.length < 6) {
				$('#error').removeClass();
				$('#error').addClass('weak-password');
				$('#error').html("Weak!!!(Password should contain atleast 6 characters)");
			} else {
				if (password.match(number) && password.match(alphabets) && password.match(special_characters)) {
					$('#error').removeClass();
					$('#error').addClass('strong-password');
					$('#error').html("Congratulations !! You have set a strong Password!!!");
				}
				else {
					$('#error').removeClass();
					$('#error').addClass('medium-password');
					$('#error').html("Medium!!!(should include alphabets, numbers and special characters)");
				}
			}
    } 

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
			if(this.value=='Employed')
				{
			$('#popup1').show();
				}
			else
				{
				$('#popup1').hide();
				}
		});
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
			<img src="../image/alumni.png" height="200px" width="100%" alt="" style="object-fit:cover">
			<marquee class="disclaimer" direction="left" scrollamount="7">Please
				enter your details properly!! Do not fill-up the registration form
				if you have already registered!!</marquee>

			<div class="box">
				<form name="registrationForm" method="post"
					action="../actionjsp/registrationaction.jsp">
					<div class="section">
						<div class="details">Basic Details</div>
						<div class="asterisk">*</div>
						<div class="divsec5"></div>
					</div>
					<table class="table1">
						<tr>
							<td><div class="element">First Name :</div></td>
							<td><input type="text" name="fname" id="fname"
								class="input1" required></td>
						</tr>
						<tr>
							<td><div class="element">Last Name :</div></td>
							<td><input type="text" name="lname" id="lname"
								class="input1" required></td>
						</tr>
						<tr>
							<td><div class="element">Gender:</div></td>
							<td><input type="text" name="gender" id="gender"
								class="input1" required></td>
						</tr>
						<tr>
							<td><div class="element">Category:</div></td>
							<td><select name="category" id="category" class="selection"
								required>
									<option value="" style="color: gray">Select Any</option>
									<option value="GENERAL">GENERAL</option>
									<option value="OBC">OBC</option>
									<option value="SC">SC</option>
									<option value="ST">ST</option>
									<option value="PWD">PWD</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Registration No. :</div></td>
							<td><input type="text" name="regno" id="regno"
								class="input1" required></td>
						</tr>
						<tr>
							<td><div class="element">Year of Registration :</div></td>
							<td><input type="number" name="year" id="year"
								class="input1" placeholder="YYYY" min="1988" max="2100" required></td>
						</tr>
						<tr>
							<td><div class="element">Branch:</div></td>
							<td><select name="branch" id="branch" class="selection"
								required>
									<option value="" style="color: gray">Select Any</option>
									<option value="MCA">MCA</option>
									<option value="Msc">Msc</option>
									<option value="PhD">PhD</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Year of Admission :</div></td>
							<td><input type="number" name="ayear" id="ayear"
								class="input1" placeholder="YYYY" min="1988" max="2100" required></td>
						</tr>
						<tr>
							<td><div class="element">Year of Passing :</div></td>
							<td><input type="number" name="pyear" id="pyear"
								class="input1" placeholder="YYYY" min="1988" max="2100"></td>
						</tr>
						<tr>
							<td><div class="element">Phone no :</div></td>
							<td><input type="text" name="pno" id="pno" class="input1"
								required></td>
						</tr>
						<tr>
							<td><div class="element">Email :</div></td>
							<td><input type="text" name="email" id="email"
								class="input1" required></td>
						</tr>
						<tr>
							<td><div class="element">Residential Address :</div></td>
							<td><textarea name="Raddress" id="Raddress" class="tarea"
									required cols="" rows=""></textarea></td>
						</tr>
						<tr>
							<td><div class="element">Highest Qualification :</div></td>
							<td><select name="qualification" id="qualification"
								class="selection" required>
									<option value="" style="color: gray">Select Any</option>
									<option value="MCA">MCA</option>
									<option value="Msc">Msc</option>
									<option value="Mtech">Mtech</option>
									<option value="Doctorate">Doctorate</option>
									<option value="Post Doctorate">Post Doctorate</option>
									<option value="Others">Others</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Current Profile:</div></td>
							<td><select name="profile" id="profile" class="selection"
								required>
									<option value="" style="color: gray">Select Any</option>
									<option value="Employed">Employed</option>
									<option value="Higher Education">Higher Education</option>
									<option value="Self-employed">Self Employed</option>
									<option value="Entrepreneur">Entrepreneur</option>
									<option value="Homemaker">Homemaker</option>
									<option value="Others">Others</option>
							</select></td>
						</tr>
						<tr>
							<td><div class="element">Enter password:</div></td>
							<td><div class="passwordInput">
									<input type="password" name="password" id="password"
										class="pass" autofocus required onkeyup="return validatePassword()"/> <img
										src="../image/eyeslash.png" class="eyeslash"
										id="togglePassword" name="togglePassword">
								</div><section class="error" id="error"></section>
								</td>
								
						</tr>
						<tr>
							<td><div class="element">Confirm password:</div></td>
							<td><div class="passwordInput">
									<input type="password" name="confirmpass" id="confirmpass"
										class="pass" autofocus onblur="check();" required /> <img
										src="../image/eyeslash.png" class="eyeslash"
										id="toggleCPassword" name="toggleCPassword">
								</div></td>
						</tr>
						<tr>
							<td><div class="element">In case you forget your
									password:</div></td>
							<td><select name="securityQues" id="securityQues"
								class="selection" required>
									<option value="" style="color: gray">Security Question</option>
									<option value="What is dream job?">What is dream job?</option>
									<option value="Which is your favourite novel?">Which
										is your favourite novel?</option>
									<option value="Who is your favourite actor?">Who is
										your favourite actor?</option>
									<option
										value="Which is dream destination to visit once in a lifetime?">Which
										is dream destination to visit once in a lifetime?</option>
									<option value="What is your nickname?">What is your
										nickname?</option>
							</select></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" name="securityAns" id="securityAns"
								class="input1" required></td>
						</tr>
					</table>
					<div class="hide" id="popup1">
						<div class="section">
							<div class="details">Current Employment Details</div>
							<div class="divsec6"></div>
						</div>
						<table class="table2">
							<tr>
								<td><div class="element">Type of Employment :</div></td>
								<td><select name="type" id="type" class="selection">
										<option value="" style="color: gray">Select Any</option>
										<option value="Govt">Govt</option>
										<option value="Private">Private</option>
								</select></td>
							</tr>
							<tr>
								<td><div class="element">Company/ Institution Name :</div></td>
								<td><input type="text" name="cname" id="cname"
									class="input1"></td>
							</tr>
							<tr>
								<td><div class="element">Designation :</div></td>
								<td><input type="text" name="designation" id="designation"
									class="input1"></td>
							</tr>
							<tr>
								<td><div class="element">CTC :(will not be displayed publicly,needed for official data maintenance)</div></td>
								<td><input type="text" name="ctc" id="ctc"
									class="input1"></td>
							</tr>
							<tr>
								<td><div class="element">Official Address :</div></td>
								<td><textarea name="Oaddress" id="Oaddress" class="tarea"
										cols="" rows=""></textarea></td>
							</tr>

							<tr>
								<td></td>
								<td>
									<div class="year">
										<div class="element2">Joining Year:</div>
										<input type="number" name="Jyear" id="Jyear" class="input2"
											placeholder="YYYY" min="1988" max="2100">
										<div class="element2">Leaving Year:</div>
										<input type="number" name="Lyear" id="Lyear" class="input2"
											placeholder="YYYY" min="1988" max="2100">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="hide" id="popup2">
						<div class="section">
							<div class="details">Higher Education Details(if any)</div>
							<div class="divsec7"></div>
						</div>
						<table class="table3">
							<tr>
								<td><div class="element">Course pursuing :</div></td>
								<td><input type="text" name="coursepursuing"
									id="coursepursuing" class="input1"></td>
							</tr>
							<tr>
								<td><div class="element">Institute/University Name :</div></td>
								<td><input type="text" name="iname" id="iname"
									class="input1"></td>
							</tr>
							<tr>
								<td><div class="element">Address of
										Institute/University :</div></td>
								<td><textarea name="Iaddress" id="Iaddress" class="tarea"
										cols="" rows=""></textarea></td>
							</tr>

						</table>
					</div>
					<table class="table4">
						<tr>
							<td></td>
							<td><input type="submit" name="register" id="register"
								class="submitbutton" value="REGISTER" /></td>
						</tr>
					</table>
				</form>
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
	<script>

	const togglePassword=document.querySelector('#togglePassword');
	
	const password=document.querySelector('#password');

	
	togglePassword.addEventListener('click',function(e){
		const type=password.getAttribute('type')==='password' ? 'text' :'password';
		password.setAttribute('type',type);
		if(togglePassword.src.match("../image/eyeslash.png"))
			{
			togglePassword.src="../image/eye.png";
			}
		else
			{
			togglePassword.src="../image/eyeslash.png";
			}
	});
	
	const toggleCPassword=document.querySelector('#toggleCPassword');
	const confirmpass=document.querySelector('#confirmpass');
	toggleCPassword.addEventListener('click',function(e){
		const type1=confirmpass.getAttribute('type')==='password' ? 'text' :'password';
		confirmpass.setAttribute('type',type1);
		if(toggleCPassword.src.match("../image/eyeslash.png"))
			{
			toggleCPassword.src="../image/eye.png";
			}
		else
			{
			toggleCPassword.src="../image/eyeslash.png";
			}
	});
	</script>
</body>
</html>




