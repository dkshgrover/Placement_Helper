<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	%>
	<%
 			if(session.getAttribute("uname") == null){ 
  				response.sendRedirect("../register.jsp?loginAs=student&loginFirst=Please Login First**");
			}
 		%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<link rel="stylesheet" href="./assets/css/fontawesome.min.css">
<style>
.width {
	width: 99%;
	margin-left: 10px;
}

.btn-primary {
	background-color: coral !important;
	border-color: coral !important;
}

.btn-primary:hover {
	background-color: white !important;
	border: 2px solid coral !important;
	transition: 0.5s linear;
	color: coral !important;
}

.dropdown {
	margin-left: 25px;
	margin-top: -7px;
}

footer {
	overflow: hidden;
}

.nav-text {
	color: black;
	margin-left: 50px;
	font-weight: 700;
}

.nav-text:hover {
	text-decoration: 10px #233862 underline;
}

.label {
	font-weight: bold;
}

.heading {
	margin-top: 120px !important;
}

@media ( max-width :768px) {
	.foot {
		margin-top: 270px;
		background-image: url("../assets/img/foot.png");
	}
	.logo-foot {
		padding-top: -50px;
	}
	.para-foot {
		padding-right: 50px;
	}
	.gif {
		margin-left: 100px;
	}
}

.footer {
	position: relative;
	background-image: url('../assets/img/Path\ 1785.png');
	width: 103.5%;
	background-size: cover;
	height: 500px;
	/* overflow: hidden; */
	background-repeat: hidden;
}

hr.above-hr, hr.below-hr {
	border-top: 1px solid gray;
}

#h2:hover {
	background-color: black;
	cursor: pointer;
	color: white;
	transform: scale(1.1);
}

#h3:hover {
	cursor: pointer;
	color: white;
	transform: scale(1.1);
}

#h4:hover {
	cursor: pointer;
	color: white;
	transform: scale(1.1);
}

#h5:hover {
	cursor: pointer;
	color: white;
	transform: scale(1.1);
}

#h6:hover {
	cursor: pointer;
	color: white;
	transform: scale(1.1);
}

#h6, #h5, #h4, #h3, #h2 {
	color: white;
}

.para-foot {
	color: white;
	opacity: 0.8;
	font-size: small;
}

.content {
	margin-top: 210px;
}

.copyright {
	margin-top: 10px;
}

.gif {
	margin-top: 200px;
}

.logo-foot {
	margin-top: 250px;
}

.social:hover {
	cursor: pointer;
	transform: scale(1.5);
}
</style>
<script>
	function fun1() {

		var img = document.getElementById("scrl");

		img.style.backgroundColor = "none";

		img.style.backgroundColor = "white";

		img.style.boxShadow = "0px 0px 10px 0px #ccc";

	}
