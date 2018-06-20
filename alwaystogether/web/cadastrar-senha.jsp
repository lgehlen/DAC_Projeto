<%-- 
    Document   : cadastrar-senha.jsp
    Created on : 17/06/2018, 16:00:20
    Author     : thiag
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>cadastrar-senha</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body >
	<div class="container" id="container-nova-senha">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4"><h4>Recuperar Senha</h4></div>
			<div class="col-sm-4"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<form>
					<input type="password" class="form-control" id="pwd" placeholder="Senha">
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<form>
					<input type="password" class="form-control" id="pwd" placeholder="Confirme sua Senha">
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-3">
				<button type="button" class="btn btn-default btn-lg">
          <span class="glyphicon glyphicon-floppy-open"></span>
        </button>
			</div>
			<div class="col-sm-4"></div>
		</div>

	</div>
</body>