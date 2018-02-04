<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="/JobAdvisorNew/css/subscription.css">
	    <link rel="stylesheet" href="/JobAdvisorNew/vendor/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="/JobAdvisorNew/vendor/bootstrap/css/bootstrap.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

<title>Join us</title>
</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h5>Sign up and start to use <b>JobAdvisor</b>.</h5>
					<form class="form-horizontal" >
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="nome" id="name"  placeholder="Enter your Name" required />
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="surname" class="cols-sm-2 control-label">Surname</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cognome" id="surname"  placeholder="Enter your Surname" required/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="cols-sm-2 control-label">Gender</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
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
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input id="date" name="dataNascita" type="date" class="form-control" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="kind" class="cols-sm-2 control-label">Kind of account</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-tag" aria-hidden="true"></i></span>
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
									<span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
									<input id="phone" name="telefono" type="tel" class="form-control" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span id="message" class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password" required/>
								</div>
							</div>
						</div>

						<div id="register-button" class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="/JobAdvisorNew/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/JobAdvisorNew/vendor/jquery/jquery.min.js"></script>
		<script type="text/javascript">
	            $('form').submit(function(e)
	            {     
	                e.preventDefault();
	                var $form = $(this);

	                    $.ajax(
	                    {
		                    type:'POST',
		                    url:'/JobAdvisorNew/subscribe',
		                    data:$('form').serialize(),
		                    success:function()
		                    {
		                    	location.href="/JobAdvisorNew/index.jsp"
		                    }
	                	});     

	            });
		</script>
		
		<script type="text/javascript">
		$('#confirm').on('keyup', function () {
			  if ($('#password').val() == $('#confirm').val()) {
			    $('#message').html('Matching').css('color', 'green');
			  } else 
			    $('#message').html('Not Matching').css('color', 'red');
			});
		</script>
	</body>
</html>