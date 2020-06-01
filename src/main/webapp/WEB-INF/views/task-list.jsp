<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="partials/header.jsp" %>

	<main class = "container">
		<section>
			<h2>${user.name}'s Tasks</h2>

			<table class="table">
				<tr>
					<th>Description</th>
					<th>Due Date</th>
					<th>Complete</th>
					<th></th>
				</tr>

				<c:forEach var="task" items="${tasks}">
					<tr>
						<td><c:out value="${task.description}" /></td>
						<td><c:out value="${task.dueDate}" /></td>
						<td><c:out value="${task.complete ? 'Yes' : 'No'}" /></td>
						<td><a class="btn btn-secondary" href="/task/update?id=${task.id}">Update</a> <a
							class="btn btn-danger" href="/task/delete/${task.id}">Delete</a></td>
					</tr>

				</c:forEach>
			</table>

			<a class="btn btn-dark" href="/add-task">Add Task</a>

		</section>
	
	
	
	
	</main>
</body>
</html>