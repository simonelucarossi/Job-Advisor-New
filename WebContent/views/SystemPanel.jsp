<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JobAdvisor ~ SystemPanel</title>
    <link href="/JobAdvisorNew/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/JobAdvisorNew/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/JobAdvisorNew/css/systemPanel.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a id="brand-site" class="navbar-brand js-scroll-trigger"
			href="/JobAdvisorNew"> <img id="logo-site" src="/JobAdvisorNew/img/gps.png">
			<strong id="site-title">JOB ADVISOR</strong>
		</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
	          	<a class="nav-link" data-toggle="modal"  href="#logoutModal">
	            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        	</li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">System Panel
        <small>from here you can manage the System</small>
      </h1>

      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="/JobAdvisorNew/img/users.jpg" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Manage Users</h3>
          <p>By the button below you can access to users management panel. Here you can choose any basic operation to execute on user's accounts, for example: creating and deleting accounts,or simply editing some features or blocking access to the web site.</p>
          <a class="btn btn-primary" href="/JobAdvisorNew/allUsers">Users Panel</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="/JobAdvisorNew/img/ads.jpg" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Manage Ads</h3>
          <p>Using the button below you can access to management panel for Ads. In these section you can decide to search for an Ad in the Web site and then to edit its content or just to delete the Ad.</p>
          <a class="btn btn-primary" href="/JobAdvisorNew/allAds">Ads Panel</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="/JobAdvisorNew/img/reviews.jpg" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Manage Reviews</h3>
          <p>Here you can access to Reviews panel. The panel shows all existing reviews on the web site, and it gives the opportunity to show reviews' content, that can be edited or deleted.</p>
          <a class="btn btn-primary" href="/JobAdvisorNew/allReviews">Reviews Panel</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>
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
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; JobAdvisor 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/JobAdvisorNew/vendor/jquery/jquery.min.js"></script>
    <script src="/JobAdvisorNew/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>