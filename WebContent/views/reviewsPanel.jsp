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
<script src="/JobAdvisorNew/js/reviewPanel.js"></script>
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
			          	<a id="deleteUser" href="#deleteReviewModal"
						class="btn btn-default" data-toggle="modal"><i
						class="fa fa-minus-circle"></i> <span>Delete</span>
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
                    <a href="/JobAdvisorNew/allUsers">Users panel</a>
                </li>
                <li>
                    <a href="/JobAdvisorNew/allAds">Ads panel</a>
                </li>
                <li>
                    <a href="/JobAdvisorNew/views/SystemPanel.jsp">System panel</a>
                </li>
            </ul>
		</div>
</div>
 <!-- end of Sidebar -->  
 
    <div class="table-responsive">
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th class="sort" >ID<i class="fa fa-sort-desc"></i></th>
						<th class="sort" >Title<i class="fa fa-sort-desc"></i></th>
						<th class="sort" >Text<i class="fa fa-sort-desc"></i></th>
						<th class="sort" >Stars<i class="fa fa-sort-desc"></i></th>
						<th class="sort" >Ads-ID<i class="fa fa-sort-desc"></i></th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recensioni}" var="recensione">
						<tr>
							<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="ids[]" value="${recensione.getId()}">
								<label for="checkbox1"></label>
							</span>
							</td>
							<td>${recensione.getId()}</td>
							<td>${recensione.getTitolo()}</td>
							<td>${recensione.getTesto()}</td>
							<td>${recensione.getValutazione()}</td>
							<td>${recensione.getAnnuncio()}</td>
							<td>
							<a href="#editReviewModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a> 
							<a id="showMyReview" href="#showReviewModal" data-toggle="modal"><i class="fa" data-toggle="tooltip" title="Show">&#xf06e;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	
	<!-- Edit Modal HTML -->
	<div id="editReviewModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="editForm"  method="post">
					<div class="modal-header">
						<h4 class="modal-title">Edit Review</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Title</label> 
							<input type="hidden" name="id">
							<input name="title" type="text" class="form-control" id="inputTitle" required>
							<input name="idAds" type="hidden">
						</div>
						<div class="form-group">
							<label id="text-label" for="inputText">Text</label>
						<textarea rows="10" cols="30" name="text" class="form-control" id="inputText" required></textarea>
						</div>
						<div class="form-group">
						<label id="starsLabel" for="inputPrice">Stars-Review</label> 
						<input name="stars" type="number" step="1" min="1" class="form-control" id="inputStars" required>
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
						<h4 class="modal-title">Edit Review</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to save these changes?</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id"> 
						<input name="idAds" type="hidden">
											
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<input id="saveButton" type="button" class="btn btn-success" value="Save Changes">
					</div>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteReviewModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Delete Review</h4>
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
						<input name="idAds" type="hidden">
											
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
						<input id="deleteButton" type="button" class="btn btn-danger" value="Delete">
					</div>
			</div>
		</div>
	</div>
	<!-- Show Modal HTML -->
	<div id="showReviewModal" class="modal fade">
		<div class="modal-dialog">
			<div id="creationForm" class="modal-content">
				<form id="showForm" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Your Review</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Title</label> 
							<input type="hidden" name="id">
							<input name="title" type="text" class="form-control" id="inputTitle" readonly>
						</div>
						<div class="form-group">
							<label id="text-label" for="inputText">Text</label>
						<textarea rows="10" cols="30" name="text" class="form-control" id="inputText" readonly></textarea>
						</div>
						<div class="form-group">
						<label id="starsLabel" for="inputStars">Stars-Review</label> 
						<input name="stars" type="number" step="1" min="1" class="form-control" id="inputStars" readonly>
						
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
