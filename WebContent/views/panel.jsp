<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Ads</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/JobAdvisorNew/css/panel.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDe9jibJf963yX2fZCd6FLxYJzTljlhzhc&callback=initMap"></script>
<script src="/JobAdvisorNew/js/AdsPanel.js"></script>
</head>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Manage <b>Ads</b>
						</h2>
					</div>
					<div class="col-sm-6">
						<a id="newAdd" href="#addNewModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
								New </span></a> <a href="#deleteAddModal"
							class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Delete</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>ID</th>
						<th>Category</th>
						<th>Price</th>
						<th>Date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${annunci}" var="annuncio">
						<tr>
							<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
							</td>
							<td>${annuncio.getId()}</td>
							<td>${annuncio.getCategoria()}</td>
							<td>${annuncio.getPrezzo()}</td>
							<td>${annuncio.getData()}</td>
							<td><a href="#editEmployeeModal" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
								href="#deleteAddModal" class="delete" data-toggle="modal"><i
									class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">
					Showing <b>5</b> out of <b>25</b> entries
				</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="addNewModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form action="views/createAd" method="post" onsubmit="return checkForm()">
					<div class="modal-header">
						<h4 class="modal-title">Add New</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Category</label> 
							<input name="category" type="text" class="form-control" id="inputCategory" placeholder="Category..." required>
							<input name="lat" type="hidden" id="my-lat"> 
							<input name="lon" type="hidden" id="my-lon">
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
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Edit Ad</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Category</label> <input type="text" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>Description</label> <input type="email" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>Job-price</label>
							<textarea class="form-control" required></textarea>
						</div>
						<div class="form-group">
						<!-- Maps Api-->
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteAddModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="deleteAdForm">
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
						<input type="submit" class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
