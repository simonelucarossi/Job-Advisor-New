<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Users</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/JobAdvisorNew/css/adminPanels.css">        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/JobAdvisorNew/js/usersPanel.js"></script>
<script src="/JobAdvisorNew/vendor/jquery/jquery.min.js"></script>
<script src="/JobAdvisorNew/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
     <div class="container">
			<a id="brand-site" class="navbar-brand js-scroll-trigger" href="/JobAdvisorNew"> 
				<img id="logo-site" src="img/gps.png">
				<strong id="site-title">JOB ADVISOR</strong>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
		          	<form class="form-search form-inline">
						<input type="text" id="searchInput" class="search-query" placeholder="Filter...">
					</form>
	        	</li>
	        	<li class="nav-item">
		          	<a id="deleteUser" href="#deleteUserModal"
					class="btn btn-default" data-toggle="modal"><i
					class="fa fa-minus-circle"></i> <span>Delete</span>
					</a>
	        	</li>
	        	 <li class="nav-item">
		          	<a id="banUser" href="#banUserModal"
					class="btn btn-default" data-toggle="modal"><i
					class="fa">&#xf023;</i> <span>Ban</span>
					</a>
	        	</li>
	        	 <li class="nav-item">
					<a id="newUser" href="#addNewModal" class="btn btn-default"
						data-toggle="modal"><i class="fa fa-plus-circle"></i> <span>Add
							New </span>
					</a> 
	        	</li>
	        	<li class="nav-item">
		          	<a id="blackListButton" href="#blackListModal"
					class="btn btn-default" data-toggle="modal"><i class="fa fa-user-times"></i>
					 <span>Black list</span>
					</a>
	        	</li>
	        	<li class="nav-item">
		          	<a id="logoutButton" class="btn btn-default" data-toggle="modal"  href="#logoutModal">
		            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
	        	</li>
	          </ul>
		</div>
	</div>
</nav>

<div id="wrapper">
<!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="/JobAdvisorNew">
                        Main navigation
                    </a>
                </li>
                <li>
                    <a href="/JobAdvisorNew">Home</a>
                </li>
                <li>
                    <a href="/JobAdvisorNew/allReviews">Reviews panel</a>
                </li>
                <li>
                    <a href="/JobAdvisorNew/allAds">Ads panel</a>
                </li>
                <li>
                    <a href="/JobAdvisorNew/views/SystemPanel.jsp">System panel</a>
                </li>
            </ul>
  		</div>
         <!-- end of Sidebar -->
</div>	
	
	<div class="table-responsive">		
        <!-- Data Table -->
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th class="sort" >Username<i class="fa fa-sort-desc"></i></th>
						<th class="sort" >Name<i class="fa fa-sort-desc"></i></th>
						<th class="sort" >Occupation<i class="fa fa-sort-desc"></i></th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${utenti}" var="utente">
						<tr>
							<td>
							<c:if test="${utente.getTipo() != 'Amministratore' }">
								<span class="custom-checkbox">
									<input type="checkbox" id="${utente.getUsername()}" value="${utente.getUsername()}">
									<label for="${utente.getUsername()}"></label>
								</span>
							</c:if>
							<c:if test="${utente.getTipo() == 'Amministratore' }">
								<strong id="admin">ADMIN</strong>
							</c:if>
							</td>
							<td>${utente.getUsername()}</td>
							<td>${utente.getNomeCompleto()}</td>
							<td>${utente.getTipo()}</td>
							<td>
							<a href="#editUserModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a> 
							<a id="showMyUser" href="#showUserModal" data-toggle="modal"><i class="fa" data-toggle="tooltip" title="Show">&#xf06e;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- End of data table -->
