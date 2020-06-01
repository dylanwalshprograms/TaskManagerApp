<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="partials/header.jsp" %>

		<main class="container">

		<section class="jumbotron">

			<h2 class="display-3">
				<c:out value="${title}" />
			</h2>

		</section>
		<section>

			<form method="post">

				<input type="hidden" value="${task.id}">

				<div class="form-group">
					<label>Description</label> <input class="form-control" name="description" value = "${task.description}">
				</div>

				<div class="form-group">
					<label>Due Date</label> <input type = "date" class="form-control" name="dueDate" value = "${task.dueDate}">
				</div>
				<div class="form-check form-check-inline">
					<label>Complete:  </label><br><br>
					<input type = "radio" id = "yes" class="form-check-input" name="complete" value = "true">
					<label class="form-check-label" for = "yes">
					Yes  
					</label>
					<input type = "radio" id = "no" class="form-check-input" name="complete" value = "false">
					<label class="form-check-label" for = "no">
					No  
					</label>
				</div><br><br>

				<button class="btn btn-primary">Submit</button>

				<a href="/my-tasks" class="btn btn-light">Cancel</a>

			</form>



		</section>



	</main>
</body>
</html>