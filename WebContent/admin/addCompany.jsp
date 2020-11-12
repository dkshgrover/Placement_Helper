<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../assets/img/favicon.ico"
	type="image/x-icon">
<title>Company</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">
	<%
		if (session.getAttribute("unameAdmin") == null) {
		request.getRequestDispatcher("../servlet1?loginFirst=You are not logged in**").forward(request, response);
	}
	%>
	<%
		ResultSet rs = (ResultSet) session.getAttribute("resultSet");
		ResultSet rs6 = (ResultSet) session.getAttribute("resultSet6");
		session.removeAttribute("resultSet6");
		int cid = 0;
		String ctype = "";
		if(rs6 != null){
			cid = Integer.parseInt(request.getParameter("cid"));	
			if(rs6.getInt(5) == 1){
				ctype = "Technical";
			}else if(rs6.getInt(5) == 2){
				ctype = "Business";
			}else if(rs6.getInt(5) == 3){
				ctype = "Pharmaceutical";
			}else{
				ctype = "Hotels";
			}
		}
	%>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<%
			out.print("<a class='sidebar-brand d-flex align-items-center justify-content-center' href='../indexAdmin?id="+rs.getInt(1)+"'>");
				out.print("<div class='sidebar-brand-icon rotate-n-15'>");
					out.print("<i class='fas fa-laugh-wink'></i>");
				out.print("</div>");
				out.print("<div class='sidebar-brand-text mx-3'>Placement Helper</div>");
			out.print("</a>");
			%>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<%out.print("<li class='nav-item'><a class='nav-link' href='../indexAdmin?id="+rs.getInt(1)+"'> <i class='fas fa-fw fa-tachometer-alt'></i> <span>Dashboard</span></a></li>");%>
			
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="../getProjects"> <i class="fas fa-fw fa-cog"></i> <span>Projects</span>
			</a></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item active">
				<%out.print("<a class='nav-link collapsed' href='../getCompanies?type="+rs.getInt(9)+"'> <i class='fas fa-fw fa-wrench'></i><span>Companies</span></a>");%>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="../getRequests">
					<i class="fas fa-fw fa-table"></i> <span>Requests</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<div class="topbar-divider d-none d-sm-block"></div>
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"><%=rs.getString(2)%></span>
								<img class="img-profile rounded-circle" src="img/cgc.jpg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a style="cursor: pointer; color: black;" class="dropdown-item"
									data-toggle="modal" data-target="#exampleModal"><i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Change
									Pass</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>	
					<div id="alert" style="width: 100%;position: fixed;margin-top: 80px;"> </div>	
				</nav>
				<p style="margin-top: 2%; margin-left: 2%; color: red;"><%=(request.getParameter("error") == null) ? "" : request.getParameter("error")%></p>
				<!-- End of Topbar -->
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Change
									Password</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="container formChange">
									<form action="../changePass?as=admin" method="post">
										<div class="input-group mb-3">

											<input type="password" required class="form-control"
												placeholder="Password" name="oldP" aria-label="Username"
												aria-describedby="basic-addon1">
										</div>
										<div class="input-group mb-3">

											<input type="password" required class="form-control"
												id="newPass" placeholder="New Password" name="newP"
												aria-label="Username" aria-describedby="basic-addon1">
										</div>
										<div class="input-group mb-3">

											<input type="password" required class="form-control"
												id="confirmPass" name="repeatPass"
												placeholder="Confirm Password" aria-label="Username"
												aria-describedby="basic-addon1">
										</div>
										<div class="modal-footer">

											<input type="submit" id="sub2" value="Save changes"
												class="btn btn-primary">
										</div>
									</form>
								</div>
								<div id="succes"></div>
							</div>

						</div>
					</div>
				</div>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="text-center">Company Details</h1>
					<%
						if(rs6 == null){
							out.print("<form action='../AddNewCompany' method='post' enctype='multipart/form-data'>");
								out.print("<div class='row mt-5'>");
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Company Name</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='cname'></div></div>");
									
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Company Type</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='ctype'></div></div>");
									
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Founder</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='founder'></div></div>");									
									
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Website</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='website'></div></div>");
								out.print("</div>");
								
								out.print("<div class='row'>");
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Process</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='process' placeholder='Process separated by commas'></div></div>");
		
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Requirement</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='noofreq'></div></div>");
							
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Test Platform</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='platform'></div></div>");
							
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Package</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='package'></div></div>");
								out.print("</div>");
						
								out.print("<div class='row'>");
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Company Type</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<select class='form-control' id='basic-url' aria-describedby='basic-addon3' name='ctid'>");
									out.print("<option disabled selected>Choose..</option>");
									out.print("<option value=1>Technical</option>");
									out.print("<option value=2>Business</option>");
									out.print("<option value=3>Pharmaceutical</option>");
									out.print("<option value=4>Hotels</option>");
									out.print("</select></div></div>");
									
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Contact Number</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='contact'></div></div>");
							
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Contact Email</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='email'></div></div>");
							
									out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Head Location</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='location'></div></div>");
								out.print("</div>");
								
								out.print("<div class='row'>");
								out.print("<div class='col-sm-3'>");
									out.print("<label for='basic-url'>Visiting Date</label>");
									out.print("<div class='input-group mb-3'>");
									out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='date' placeholder='DD/MM/YYYY'></div></div>");
									
									out.print("<div class='col-sm-9'>");
									out.print("<div class='form-group'>");
									out.print("<label for='exampleFormControlTextarea1'>Company Description</label>");
									out.print("<textarea class='form-control' id='exampleFormControlTextarea1' rows='2' name='cdescr'></textarea></div></div>");
								out.print("</div>");
								
								out.print("<div class='row'>");
									out.print("<div class='col-sm-12'>");
									out.print("<div class='input-group mb-3'>");
									out.print("<div class='custom-file'>");
									out.print("<input type='file' class='custom-file-input' id='inputGroupFile02' name='image' multiple>"); 
									out.print("<label class='custom-file-label' for='inputGroupFile02'>Choose 3 files (2800pxX2000px)</label></div></div></div>");
								out.print("</div>");
											
								out.print("<div class='row'>");
									out.print("<div class='col-sm-12'>");
									out.print("<button type='submit' id='sub' class='btn btn-primary mt-3'>Submit</button></div>");
								out.print("</div>");	
							out.print("</form>");
						}else{
							out.print("<form action='../editCompanyFinal' method='post' enctype='multipart/form-data'>");
							out.print("<div class='row mt-1'>");
								out.print("<div class='col-sm-1'>");
								out.print("<div class='input-group mb'>");
								out.print("<input type='text' class='form-control' value="+cid+" name='cid'></div></div>");
							out.print("</div>");
						
							out.print("<div class='row mt-5'>");
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Company Name</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='cname' value='"+rs6.getString(2)+"'></div></div>");
								
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Company Type</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='ctype' value='"+rs6.getString(3)+"'></div></div>");
								
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Founder</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='founder' value='"+rs6.getString(4)+"'></div></div>");									
								
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Website</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='website' value='"+rs6.getString(6)+"'></div></div>");
							out.print("</div>");
							
							out.print("<div class='row'>");
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Process</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='process'  value='"+rs6.getString(7)+"'></div></div>");
	
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Requirement</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='noofreq' value='"+rs6.getInt(8)+"'></div></div>");
						
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Test Platform</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='platform' value='"+rs6.getString(9)+"'></div></div>");
						
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Package</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='package' value='"+rs6.getString(10)+"'></div></div>");
							out.print("</div>");
					
							out.print("<div class='row'>");
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Company Type</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<select class='form-control' id='basic-url' aria-describedby='basic-addon3' name='ctid'>");
								out.print("<option value='"+rs6.getInt(5)+"'selected>"+ctype+"</option>");
								out.print("<option value=1>Technical</option>");
								out.print("<option value=2>Business</option>");
								out.print("<option value=3>Pharmaceutical</option>");
								out.print("<option value=4>Hotels</option>");
								out.print("</select></div></div>");
								
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Contact Number</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='contact' value='"+rs6.getString(11)+"'></div></div>");
						
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Contact Email</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='email' value='"+rs6.getString(12)+"'></div></div>");
						
								out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Location</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='location' value='"+rs6.getString(18)+"'></div></div>");
							out.print("</div>");
							
							out.print("<div class='row'>");
							out.print("<div class='col-sm-3'>");
								out.print("<label for='basic-url'>Visiting Date</label>");
								out.print("<div class='input-group mb-3'>");
								out.print("<input type='text' class='form-control' id='basic-url' aria-describedby='basic-addon3' name='date' placeholder='DD/MM/YYYY' value='"+rs6.getString(14)+"'></div></div>");
								
								out.print("<div class='col-sm-9'>");
								out.print("<div class='form-group'>");
								out.print("<label for='exampleFormControlTextarea1'>Company Description</label>");
								out.print("<textarea class='form-control' id='exampleFormControlTextarea1' rows='2' name='cdescr'>"+rs6.getString(13)+"</textarea></div></div>");
							out.print("</div>");
							
							out.print("<div class='row'>");
								out.print("<div class='col-sm-12'>");
								out.print("<div class='input-group mb-3'>");
								out.print("<div class='custom-file'>");
								out.print("<input type='file' class='custom-file-input' id='inputGroupFile02' name='image' multiple>"); 
								out.print("<label class='custom-file-label' for='inputGroupFile02'>Choose 3 files (2800pxX2000px)</label></div></div></div>");
							out.print("</div>");
										
							out.print("<div class='row'>");
								out.print("<div class='col-sm-12'>");
								out.print("<button type='submit' id='sub1' class='btn btn-primary mt-3'>Update Details</button></div>");
							out.print("</div>");	
						out.print("</form>");
						}	
					%>

				</div>

			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; E-Placement Helper</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="../logoutServlet?as=admin">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>
