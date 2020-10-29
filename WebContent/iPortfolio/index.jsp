<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%
	String[] pdescr1 = null;
String[] pdescr_2 = null;
if (session.getAttribute("uname") == null) {
	request.getRequestDispatcher("../servlet1?loginFirst=You are not logged in**").forward(request, response);
}
ResultSet rs = (ResultSet) session.getAttribute("resultSet");
String dob = rs.getString(4);
String year = dob.substring(0, 4);
String date = dob.substring(8);
String monthS = "";
int month = Integer.parseInt(dob.substring(5, 7));
if (month == 1) {
	monthS = "January";
}
if (month == 2) {
	monthS = "February";
}
if (month == 3) {
	monthS = "March";
}
if (month == 4) {
	monthS = "April";
}
if (month == 5) {
	monthS = "May";
}
if (month == 6) {
	monthS = "June";
}
if (month == 7) {
	monthS = "July";
}
if (month == 8) {
	monthS = "August";
}
if (month == 9) {
	monthS = "September";
}
if (month == 10) {
	monthS = "October";
}
if (month == 11) {
	monthS = "November";
}
if (month == 12) {
	monthS = "December";
}
String pdescr = rs.getString(37);
if (pdescr != null) {
	pdescr1 = pdescr.split("[.]");
}
String pdescr2 = rs.getString(41);
if (pdescr2 != null) {
	pdescr_2 = pdescr2.split("[.]");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Portfolio</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.hero {
	margin-top: -17px;
	width: 100%;
	height: 100vh;
	background: url("../getImage2?email=<%=rs.getString(9)%>") top center;
	background-size: cover;
}
</style>
<script>
	function fun1() {

		var img = document.getElementById("scrl");
		var text = document.getElementsByClassName("nav-text");
		for (i = 0; i < text.length; i++) {
			text[i].style.color = "black";
		}

		img.style.backgroundColor = "none";

		img.style.backgroundColor = "white";

		img.style.boxShadow = "0px 0px 10px 0px #ccc";

	}
</script>

<!-- Favicons -->
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link rel="shortcut icon" href="../assets/img/favicon.ico"
	type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">


</head>
<body onscroll="fun1()">
	<p id="up" class="up"></p>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="scrl">
		<div class="container">
			<a href="../assets/index.jsp"> <img
				src="../assets/img/Logo (1).png" height="70px" width="150px" alt=""
				srcset=""></a>

			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<a class="nav-text ml-3" class="nav-link"
						href="../assets/index.jsp">Home </a> <a class="nav-text"
						class="nav-link nav-text" href="../about.jsp">About</a> <a
						class="nav-text" class="nav-link" href="../contact.jsp">Contact
						Us</a>

					<div class="dropdown">
						<%
							out.print(
								"<button class='btn btn-primary dropdown-toggle' type='button' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
								+ rs.getString(2) + "</button>");
						%>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="index.jsp">Dashboard</a>
							<%
								out.print(
									"<a style='cursor: pointer;' class='dropdown-item' data-toggle='modal' data-target='#exampleModal1'>Add Project</a>");
							%>
							<a class="dropdown-item" href="../logoutServlet">Log-Out</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
<!-- Modal 2    -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Project</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container formProject">
						<form action="../addProject?pno=1" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Project Name</label> <input
									type="text" name="pname" class="form-control"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Project Enviroment</label> <input
									type="text" name="penv" class="form-control"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Project Technologies</label> <input
									type="text" name="ptech" class="form-control"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Project Details</label>
								<textarea name="pdescr" class="form-control" rows="3"></textarea>
							</div>


							<button type="submit" id="projectBtn" class="btn btn-primary">
								<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;Add
								Second
							</button>
							<br><br>
							<div class="modal-footer">

								<input type="submit" id="passwordBtn" value="Save changes"
									class="btn btn-primary">
							</div>
						</form>
					</div>

					<div id="scndProject" class="container"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal 2 end -->
	<!-- ======= Mobile nav toggle button ======= -->
	<button type="button" class="mobile-nav-toggle d-xl-none">
		<i class="icofont-navigation-menu"></i>
	</button>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="d-flex flex-column">

			<div class="profile">
				<%
					if (rs.getBlob(31) == null) {
					out.print("<img src='assets/img/default.jpg' alt='' height=130px width=100px class='rounded-circle'>");
				} else {
					out.print("<img src='../getImage?email=" + rs.getString(9)
					+ "' alt='' height=130px width=100px class='rounded-circle'>");
				}
				out.print("<h1 class='text-light'><a href='index.jsp'>" + rs.getString(2) + "</a></h1>");
				%>
				<div class="social-links mt-3 text-center">
					<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
						href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
						href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
						href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
						href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
				</div>
			</div>

			<nav class="nav-menu">
				<ul>
					<li class="active"><a href="#up"><i class="bx bx-home"></i>
							<span>Home</span></a></li>
					<li><a href="#about"><i class="bx bx-user"></i> <span>About</span></a></li>
					<li><a href="#resume"><i class="bx bx-file-blank"></i> <span>Resume</span></a></li>
					<li><a href="#portfolio"><i class="bx bx-book-content"></i>
							Recruiters</a></li>
					<li><a href="#services"><i class="bx bx-server"></i>
							Projects</a></li>


				</ul>
			</nav>
			<!-- .nav-menu -->
			<button type="button" class="mobile-nav-toggle d-xl-none">
				<i class="icofont-navigation-menu"></i>
			</button>

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section
		class="hero d-flex flex-column justify-content-center align-items-center">
		<div class="hero-container" data-aos="fade-in">
			<%
				out.print("<h1>" + rs.getString(2) + "</h1>");
			%>
			<p>
				I'm <span class="typed"
					data-typed-items="An Engineer., a Student., Ready to work."></span>
			</p>
			<p><%=(session.getAttribute("error") == null) ? "" : session.getAttribute("error")%></p>
		</div>
	</section>
	<!-- End Hero -->


	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container">

				<div class="section-title">
					<h2>About</h2>
					<p></p>
				</div>

				<div class="row">
					<div class="col-lg-4" data-aos="fade-right">
						<%
							if (rs.getBlob(31) == null) {
							out.print("<img src='assets/img/default.jpg' alt='' height=130px width=100px class='rounded-circle'>");
						} else {
							out.print("<img src='../getImage?email=" + rs.getString(9) + "' alt='' class='img-fluid'>");
						}
						%>
					</div>
					<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
						<h3><%=rs.getString(2)%></h3>
						<p class="font-italic">
							A brilliant student from
							<%=rs.getString(17)%>
							Pursuing
							<%=rs.getString(15)%>
							in
							<%=rs.getString(16)%>.
						</p>
						<div class="row">
							<div class="col-lg-6">
								<ul>
									<li><i class="icofont-rounded-right"></i> <strong>Birthday:
									</strong><%=date + " " + monthS + " " + year%></li>
									<li><i class="icofont-rounded-right"></i> <strong>Phone:
									</strong> +91-<%=rs.getString(3)%></li>
									<li><i class="icofont-rounded-right"></i> <strong>Address:
									</strong><%=rs.getString(6)%></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul>
									<li><i class="icofont-rounded-right"></i> <strong>Degree:
									</strong><%=rs.getString(15)%></li>
									<li><i class="icofont-rounded-right"></i> <strong>Email
											Id: </strong> <%=rs.getString(9)%></li>
									<li><i class="icofont-rounded-right"></i> <strong>Github
											Profile: </strong><br><%=rs.getString(5)%></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->



		<!-- ======= Skills Section ======= -->
		<section id="skills" class="skills section-bg">
			<div class="container">

				<div class="section-title">
					<h2>Skills</h2>
					<p>There is great skill in knowing how to conceal one's skill,
						Keep Learning.</p>
				</div>

				<div class="row skills-content">

					<div class="col-lg-6" data-aos="fade-up">

						<div class="progress">
							<span class="skill"><%=rs.getString(19)%> <i class="val"><%=rs.getInt(20)%>%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="<%=rs.getInt(20)%>" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>


						<div class="progress">
							<span class="skill"><%=rs.getString(21)%> <i class="val"><%=rs.getInt(22)%>%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="<%=rs.getInt(22)%>" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="progress">
							<span class="skill"><%=rs.getString(23)%> <i class="val"><%=rs.getInt(24)%>%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="<%=rs.getInt(24)%>" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

					</div>

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">

						<div class="progress">
							<span class="skill"><%=rs.getString(25)%> <i class="val"><%=rs.getInt(26)%>%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="<%=rs.getInt(26)%>" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="progress">
							<span class="skill"><%=rs.getString(27)%> <i class="val"><%=rs.getInt(28)%>%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="<%=rs.getInt(28)%>" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="progress">
							<span class="skill"><%=rs.getString(29)%> <i class="val"><%=rs.getInt(30)%>%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="<%=rs.getInt(30)%>" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

					</div>

				</div>

			</div>
		</section>
		<!-- End Skills Section-->

		<!-- ======= Resume Section ======= -->
		<section id="resume" class="resume">
			<div class="container">

				<div class="section-title">
					<h2>Resume</h2>
					<p>A Brief overview of your resume.</p>
				</div>

				<div class="row">
					<div class="col-lg-6" data-aos="fade-up">
						<h3 class="resume-title">Summary</h3>
						<div class="resume-item pb-0">
							<h4><%=rs.getString(2)%></h4>
							<ul>
								<li><%=rs.getString(7)%></li>
								<li>+91-<%=rs.getString(3)%></li>
								<li><%=rs.getString(9)%></li>
							</ul>
						</div>

						<h3 class="resume-title">Education</h3>

						<div class="resume-item">
							<h4><%=rs.getString(15)%>
								&nbsp;-
								<%=rs.getString(16)%></h4>
							<h5><%=rs.getInt(11)%>
								-
								<%=rs.getInt(14)%></h5>
							<p>
								<em><%=rs.getString(17)%></em>
							</p>
							<p>
								Sgpa:
								<%=rs.getFloat(18)%></p>
						</div>
						<div class="resume-item">
							<h4>Senior Secondary School</h4>
							<h5><%=rs.getInt(11) - 2%>
								-
								<%=rs.getInt(11)%></h5>
							<p>
								<em><%=rs.getString(12)%></em>
							</p>
							<p>
								Marks:
								<%=rs.getInt(13)%>%
							</p>
						</div>
					</div>
					<%
						if (pdescr != null) {
						out.print("<div class='col-lg-6' data-aos='fade-up' data-aos-delay='100'>");
						out.print("<h3 class='resume-title'>Projects</h3>");
						out.print("<div class='resume-item'>");
						out.print("<h4>" + rs.getString(34) + "</h4>");
						out.print("<h5>" + rs.getString(35) + "</h5>");
						out.print("<p><em>" + rs.getString(36) + "</em></p>");
						out.print("<ul>");
						for (int i = 0; i < pdescr1.length; i++) {
							out.print("<li>" + pdescr1[i] + ".</li>");
						}
						out.print("</ul>");
						out.print("</div>");
					}
					if (pdescr2 != null) {
						out.print("<div class='resume-item'>");
						out.print("<h4>" + rs.getString(38) + "</h4>");
						out.print("<h5>" + rs.getString(39) + "</h5>");
						out.print("<p><em>" + rs.getString(40) + "</em></p>");
						out.print("<ul>");
						for (int i = 0; i < pdescr_2.length; i++) {
							out.print("<li>" + pdescr_2[i] + ".</li>");
						}
						out.print("</ul>");
						out.print("</div>");
						out.print("</div>");
					}
					%>
				</div>

			</div>
		</section>
		<!-- End Resume Section -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio section-bg">
			<div class="container">

				<div class="section-title">
					<div class="row">
						<div class="col-sm-7">
							<h2>Our Recruiters</h2>
						</div>
						<div class="col-sm-5">
							<form id="searchBar" class="form-inline my-2 my-lg-0">
								<input class="form-control mr-sm-2" type="search"
									placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success my-2 my-sm-0"
									type="submit">Search</button>
							</form>
						</div>
					</div>


					<p>Choose your dream company wisely. Special portal for
						students to click on and get all information related to a
						particular company.</p>
				</div>

				<div class="row" data-aos="fade-up">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="portfolio-flters">
							<li data-filter="*" class="filter-active">All</li>
							<!-- <li data-filter=".filter-app">App</li> -->
							<li data-filter=".filter-card">Technical</li>
							<li data-filter=".filter-web">Non-Technical</li>
						</ul>
					</div>
				</div>

				<div class="row portfolio-container" data-aos="fade-up"
					data-aos-delay="100">
					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="assets/img/2 . AMAZON2.png" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/amazon1.jpg"
									data-gall="portfolioGallery" class="venobox" title="AMAZON"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=101" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="assets/img/1 . GOOGLE.jpg" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/google1.jpg"
									data-gall="portfolioGallery" class="venobox" title="GOOGLE"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=102" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="assets/img/3 . MICROSOFT3.jpg" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/microsoft1.jpg"
									data-gall="portfolioGallery" class="venobox" title="MICROSOFT"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=105" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="assets/img/5 . DELOITTE5.png" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/deloitte1.jpg"
									data-gall="portfolioGallery" class="venobox" title="DELOITTE"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=104" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="assets/img/10 . AXIS.jpg" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/axis1.jpg"
									data-gall="portfolioGallery" class="venobox" title="AXIS BANK"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=110" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="assets/img/11 . HYUNDAI.png" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/hyundai1.jpg"
									data-gall="portfolioGallery" class="venobox" title="HYUNDAI"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=111" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="assets/img/12 . GSK.png" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/gsk1.jpg"
									data-gall="portfolioGallery" class="venobox" title="GSK"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=115" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="assets/img/13 . PVR.jpg" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/pvr1.jpg"
									data-gall="portfolioGallery" class="venobox" title="PVR"><i
									class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=113" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="assets/img/14 . OBEROI.jpg" class="img-fluid" alt="">
							<div class="portfolio-links">
								<a href="assets/img/portfolio/tog1.jpg"
									data-gall="portfolioGallery" class="venobox"
									title="THE OBEROI GROUP"><i class="bx bx-plus"></i></a> <a
									href="../getCompanyDetails?comp_id=114" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Portfolio Section -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">

				<div class="section-title">
					<div class="row">
						<div class="col-sm-7">
							<h2>Projects</h2>
						</div>
						<div class="col-sm-5">
							<form id="searchBar" class="form-inline my-2 my-lg-0">
								<input class="form-control mr-sm-2" type="search"
									placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success my-2 my-sm-0"
									type="submit">Search</button>
							</form>
						</div>
					</div>
					<p>Make a good project to get selected in your dream company,
						Here are some references.</p>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<div class="icon">
							<i class="icofont-computer"></i>
						</div>
						<h4 class="title">
							<a href="../getProjectDetails?p_id=1">PLACEMENT HELPER</a>
						</h4>
						<p class="description">Placement Helper is basically a web app
							which is developed to help the students of colleges to plan
							journey of their placement.</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="200">
						<div class="icon">
							<i class="icofont-earth"></i>
						</div>
						<h4 class="title">
							<a href="../getProjectDetails?p_id=3">DATA ANALYZER</a>
						</h4>
						<p class="description">Data analyzation is a crucial element
							in the modern industry driven by Data Science, Business
							Intelligence, and Business Analytics.</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="300">
						<div class="icon">
							<i class="icofont-image"></i>
						</div>
						<h4 class="title">
							<a href="../getProjectDetails?p_id=4">AIRLINE RESERVATION
								SYSTEM</a>
						</h4>
						<p class="description">The airline reservation system is a web
							platform that provides the facility to online ticket booking for
							flights.</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="400">
						<div class="icon">
							<i class="icofont-settings"></i>
						</div>
						<h4 class="title">
							<a href="../getProjectDetails?p_id=6">BOOKSHOP MANAGEMENT</a>
						</h4>
						<p class="description">This is a simple Bookshop Management
							System using the C++. It provides functions to add book, show
							book, etc.</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="500">
						<div class="icon">
							<i class="icofont-tasks-alt"></i>
						</div>
						<h4 class="title">
							<a href="../getProjectDetails?p_id=5">COLLEGE PORTAL</a>
						</h4>
						<p class="description">It is a basic view of college portal.
							It has different roles assigned for administrator, payroll/HR ,
							teachers and students.</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="100">
						<div class="icon">
							<i class="icofont-chart-bar-graph"></i>
						</div>
						<h4 class="title">
							<a href="../getProjectDetails?p_id=2">BANKING MANAGEMENT</a>
						</h4>
						<p class="description">It is a console project designed to
							manage and store all bank related information related to client ,
							accountant and administrator.</p>
					</div>
				</div>

			</div>
		</section>
		<!-- End Services Section -->


		<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

		<!-- Vendor JS Files -->
		<script src="assets/vendor/jquery/jquery.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
		<script src="assets/vendor/counterup/counterup.min.js"></script>
		<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="assets/vendor/venobox/venobox.min.js"></script>
		<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="assets/vendor/typed.js/typed.min.js"></script>
		<script src="assets/vendor/aos/aos.js"></script>

		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>
</body>
<script>
  var projectBtn = document.getElementById('projectBtn');
 var scndProject = document.getElementById('scndProject');
 var modalBody = document.getElementsByClassName('modal-body');
 console.log(projectBtn)
 projectBtn.addEventListener('click',(e)=>{
   e.preventDefault();
   console.log("scncis")
  projectBtn.style.visibility='hidden';
    scndProject.innerHTML=` <form action="../addProject?pno=2" method="post">
            <div class="form-group">
              <label for="exampleInputEmail1">Project-2 Name</label>
              <input type="text" name="pname" class="form-control" aria-describedby="emailHelp">
             
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Project-2 Enviroment</label>
              <input type="text" name="penv" class="form-control" aria-describedby="emailHelp">
             
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Project-2 Technologies</label>
              <input type="text" name="ptech" class="form-control" aria-describedby="emailHelp">
             
            </div>
            <div class="form-group">
              <label for="exampleFormControlTextarea1">Project-2 Details</label>
              <textarea name="pdescr" class="form-control" rows="3"></textarea>
            </div>
            <br><br>
            <div class="modal-footer">

			<input type="submit" id="passwordBtn" value="Save changes"
				class="btn btn-primary">
		</div>
            
           
            
          </form>`;
 })

</script>
</html>