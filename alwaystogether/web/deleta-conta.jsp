<%-- 
    Document   : deleta_conta
    Created on : 17/06/2018, 16:01:25
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
	<title>deletar_conta</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="CSS/style.css" />
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
		  				<a href="#" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-refresh"></span> Atualizar Dados
		  				</a>
		  			</div>
		  			<div class="col-sm-1" id="dropdown-menu"> 
                                            <div class="dropdown">
                                                    <button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
                                                    <span class="caret"></span></button>
                                                            <ul class="dropdown-menu">
                                                                    <li><a> <span class="glyphicon glyphicon-user"></span>   User   </a></li>
                                                                    <li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo:Funcionário </a></li>
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
	<div class="container" id="container-deletar-conta">
		<div class="row">
			<div class="col-sm-4"><h4> Dados Pessoais </h4></div>
		</div>
		<div class="row">
			<div class="col-sm-1"><h4> User: </h4></div>
			<div class="col-sm-4"><h4> Luiza Storrer </h4></div>
			<div class="col-sm-2"><h4> Cargo:</h4></div>
			<div class="col-sm-4" id="profissao-deleta-conta"><h4> Luterana </h4></div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-1"><h4> CPF: </h4></div>
			<div class="col-sm-4"><h4> 104.912.559-26 </h4></div>
		</div>
		<div class="row">
			<div class="row" id="glypicon-login">
			    <div class="col-sm-9"></div>
			    	<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#Modal-editar">
							<span class="glyphicon glyphicon-pencil"></span>
						</button>
						<!-- Modal -->
		  				<div class="modal fade" id="Modal-editar" role="dialog">
		    				<div class="modal-dialog">
		      			<!-- Modal content-->
		      					<div class="modal-content">
		        					<div class="modal-header">
		          						<button type="button" class="close" data-dismiss="modal">&times;</button>
		          						<h4 class="modal-title">Atualizar Dados</h4>
		        					</div>
		        					<div class="modal-body">
		         						<form>
		         							<div class="row">
			         							<div class="col-sm-12">
													<input name="email-senha" id=" " type="text" class="form-control" placeholder="Email">
												</div>
											</div>
											<br>
											<div class="row">
			         							<div class="col-sm-12">
													<input name="email-senha" id=" " type="text" class="form-control" placeholder="Senha">
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-sm-4"></div>
			         							<div class="col-sm-3">
													<button type="button" class="btn btn-info btn-lg">
          												<span class="glyphicon glyphicon-ok"></span>
        											</button>
												</div>
												<div class="col-sm-3">
													<button type="button" class="btn btn-info btn-lg">
          												<span class="glyphicon glyphicon-remove"></span>
        											</button>
												</div>
											</div>
		         						</form>
		        					</div>
		        					<div class="modal-footer">
		          						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
		        					</div>
		      					</div>
		    				</div>
		  				</div>
					</div>
					<div class="col-sm-1">
						<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#Modalexcluir">
							<span class="glyphicon glyphicon-trash"></span>
						</button>
						<!-- Modal -->
		  				<div class="modal fade" id="Modalexcluir" role="dialog">
		    				<div class="modal-dialog">
		      			<!-- Modal content-->
		      					<div class="modal-content">
		        					<div class="modal-header">
		          						<button type="button" class="close" data-dismiss="modal">&times;</button>
		          						<h4 class="modal-title">Exclusão de Conta</h4>
		        					</div>
		        					<div class="modal-body">
		         						<form>
		         							<div class="row">
			         							<div class="col-sm-12" style="text-align: center;">
													<h4>Digite sua Senha para Completar a Ação!</h4>
												</div>
											</div>
											<br>
		         							<div class="row">
			         							<div class="col-sm-12">
													<input name="email-senha" id=" " type="text" class="form-control" placeholder="Senha">
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-sm-4"></div>
			         							<div class="col-sm-4">
													<a href="#" class="btn btn-info btn-lg">
		      											<span class="glyphicon glyphicon-alert"></span> Deletar Conta
		      										</a>
												</div>
												<div class="col-sm-4"></div>
											</div>
		         						</form>
		        					</div>
		        					<div class="modal-footer">
		          						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
		        					</div>
		      					</div>
		    				</div>
		  				</div>
					</div>
		     </div>	
		</div>
	</div>
	
	<br>
	<footer class="container-fluid text-center">
       <p>Em caso de problemas contactar o administrador: 
	</footer>
</body>