<script>
  var alert = document.getElementById('alert');
  var submit = document.getElementById('sub1');
  console.log(submit);
  
  submit.addEventListener('click',(e)=>{
    alert.innerHTML=`<div class="alert alert-success" role="alert">
        Company updated!
      </div>`;
      setTimeout(() => {
        console.log('done');

        alert.innerHTML=``;
      }, 2400);
  })
</script>
<script>
  var alert = document.getElementById('alert');
  var submit = document.getElementById('sub');
  console.log(submit);
  
  submit.addEventListener('click',(e)=>{
    alert.innerHTML=`<div class="alert alert-success" role="alert">
        Company added!
      </div>`;
      setTimeout(() => {
        console.log('done');

        alert.innerHTML=``;
      }, 3000);
  })
</script>
<script>
  var alert = document.getElementById('alert');
  var submit = document.getElementById('sub2');
  console.log(submit);
  
  submit.addEventListener('click',(e)=>{
    alert.innerHTML=`<div class="alert alert-success" role="alert">
        Password changed!
      </div>`;
      setTimeout(() => {
        console.log('done');

        alert.innerHTML=``;
      }, 3000);
  })
</script>
<script>
  var passwordBtn = document.getElementById('passwordBtn');
  var modalBody = document.getElementsByClassName('modal-body');
  var formChange = document.getElementsByClassName('formChange');
  var sucess = document.getElementById('succes');
  var newPass = document.getElementById('newPass');
  var confirmPass = document.getElementById('confirmPass');
  passwordBtn.addEventListener('click',()=>{
	    if(newPass.value!=confirmPass.value&&newPass.value!='')
	    {
	      
	    	 modalBody[0].removeChild(formChange[0]);
	    	    
	         sucess.innerHTML=`
	         </div>
	         <div class="d-flex justify-content-center"> <img src="../assets/img/22893-error-animation.gif" height="300px" width="300px" alt=""></div>
	         <h3 class="text-center">Passwords didn't matched</h3>
	        
	         `;
	         passwordBtn.remove();
    
    }
  })
 
 
</script>
</html>
