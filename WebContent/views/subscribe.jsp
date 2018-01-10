<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> 
<jsp:useBean id="user" class="com.jobadvisor.model.Utente" scope="request" />
<jsp:setProperty name="user" property="nome" value="un Nome"/>


<html>
<head lang="it">
<title>Job Advisor sign up</title>
<meta charset="utf-8">

<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/signUp.css">
<script src="js/creative.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!--   
<LINK rel="stylesheet" href="css/common.css" type="text/css">
 -->

</head>
<body>
<header>

<!-- 
<jsp:getProperty name="user" property="nome"/>
 -->
 <c:if test="${utente != null}">
 	<h1>Congratulations ${utente.username} , you have been successfully registered!</h1>
 	<h2>Below you can review your data: </h2>	
 	<p>${utente.nome}</p>
 	<p>${utente.cognome}</p>
 	<p>${utente.sesso}</p>
 	<p>${utente.dataNascita}</p>
 	<a class="btn btn-primary" href="../index.jsp" role="button">Home</a>
 </c:if>
 <c:if test="${utente == null}">
	<h2>Complete the form below to register a new user</h2>
 </c:if>
<script language="javascript">
	function messaggioPulisci(){
		alert("Form cleaned!");
	}
</script>

<script type="text/javascript">
function checkPass()
{
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    var message = document.getElementById('confirmMessage');
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    if(pass1.value == pass2.value){
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }else{
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  

</script>

</header>

<section class="moduloRegistrazione" class="row">
<div class="col-lg-3">
	<form method="post" action="subscribe">
		<div class="form-group"><label for="username">Username:</label> <input name="username" type="text" class="form-control" required> </div> 
		<div class="form-group"><label for="nome">Name:</label><input name="nome" type="text" class="form-control" required></div> 
		<div class="form-group"><label for="cognome">Last name:</label> <input name="cognome" type="text" class="form-control" required> </div> 
		<div class="form-group"><label for="Kind-of-account">Gender:</label>			
			<select name="sesso" class="form-control" required>
				<option value="M">Male</option>
				<option value="F">Female</option>
			</select>		
		</div>		
		<div class="form-group"><label for="dataNascita">Date of birth:</label> <input name="dataNascita" type="date" class="form-control" required> </div> 
		<div class="form-group"><label for="password">Password:</label> <input id="pass1" name="password" type="password" class="form-control" required> </div> 
		<div class="form-group"><label for="confermaPassword">Confirm password:</label>  <input onkeyup="checkPass(); return false;" id="pass2" name="confermaPassword" type="password" class="form-control" required> <span id="confirmMessage" class="confirmMessage"></span> </div> 
		<div class="form-group"><label for="Kind-of-account">Kind of account:</label>			
			<select name="tipo" class="form-control" required>
				<option value="Cliente">Customer</option>
				<option value="Professionista">Professional</option>
			</select>		
		</div>		
		<div class="form-group">
			<input name="resetDati" type="reset" value="Reset"  class="btn btn-danger" onclick="messaggioPulisci();"/>
			<input name="inviaDati" type="submit" value="Submit"  class="btn btn-success"/>
		</div>		
	</form>
</div>
</section>


</body>
</html>