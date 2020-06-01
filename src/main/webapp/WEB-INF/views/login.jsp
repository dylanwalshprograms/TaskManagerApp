<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task List Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="partials/header.jsp" %>
	<main class="container">

		<article class="card mx-auto">

			<section class="card-header">

				<h4>
					<c:out value="${message}" />
				</h4>

			</section>

			<section class="card-body">

				<form action="/login/submit" method = "post">

					<div class="form-group">
						<label>Email</label> <input class="form-control"
							name="email" type="text" required />

					</div>

					<div class="form-group">
						<label>Password</label> <input class="form-control"
							name="password" type="password" required />
					</div>

					<button class="btn btn-block btn-secondary">Login</button>

				</form>
				
				<a href="/signup">Sign Up</a>

			</section>

		</article>

	</main>
</body>
</html>