</div>

	<!-- Add Modal HTML -->
	<div id="addNewModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="createForm">
					<div class="modal-header">
						<h4 class="modal-title">Add New</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="nome" id="name"  placeholder="Enter your Name" required />
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="surname" class="cols-sm-2 control-label">Surname</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="cognome" id="surname"  placeholder="Enter your Surname" required/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="cols-sm-2 control-label">Gender</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<select id="gender" name="sesso"
										class="form-control" required>
										<option value="M">Male</option>
										<option value="F">Female</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="date" class="cols-sm-2 control-label">Birth date</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input id="date" name="dataNascita" type="date" class="form-control" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="kind" class="cols-sm-2 control-label">Kind of account</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<select
										id="kind" name="tipo" class="form-control" required>
										<option value="Cliente">Customer</option>
										<option value="Professionista">Professional</option>
									</select>		
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">Phone</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input id="phone" name="telefono" type="tel" class="form-control"  placeholder="Enter your phone number" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password" required/>
								</div>
							</div>
						</div>
						<div id="passDiv" class="form-group"></div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"value="Cancel"> 
						<input type="submit" class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editUserModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="editForm"  method="post" onsubmit="return checkPrice()">
					<div class="modal-header">
						<h4 class="modal-title">Edit account</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input name="username" type="hidden" class="form-control" >
							<label>Name:</label> 
							<input name="name" type="text" class="form-control">
						</div>
						<div class="form-group">
							<label>Surname:</label> 
							<input name="surname" type="text" class="form-control" >
							<input name="gender" type="hidden" class="form-control" >
							<input name="tipo" type="hidden" class="form-control" >
						</div>
						<div class="form-group">
							<label>Birth date:</label> 
							<input name="data" type="text" class="form-control">
						</div>
						<div class="form-group">
							<label>Email:</label> 
							<input name="email" type="text" class="form-control">
						</div>
						<div class="form-group">
							<label>Phone:</label> 
							<input name="phone" type="text" class="form-control">
						</div>
						<div class="form-group">
							<label>Password:</label> 
							<input name="password" type="text" class="form-control">
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"value="Cancel"> 
							<a href="#confirmEditModal"
							class="btn btn-success" data-toggle="modal"><i
							class="material-icons"></i> <span>Save</span></a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="confirmEditModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Edit account</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to save these changes?</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id"> 					
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<input id="saveButton" type="button" class="btn btn-success" value="Save Changes">
					</div>
			</div>
		</div>
	</div>
	<!-- Ban Modal HTML -->
	<div id="banUserModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Ban account/accounts</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>For how much time the user/s will be banned?</p>
						<p class="text-warning">
							<strong>Please insert time of ban below:</strong>
						</p>
						<select id="banTime" name="time"
							class="form-control" required>
							<option value="1">1 day</option>
							<option value="5">5 days</option>
							<option value="15">15 days</option>
							<option value="30">30 days</option>
						</select>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id"> 					
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<a class="btn btn-success" data-toggle="modal"  href="#confirmBanModal">Next</a>
					</div>
			</div>
		</div>
	</div>
	<div id="confirmBanModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Confirm operation</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to ban these Users?</p>
						<p class="text-warning">
							<strong>The will be added to "black list"</strong>
						</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id"> 					
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<input id="banButton" type="button" class="btn btn-warning" value="Ban">
					</div>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteUserModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Delete account/accounts</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id"> 					
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<input id="deleteButton" type="button" class="btn btn-danger" value="Delete">
					</div>
			</div>
		</div>
	</div>
	<!-- Show Modal HTML -->
	<div id="showUserModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="showForm" method="post">
					<div class="modal-header">
						<h4 class="modal-title">User account properties</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Username:</label> 
							<input name="username" type="text" class="form-control"  readonly>
						</div>					
						<div class="form-group">
							<label>Name:</label> 
							<input name="name" type="text" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Surname:</label> 
							<input name="surname" type="text" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Gender:</label> 
							<input name="gender" type="text" class="form-control" readonly>
						</div>	
						<div class="form-group">
							<label>Birth date:</label> 
							<input name="data" type="text" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Occupation:</label> 
							<input name="tipo" type="text" class="form-control" id="inputUsername" readonly>
						</div>	
						<div class="form-group">
							<label>Email:</label> 
							<input name="email" type="text" class="form-control" id="inputEmail" readonly>
						</div>
						<div class="form-group">
							<label>Phone:</label> 
							<input name="phone" type="text" class="form-control" id="inputPhone" readonly>
						</div>
						<div class="form-group">
							<label>Password:</label> 
							<input name="password" type="text" class="form-control" id="inputPassword" readonly>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"value="Back"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Black List Modal HTML -->
	<div id="blackListModal" class="modal fade">
		<div class="modal-dialog">
			<div id="modalContent" class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Black list</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>The following list shows all banned accounts</p>
						<table id="blackList" class="table">
						  <thead>
						    <tr>
								<th scope="col">
									<span class="custom-checkbox"> 
										<input type="checkbox" id="selectAllList"> <label for="selectAllList"></label>
									</span>
								</th>
								<th scope="col">Username</th>
								<th scope="col">End of ban</th>
						    </tr>
						  </thead>
						  <tbody>
						  </tbody>
						</table>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id"> 					
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<input id="deleteFromList" type="button" class="btn btn-danger" value="Delete">
					</div>
			</div>
		</div>
	</div>
	<!-- Logout modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="/JobAdvisorNew/logout">Logout</a>
          </div>
        </div>
      </div>
      </div>
</body>
</html>
