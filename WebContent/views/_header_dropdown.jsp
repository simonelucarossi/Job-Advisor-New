<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<nav id="nav-bar-mobile"
		class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container">
			<a id="brand-site" class="navbar-brand js-scroll-trigger"
				href="index.jsp"> <img id="logo-site" src="img/gps.png"> <strong
				id="site-title">JOB ADVISOR</strong>
			</a> 
			<div class="btn-group">
				<a id="cong-funz" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="glyphicon glyphicon-cog"></span>
				</a>
				<div style="font-size: 18px;" class="dropdown-menu">
					<a class="dropdown-item" href="views/creaAnnuncio.jsp"><strong>Create
							new Ad</strong></a> <a class="dropdown-item" href="#"><strong>Delete
							Ad</strong></a> <a class="dropdown-item" href="#"><strong>Modify
							Ad</strong></a>
				</div>
			</div>
		</div>
</nav>