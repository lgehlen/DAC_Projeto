<%-- 
    Document   : detalhe-orcamento
    Created on : 17/06/2018, 16:02:37
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
	<title>detalhe-orcamento</title>
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
	<!-- Header -->
	<header class="home">

		<div class="bg-img" >
			<div class="overlay"></div>
		</div>
		<!-- Nav -->
		<nav id="nav" class="navbar nav-transparent">
	  		<br>
	  		<!--LOGO -->
	  		<div class="col-sm-1"> <a href="/"><img id="logo" src="logo-always.png" alt="logo"></a></div>
		  	<div class="container">
				<div class="row">
		  			<div class="col-sm-2">
		  				<a href="index.html" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-home"></span> Home
		  				</a>
		  			</div>
		  			<div class="col-sm-3" id="correcao-menu">
		  				<a href="manter-pedidos.jsp" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-pencil"></span> Orçamentos
		  				</a>
		  			</div>
		  			<div class="col-sm-3" id="correcao-menu">
		  				<a href="deleta-conta.jsp" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-refresh"></span> Atualizar Dados
		  				</a>
		  			</div>
		  			<div class="col-sm-1" id="dropdown-menu"> 
                                            <div class="dropdown">
                                                    <button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
                                                    <span class="caret"></span></button>
                                                            <ul class="dropdown-menu">
                                                                    <li><a> <span class="glyphicon glyphicon-user"></span>   User   </a></li>
                                                                    <li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo:Funcionario </a></li>
                                                            <li><a href="/">Home</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
                                                    </ul>
                                            </div>
                                        </div>
		  		</div>
		  	</div>
		</nav>
	</header>
	<!-- Os campos podem ficar bloqeuados ou não segundo o UC, o bloqueio está endo efetuado pela tag readonly e tambpem pelo CSS com o ID valor.  -->
	<div class="container" id="container-detalhe-orcamento">
		<div class="row">
			<div class="col-sm-4"><h3>Detalhe de Orçamento</h3></div>
			<div class="col-sm-7"></div>
		</div>
		<div class="row">
			<div class="col-sm-4"><h4>Dados de Pedido:</h4></div>
			<div class="col-sm-6"></div>
			<div class="col-sm-1"><h3>Status:</h3></div>
			<!-- Cor de Status -->
			<div class="col-sm-1" id="correcao-detalhes"><div id="status-detalhe-orcamento" style=" background-color: red;"></div></div>
		</div>	
		<div class="row">
			<div class="col-sm-12">
				<p>
				 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget hendrerit ligula. Pellentesque nec nisl lectus. Aenean luctus massa felis, nec blandit arcu finibus eu. Nunc diam arcu, scelerisque id vehicula a, sodales ac diam. In ac pretium nulla. Aliquam varius placerat viverra. Phasellus tincidunt, libero quis pulvinar pharetra, justo diam bibendum quam, id tincidunt felis mauris a ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.

				Suspendisse potenti. Pellentesque et hendrerit nisl, non scelerisque mi. Nunc vitae ullamcorper nunc. Curabitur rutrum porta efficitur. In hac habitasse platea dictumst. Ut consectetur vitae purus non placerat. Cras quam purus, aliquet vel lacus non, mattis blandit ante. 
				</p>
			</div>
		</div>
		<!-- Aqui deve entrar o tipo da proposta-->
		<div class="row">
			<div class="col-sm-4"><h4>Proposta Standard:</h4></div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<form>
    				<div class="form-group">
      					<textarea id="valor" class="form-control" rows="5" id="comment" placeholder="Dados do Orçamento Standard" readonly="true"></textarea>
    				</div>
  				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<label for="pwd">SubTotal:</label>
      			<input id="valor" type="password" class="form-control" id="pwd" readonly="true">
			</div>
		</div>
	</div>
	<br>
	<footer class="container-fluid text-center">
       <p>Em caso de problemas contactar o administrador: 
	</footer>
</body>