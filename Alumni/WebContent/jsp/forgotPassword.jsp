<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>FORGOT PASSWORD</title>
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
	href="../css/forgotPasswordpage.css">
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
				$('#error').html("Weak!!!(should contain atleast 6 characters)");
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
			
			<marquee class="disclaimer" direction="left" scrollamount="7">Please
				enter your details properly to change your password!!</marquee>

			<div class="box">
				<form name="passwordChangeForm" method="post"
					action="../actionjsp/forgotPasswordAction.jsp">
					<table>
					<tr>
							<td><div class="element">Registration No. :</div></td>
							<td><input type="text" name="regno" id="regno"
								class="input1" required></td>
						</tr>
						<tr>
						<td><div class="element">Security Question:</div></td>
							<td><select name="securityQues" id="securityQues" class="selection"
								required>
									<option value="" style="color: gray">Select </option>
									<option value="What is dream job?">What is dream job?</option>
									<option value="Which is your favourite novel?">Which is your favourite novel?</option>
									<option value="Who is your favourite actor?">Who is your favourite actor?</option>
									<option value="Which is dream destination to visit once in a lifetime?">Which is dream destination to visit once in a lifetime?</option>
									<option value="What is your nickname?">What is your nickname?</option>
							</select></td>
						</tr>
						<tr>
						<td></td>
						<td><input type="text" name="securityAns" id="securityAns"
								class="input1" required></td>
						</tr>
							<tr>
							<td><div class="element">Enter password:</div></td>
							<td><div class="passwordInput"><input type="password" name="password" id="password"
								class="pass" autofocus required onkeyup="return validatePassword()"/>	
								<img src="../image/eyeslash.png" 
								class="eyeslash" id="togglePassword" name="togglePassword" >
								</div><section class="error" id="error"></section></td>
								
						</tr>
						<tr>
							<td><div class="element">Confirm password:</div></td>
							<td><div class="passwordInput"><input type="password" name="confirmpass"
								id="confirmpass" class="pass" autofocus onblur="check();" required />
								<img src="../image/eyeslash.png" 
								class="eyeslash" id="toggleCPassword" name="toggleCPassword" ></div></td>
						</tr>
						<tr>
						<td></td>
							<td><input type="submit" name="changepass" id="changepass"
								class="submitbutton" value="CHANGE PASSWORD" onclick="validateFields();"/></td>
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
