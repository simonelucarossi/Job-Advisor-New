<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Ads</title>
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
<script src="/JobAdvisorNew/js/panel.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDe9jibJf963yX2fZCd6FLxYJzTljlhzhc&callback=initMap"></script>
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
							<input type="text" id="searchInput" class="search-query" placeholder="Search for name..">
						</form>
		        	</li>
		        	<li class="nav-item">
			          	<a id="deleteAd" href="#deleteAdModal"
						class="btn btn-default" data-toggle="modal"><i
						class="fa fa-minus-circle"></i> <span>Delete</span>
						</a>
		        	</li>
		        	 <li class="nav-item">
						<a id="newAdd" href="#addNewModal" class="btn btn-default"
							data-toggle="modal"><i class="fa fa-plus-circle"></i> <span>Add
								New </span>
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
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>ID</th>
						<th>Category</th>
						<th>Price</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${annunci}" var="annuncio">
						<tr>
							<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="${annuncio.getId()}" name="ids[]" value="${annuncio.getId()}">
								<label for="${annuncio.getId()}"></label>
							</span>
							</td>
							<td>${annuncio.getId()}</td>
							<td>${annuncio.getCategoria()}</td>
							<td>${annuncio.getPrezzo()}</td>
							<td>
							<a href="#editAdModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a> 
							<a id="showMyAd" href="#showAdModal" data-toggle="modal"><i style="color:black;" class="fa" data-toggle="tooltip" title="Show">&#xf06e;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
	<!-- Add Modal HTML -->
	<div id="addNewModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="addForm">
					<div class="modal-header">
						<h4 class="modal-title">Add New</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Category</label> 
							<input name="category" type="text" class="form-control" id="inputCategory" placeholder="Category..." required>
							<input name="creator" value="${username}" type="hidden" id="creator">
						</div>
						<div class="form-group">
							<label id="descrip-label" for="inputDescription">Description</label>
						<textarea rows="10" cols="30" name="description" class="form-control" id="inputDescription" required></textarea>
						</div>
						<div class="form-group">
						<label id="priceLabel" for="inputPrice">Job-price</label> 
						<input name="price" type="number" step="0.01" min="5" class="form-control" id="inputPrice" placeholder="Insert a price..." required>
						</div>
						<input name="lat" type="hidden" id="my-lat"> 
						<input name="lon" type="hidden" id="my-lon">
						<div class="form-group" id="map"></div>
						<input id="date" name="date" type="hidden">
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
	<div id="editAdModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="editForm"  method="post" onsubmit="return checkPrice()">
					<div class="modal-header">
						<h4 class="modal-title">Edit Ad</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Category</label> 
							<input type="hidden" name="id">
							<input name="category" type="text" class="form-control" id="inputCategory" required>
						</div>
						<div class="form-group">
							<label id="descrip-label" for="inputDescription">Description</label>
						<textarea rows="10" cols="30" name="description" class="form-control" id="inputDescription" required></textarea>
						</div>
						<div class="form-group">
						<label id="priceLabel" for="inputPrice">Job-price</label> 
						<input name="price" type="number" step="0.01" min="5" class="form-control" id="inputPrice" required>
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
						<h4 class="modal-title">Edit Ad</h4>
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
	<div id="deleteAdModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Delete Ad</h4>
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
	<div id="showAdModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="showForm" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Your Ad</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Category</label> 
							<input type="hidden" name="id">
							<input name="category" type="text" class="form-control" id="inputCategory" readonly>
						</div>
						<div class="form-group">
							<label id="descrip-label" for="inputDescription">Description</label>
						<textarea rows="10" cols="30" name="description" class="form-control" id="inputDescription" readonly></textarea>
						</div>
						<div class="form-group">
						<label id="priceLabel" for="inputPrice">Job-price</label> 
						<input name="price" type="number" step="0.01" min="5" class="form-control" id="inputPrice" readonly>
						</div>
						<div class="form-group">
							<label id="dateLabel" for="date">Date of creation:</label>
							<input id="date" name="date" class="form-control" readonly>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"value="Back"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">�</span>
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
