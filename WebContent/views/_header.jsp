<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<nav id="nav-bar-mobile" class="navbar navbar-expand-lg navbar-light fixed-top">
	<div class="container">
		<a id="brand-site" class="navbar-brand js-scroll-trigger"
			href="/JobAdvisorNew"> <img id="logo-site" src="/JobAdvisorNew/img/gps.png">
			<strong id="site-title">JOB ADVISOR</strong>
		</a>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item" style="padding-right: 20px;">
				<c:if test="${utente.tipo=='Professionista'}">
					<a id="ads_panel" class="nav-link js-scroll-trigger"
						href="adsPanel?username=${utente.username}">Ads Panel</a>
				</c:if>
			</li>
			<li class="nav-item" style="padding-right: 20px;">
				<c:if test="${utente.tipo=='Amministratore'}">
					<a id="system_panel" class="nav-link js-scroll-trigger"
						href="/JobAdvisorNew/views/SystemPanel.jsp">System Panel</a>
				</c:if>
			</li>
			<li  class="nav-item">
			<c:if test="${utente == null}">
					<span id="login-img" class="fa fa-user"> </span>
				</c:if>
			</li>
			<li  class="nav-item"><c:if test="${utente != null }">
					<a id="logout" class="nav-link js-scroll-trigger" href="/JobAdvisorNew/logout">Logout</a>
				</c:if></li>
		</ul>
	</div>
</nav>