</script>
<title>Student Register</title>
</head>
<body onscroll="fun1()">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="scrl">
		<div class="container">
			<a class="navbar-brand" href="../assets/index.jsp"><img
				src="../assets/img/Logo (1).png" height="70px" width="150px" alt=""
				srcset=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<a class="nav-text ml-3" class="active" href="./index.jsp">Home
						<span class="sr-only">(current)</span>
					</a> <a class="nav-text" class="nav-link nav-text" href="../about.jsp">About</a>
					<a class="nav-text" class="nav-link" href="../contact.jsp">Contact
						Us</a> <a class="nav-text" class="nav-link" href="../chooseUser.jsp">Login/Register</a>
				</div>
			</div>
		</div>
	</nav>
	<h4 style="margin-top: 10%; margin-left: 5%; color: red;"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error") %></h4>

	<h3 class="text-center heading mt-5 pb-4">Student Details</h3>
	<p style="color: red;" class="text-center mt-5 pb-4">Please fill
		your details to get registered first**</p>
	<form action="../studentDetails" method="post"
		enctype="multipart/form-data">
		<h4 class="width" style="border-bottom: 1px solid black;">Your
			Personal Details</h4>
		<div class="form-row width">
			<div class="col-md-6 mb-3">
				<label for="fname" class="label">First name</label> <input
					type="text" class="form-control" id="fname" name="fname"
					placeholder="Daksh" required>
			</div>
			<div class="col-md-6 mb-3">
				<label for="lname" class="label">Last name</label> <input
					type="text" class="form-control" id="lname" name="lname"
					placeholder="Grover" required>
			</div>
		</div>
		<div class="form-row width">
			<div class="col-md-6 mb-3">
				<label for="contact" class="label">Contact</label> <input
					type="text" class="form-control" id="contact" name="contact"
					placeholder="98765XXXXX" pattern="[0-9]{10}" required>
			</div>
			<div class="col-md-6 mb-3">
				<label for="github_profile" class="label">Github Profile
					Link</label> <input type="text" class="form-control" id="github_profile"
					name="github_profile" placeholder="(if any?)">
			</div>
		</div>
		<div class="form-row width">
			<div class="col-md-6 mb-3">
				<label for="dob" class="label">Date Of Birth</label> <input
					type="date" class="form-control" id="dob" name="dob" required>
			</div>
		</div>
		<br>
		<h4 class="width" style="border-bottom: 1px solid black;">Your
			Temporary Address</h4>
		<div class="form-group width">
			<label for="tempAddress" class="label">Main Landmark</label> <input
				type="text" class="form-control" id="tempAddress" name="tempAddress"
				placeholder="#123, street no. 1, sunny enclave">
		</div>
		<div class="form-row width">
			<div class="form-group col-md-6">
				<label for="city" class="label">City</label> <input type="text"
					class="form-control" id="city" name="city" placeholder="city">
			</div>
			<div class="form-group col-md-4">
				<label for="state" class="label">State</label> <select id="state"
					class="form-control" name="state">
					<option selected disabled>Choose...</option>
					<option>Andhra Pradesh</option>
					<option>Arunachal Pradesh</option>
					<option>Assam</option>
					<option>Bihar</option>
					<option>Chhattisgarh</option>
					<option>Goa</option>
					<option>Gujarat</option>
					<option>Haryana</option>
					<option>Himachal Pradesh</option>
					<option>Jammu and Kashmir</option>
					<option>Jharkhand</option>
					<option>Karnataka</option>
					<option>Kerala</option>
					<option>Madhya Pradesh</option>
					<option>Maharashtra</option>
					<option>Manipur</option>
					<option>Meghalya</option>
					<option>Mizoram</option>
					<option>Nagaland</option>
					<option>Punjab</option>
					<option>Rajasthan</option>
					<option>Sikkim</option>
					<option>Tamil Nadu</option>
					<option>Telangna</option>
					<option>Tripura</option>
					<option>Uttar Pradesh</option>
					<option>Uttarakhand</option>
					<option>West Bengal</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<label for="zip" class="label">Zip</label> <input type="text"
					class="form-control" id="zip" name="zip">
			</div>
		</div>
		<br>
		<h4 class="width" style="border-bottom: 1px solid black;">Your
			Permanent Address</h4>
		<div class="form-group width">
			<label for="permAddress" class="label">Main Landmark</label> <input
				type="text" class="form-control" id="permAddress" name="permAddress"
				placeholder="#45, street no. 9, somdatt's landmark">
		</div>
		<div class="form-row width">
			<div class="form-group col-md-6">
				<label for="city2" class="label">City</label> <input type="text"
					class="form-control" id="city2" name="city2" placeholder="city">
			</div>
			<div class="form-group col-md-4">
				<label for="state2" class="label">State</label> <select id="state2"
					class="form-control" name="state2">
					<option selected disabled>Choose...</option>
					<option>Andhra Pradesh</option>
					<option>Arunachal Pradesh</option>
					<option>Assam</option>
					<option>Bihar</option>
					<option>Chhattisgarh</option>
					<option>Goa</option>
					<option>Gujarat</option>
					<option>Haryana</option>
					<option>Himachal Pradesh</option>
					<option>Jammu and Kashmir</option>
					<option>Jharkhand</option>
					<option>Karnataka</option>
					<option>Kerala</option>
					<option>Madhya Pradesh</option>
					<option>Maharashtra</option>
					<option>Manipur</option>
					<option>Meghalya</option>
					<option>Mizoram</option>
					<option>Nagaland</option>
					<option>Punjab</option>
					<option>Rajasthan</option>
					<option>Sikkim</option>
					<option>Tamil Nadu</option>
					<option>Telangna</option>
					<option>Tripura</option>
					<option>Uttar Pradesh</option>
					<option>Uttarakhand</option>
					<option>West Bengal</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<label for="zip2" class="label">Zip</label> <input type="text"
					class="form-control" id="zip2" name="zip2">
			</div>
			<h4 class="width"
				style="border-bottom: 1px solid black; margin-top: 2%;">Your
				Schooling Details</h4>
			<div class="form-row mar width">
				<div class="form-group col-md-6">
					<label for="sclname" class="label">School Name</label> <input
						type="text" class="form-control" id="sclname" name="sclname"
						placeholder="abc school">
				</div>
				<div class="form-group col-md-4">
					<label for="sclleaving" class="label">School Leaving Year</label> <input
						type="text" class="form-control" id="sclleaving" name="sclleaving"
						placeholder="20XX">
				</div>
				<div class="form-group col-md-2">
					<label for="12marks" class="label">12th Class Marks</label> <input
						type="text" class="form-control" id="12marks" name="12marks"
						placeholder="(Marks in %age)">
				</div>
			</div>

			<h4 class="width"
				style="border-bottom: 1px solid black; margin-top: 2%;">Your
				College Details</h4>
			<div class="form-row mar width">
				<div class="form-group col-md-6">
					<label for="clgname" class="label">College Name</label> <input
						type="text" class="form-control" id="clgname" name="clgname"
						placeholder="xyz college">
				</div>
				<div class="form-group col-md-4">
					<label for="clgleaving" class="label">College Passing Year</label>
					<input type="text" class="form-control" id="clgleaving"
						name="clgleaving" placeholder="20XX">
				</div>
				<div class="form-group col-md-2">
					<label for="avgmarks" class="label">Average Marks</label> <input
						type="text" class="form-control" id="avgmarks" name="avgmarks"
						placeholder="(SGPA till current sem)">
				</div>
			</div>
			<label for="course" class="label width">Choose Course</label> <select
				class="custom-select width" id="course" name="course" required>
				<option selected disabled>Courses..</option>
				<option>Bachelor of Technology</option>
				<option>Bachelor of Computer Application</option>
				<option>Bachelor of Graphic & Web Designing</option>
				<option>Bachelor of Business Administration</option>
				<option>Bachelor Of Commerce</option>
				<option>Pharmacy</option>
				<option>Hotel Management</option>
				<option>Master of Technology</option>
				<option>Master of Computer Application</option>
				<option>Master of Business Administration</option>
				<option>Master Of Commerce</option>
			</select> <br> <br> <label for="stream" class="label width">Choose
				Stream</label> <select class="custom-select width" id="stream" name="stream"
				required>
				<option selected disabled>Streams.. (If No Further Course
					Press None)</option>
				<option>None</option>
				<br>
				<option disabled>Bachelor/Master Of Technology</option>
				<option>Computer Science and Engineering</option>
				<option>Mechanical Engineering</option>
				<option>Electronics and Communications Engineering</option>
				<option>Informative Technology</option>
				<option disabled></option>
				<option disabled>Bachelor/Master of Business Administration</option>
				<option>BBA in Business Administration</option>
				<option>BBA in Finance</option>
				<option>BBA in Entrepreneurship</option>
				<option>BBA in Human Resources</option>
				<option disabled></option>
				<option disabled>Pharmacy</option>
				<option>B.Pharma</option>
				<option>M.Pharma</option>
				<option>Pharma D</option>
				<option disabled></option>
				<option disabled>Hotel Management</option>
				<option>BHMCT(Non-AICTE)</option>
				<option>BTTM</option>
				<option>B.Sc. Hospitality and Hotel Administration</option>
				<option>B.Sc. Nutrition and Dietics</option>
				<option disabled></option>
			</select>
			<h4 class="width"
				style="border-bottom: 1px solid black; margin-top: 2%;">Your
				Skills and percentages</h4>
			<hr>
			<div class="form-row width">
				<div class="col">
					<label for="skill1" class="label">Enter Your skill 1</label> <input
						type="text" class="form-control" id="skill1" name="skill1"
						placeholder="Skill 1">
				</div>
				<div class="col">
					<label for="skill2" class="label">Percentage</label> <input
						type="text" class="form-control" name="perc1"
						placeholder="Percentage">
				</div>
				<div class="col">
					<label for="skill2" class="label">Enter Your skill 2</label> <input
						type="text" class="form-control" id="skill2" name="skill2"
						placeholder="Skill 2">
				</div>
				<div class="col">
					<label for="skill2" class="label">Percentage</label> <input
						type="text" class="form-control" name="perc2"
						placeholder="Percentage">
				</div>
				<div class="col">
					<label for="skill3" class="label">Enter Your skill 3</label> <input
						type="text" class="form-control" id="skill3" name="skill3"
						placeholder="Skill 3">
				</div>
				<div class="col">
					<label for="skill3" class="label">Percentage</label> <input
						type="text" class="form-control" name="perc3"
						placeholder="Percentage">
				</div>
			</div>
			<div class="form-row width">
				<div class="col">
					<label for="skill4" class="label">Enter Your skill 4</label> <input
						type="text" class="form-control" id="skill4" name="skill4"
						placeholder="Skill 4">
				</div>
				<div class="col">
					<label for="skill2" class="label">Percentage</label> <input
						type="text" class="form-control" name="perc4"
						placeholder="Percentage">
				</div>
				<div class="col">
					<label for="skill5" class="label">Enter Your skill 5</label> <input
						type="text" class="form-control" id="skill5" name="skill5"
						placeholder="Skill 5">
				</div>
				<div class="col">
					<label for="skill5" class="label">Percentage</label> <input
						type="text" class="form-control" name="perc5"
						placeholder="Percentage">
				</div>
				<div class="col">
					<label for="skill6" class="label">Enter Your skill 6</label> <input
						type="text" class="form-control" id="skill6" name="skill6"
						placeholder="Skill 6">
				</div>
				<div class="col">
					<label for="skill6" class="label">Percentage</label> <input
						type="text" class="form-control" name="perc6"
						placeholder="Percentage">
				</div>
			</div>
		</div>
		<p class="width label" style="margin-left: 2%;">** If you have
			lesser then 6 skills write 0 in remaining percentage boxes</p>
		<h4 class="width"
			style="border-bottom: 1px solid black; margin-top: 2%;">Choose
			Your Photograph</h4>
		<div class="custom-file mt-3 mb-3 width">
			<input type="file" class="custom-file-input" id="photo" name="photo">
			<label class="custom-file-label label" for="photo">Passport
				Photo (Size-960px X 1280px)</label>
		</div>
		<div class="custom-file mt-3 mb-3 width">
			<input type="file" class="custom-file-input" id="photo2"
				name="photo2"> <label class="custom-file-label label"
				for="photo2">Profile Photo (Size-1920px X 1280px)</label>
		</div>
		<input type="submit" class="btn btn-secondary width"
			value="Update Details"> <br> <br>
	</form>
	<!-- Footer -->
	<footer>
		<div class="footer mt-5">
			<div class="row foot">
				<div class="col-sm-3">
					<div class="d-flex justify-content-center logo-foot">
						<img src="../assets/img/Logo (1).png" height="120px" width="250px"
							alt="">
					</div>
					<div class="para-foot ml-4">
						<p>Our team of Placement Helper provides you ample
							opportunities to Work on the leading edge of knowledge and plan
							your placement journey in a very effective manner.</p>
					</div>

				</div>
				<div class="col-sm-6 content">
					<div class="container">
						<a href="../chooseUser.jsp"><h6 class="text-center mt-3"
								id="h6">Log-in</h6></a> <a href="../chooseUser.jsp"><h5
								class="text-center" id="h5">Register</h5></a> <a href="../about.jsp"><h4
								class="text-center" id="h4">About-Us</h4></a> <a
							href="../contact.jsp"><h3 class="text-center" id="h3">Contact-Us</h3></a>
						<hr class="above-hr">
						<div class="text-center text-md-center">
							<ul class="list-unstyled list-inline">
								<li class="list-inline-item"><a
									class="btn-floating btn-sm rgba-white-slight mx-1"> <i
										style="color: white;" class="fab fa-facebook-f social"></i>
								</a></li>
								<li class="list-inline-item"><a
									class="btn-floating btn-sm rgba-white-slight mx-1"> <i
										style="color: white;" class="fab fa-twitter social"></i>
								</a></li>
								<li class="list-inline-item"><a
									class="btn-floating btn-sm rgba-white-slight mx-1"> <i
										style="color: white;" class="fab fa-google-plus-g social"></i>
								</a></li>
								<li class="list-inline-item"><a
									class="btn-floating btn-sm rgba-white-slight mx-1"> <i
										style="color: white;" class="fab fa-linkedin-in social"></i>
								</a></li>
							</ul>
						</div>
						<hr class="below-hr">
						<div class="copyright">
							<p class="text-center ml-3 text-md-center"
								style="color: white; font-size: small;">
								© 2020 Copyright: <a href="https://mdbootstrap.com/">
									E-Placement Helper.com </a>
							</p>
						</div>

					</div>
				</div>
				<div class="col-sm-3">
					<div class="pr-5 gif">
						<img src="./assets/img/animation_640_kg1adc77.gif" height="300px"
							alt="">

					</div>

				</div>
			</div>

		</div>
	</footer>
</body>
</html>