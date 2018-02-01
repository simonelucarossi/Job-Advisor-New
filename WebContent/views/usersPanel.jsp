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
<link rel="stylesheet" type="text/css" href="/JobAdvisorNew/css/usersPanel.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/JobAdvisorNew/js/usersPanel.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4">
						<a id="brand-site" class="navbar-brand js-scroll-trigger" href="/JobAdvisorNew"> 
							<img id="logo-site" src="img/gps.png">
							<strong id="site-title">JOB ADVISOR</strong>
						</a>
					</div>
					<div class="col-sm-4">
							<form class="form-search form-inline">
								<input type="text" id="searchInput" class="search-query" placeholder="Search for name..">
							</form>
					</div>
					<div class="col-sm-4">
						<a id="newUser" href="#addNewModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
								New </span>
						</a> 
						<a href="#deleteUserModal"
							class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Delete</span>
						</a>
					</div>
				</div>
			</div>
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>Username</th>
						<th>Name</th>
						<th>Occupation</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${utenti}" var="utente">
						<tr>
							<td>
							<c:if test="${utente.getTipo() != 'Amministratore' }">
								<span class="custom-checkbox">
									<input type="checkbox" id="checkbox1" name="ids[]" value="${utente.getUsername()}">
									<label for="checkbox1"></label>
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
							<a id="showMyUser" href="#showUserModal" data-toggle="modal"><i style="color:black;" class="fa" data-toggle="tooltip" title="Show">&#xf06e;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<!--<div class="clearfix">
				<div class="hint-text">
					Showing <b>5</b> out of <b>25</b> entries
				</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>	-->
		</div>
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
									<input id="phone" name="telefono" type="tel" class="form-control" required>
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
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
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
							<label>Username</label> 
							<input name="username" type="text" class="form-control" id="inputUsername">
						</div>
						<div class="form-group">
							<label>Name:</label> 
							<input name="name" type="text" class="form-control" id="inputName">
						</div>
						<div class="form-group">
							<label>Surname:</label> 
							<input name="surname" type="text" class="form-control" id="inputSurname">
						</div>
						<div class="form-group">
							<label>Birth date:</label> 
							<input name="date" type="text" class="form-control" id="inputDate">
						</div>
						<div class="form-group">
							<label>Occupation:</label> 
							<input name="name" type="text" class="form-control" id="inputKind">
						</div>
						<div class="form-group">
							<label>Email:</label> 
							<input name="email" type="text" class="form-control" id="inputEmail">
						</div>
						<div class="form-group">
							<label>Phone:</label> 
							<input name="phone" type="text" class="form-control" id="inputPhone">
						</div>
						<div class="form-group">
							<label>Password:</label> 
							<input name="password" type="text" class="form-control" id="inputPassword">
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
							<label>Category</label> 
							<input type="hidden" name="id">
							<input name="category" type="text" class="form-control" id="category" readonly>
						</div>
						<div class="form-group">
							<label id="descrip-label" for="inputDescription">Description</label>
						<textarea rows="10" cols="30" name="description" class="form-control" id="description" readonly></textarea>
						</div>
						<div class="form-group">
						<label id="priceLabel" for="inputPrice">Job-price</label> 
						<input name="price" type="number" step="0.01" min="5" class="form-control" id="price" readonly>
						</div>
						<div class="form-group">
							<label id="dateLabel" for="date">Date of creation:</label>
							<input id="data" name="date" class="form-control" readonly>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"value="Back"> 
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
