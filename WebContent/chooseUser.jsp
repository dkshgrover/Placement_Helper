<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0); //prevents caching at the proxy server
		%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<meta charset="UTF-8">
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/style1.css">
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome.min.css">
<link rel="shortcut icon" href="./assets/img/favicon.ico"
	type="image/x-icon">
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/all.min.js"></script>
<style>
.imgdg{
	border:1px solid black;
	border-radius: 250px;
}
</style>
<script>
	function fun1() {

		var img = document.getElementById("scrl");
		console.log(img.scrollTop);

		img.style.backgroundColor = "none";

		img.style.backgroundColor = "white";

		img.style.boxShadow = "0px 0px 10px 0px #ccc";

	}
</script>
<title>Login/Register</title>
</head>
<body onscroll="fun1()">
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	if (!(session.getAttribute("uname") == null)){
		response.sendRedirect("assets/index.jsp");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="scrl">
		<div class="container">
			<a class="navbar-brand" href="assets/index.jsp"><img
				src="assets/img/Logo (1).png" height="70px" width="150px" alt=""
				srcset=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<a class="nav-text ml-3" class="active" href="assets/index.jsp" style="text-decoration:none;">Home
						<span class="sr-only">(current)</span>
					</a> <a class="nav-text" class="nav-link nav-text" href="about.jsp" style="text-decoration:none;">About</a>
					<a class="nav-text" class="nav-link" href="contact.jsp" style="text-decoration:none;">Contact
						Us</a> <a class="nav-text" class="nav-link" href="chooseUser.jsp" style="text-decoration:none;">Login/Register</a>
				</div>
			</div>
		</div>
	</nav>
	<p style="margin-top: 6.5%; margin-left: 1%; color: red;"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></p>
	<div class="container">
	<div class="row">
	<div class="col-sm-6 mt-5">
	<button type="button" onclick='document.location="register.jsp?loginAs=student"' class="btn" style="margin-top:20%;margin-left:25%;margin-bottom:25%;"><img src="assets/img/student.jpg" class="imgdg" width=225px height=250px></button>
		<h4 class="text-center" style="margin-top:-22%;margin-left:-2%;">STUDENT</h4>
	</div>
	<div class="col-sm-6 mt-5">
	<button type="button" onclick='document.location="register.jsp?loginAs=college_administrator"' class="btn" style="margin-top:20%;margin-left:25%;margin-bottom:25%;"><img src="assets/img/college_admin1.jpg" class="imgdg" width=225px height=250px></button>
     	<h4 class="text-center" style="margin-top:-22%;">COLLEGE ADMINISTRATOR</h4>
	</div>
	</div>
     	
     </div>
          <footer>
       <div class="footer mt-5">
           <div class="row foot">
             <div class="col-sm-3">
              <div class="d-flex justify-content-center logo-foot">
                <img src="./assets/img/Logo (1).png" height="120px" width="250px" alt="">
              </div>
              <div class="para-foot ml-4">
                <p> Our team of Placement Helper provides you ample opportunities to Work on the leading edge of knowledge and plan your placement journey in a very effective manner.</p>
              </div>
             
            </div>
             <div class="col-sm-6 content">
                <div class="container">
                  <a href="chooseUser.jsp" style="text-decoration:none;"><h6 class="text-center mt-3" id="h6">Log-in</h6></a>
						<a href="chooseUser.jsp" style="text-decoration:none;"><h5 class="text-center" id="h5">Register</h5></a>
						<a href="about.jsp" style="text-decoration:none;"><h4 class="text-center" id="h4">About-Us</h4></a>
						<a href="contact.jsp" style="text-decoration:none;"><h3 class="text-center" id="h3">Contact-Us</h3></a>                    
                    <hr class="above-hr">
                    <div class="text-center text-md-center">
                      <ul class="list-unstyled list-inline">
                        <li class="list-inline-item">
                          <a class="btn-floating btn-sm rgba-white-slight mx-1">
                            <i style="color: white;" class="fab fa-facebook-f social"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a class="btn-floating btn-sm rgba-white-slight mx-1">
                            <i style="color: white;" class="fab fa-twitter social"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a class="btn-floating btn-sm rgba-white-slight mx-1">
                            <i style="color: white;" class="fab fa-google-plus-g social"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a class="btn-floating btn-sm rgba-white-slight mx-1">
                            <i style="color: white;" class="fab fa-linkedin-in social"></i>
                          </a>
                        </li>
                      </ul>
                    </div>
                    <hr class="below-hr">
                    <div class="copyright">
                      <p class="text-center ml-3 text-md-center" style="color: white;font-size: small;">© 2020 Copyright:
                        <a href="https://mdbootstrap.com/">
                         E-Placement Helper.com
                        </a>
                      </p>
                    </div>
                    
                </div>
             </div>
             <div class="col-sm-3">
                <div class="pr-5 gif">
                  <img src="./assets/img/animation_640_kg1adc77.gif" height="300px" alt="">
           
                </div>            
              
             </div>
           </div>
           
         </div>
    </footer>
</body>
</html>