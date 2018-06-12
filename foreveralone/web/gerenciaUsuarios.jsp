<%-- 
    Document   : gerenciaUsuarios
    Created on : 10/06/2018, 16:50:30
    Author     : gqueiroz
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
	<title>gerencia_usuarios</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
	
</head>

<body>
	<!-- Header -->
	<header class="home">
		<div class="bg-img" >
			<div class="overlay"></div>
		</div>
		<!-- Nav -->
		<nav id="nav" class="navbar nav-transparent">
	  		<br>
	  		<div id="cabe">
	  			<!--LOGO -->
	  			<div class="col-sm-1" id="logo"> <a href="/"><img id="logo" src="logo-forever.png" alt="logo" width="120" height="100"></a></div>
		  		<div class="container">
					<div class="row">
		  				<div class="col-sm-3">
		  					<a href="/" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-4">
		  					<a href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-user"></span> Gerenciar Usuários
		  					</a>
		  				</div>
		  				<div class="col-sm-4">
		  					<a href="cadastro_evento.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-fire"></span> Criar Evento/Festas
		  					</a>
		  				</div>
		  				<div class="col-sm-1"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
                                                                    <li><a> <span class="glyphicon glyphicon-user"></span>   <c:out value="${login.nome}"></c:out>   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: <c:out value="${login.tipo}"></c:out>   </a></li>
		      						<li><a href="/">Home</a></li>
		      						<li class="divider"></li>
		      						<li><a href="#"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
	    						</ul>
	  						</div>
    					</div>
		  			</div>
		  		</div>
		  	</div>
		</nav>
	</header>
	<!--Corpo da página-->
	<div class="container" id="container-pesquisa-pares">
		<div class="row">
			<div class="col-sm-4"><h4> Lista de Clientes</h4></div>
		</div>
		<br>
		<div class="row" id="relatorios">
			<div class="col-sm-1"><h4>24</h4></div>
			<div class="col-sm-9"><h4> Gabriel Vieira</h4></div>
			<!--Modal-->
			<div class="col-sm-1">
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#excluifunc">
					<span class="glyphicon glyphicon-trash"></span>
				</button>

				<!-- Modal -->
  				<div class="modal fade" id="excluifunc" role="dialog">
    				<div class="modal-dialog">
      			<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Aviso do Sistema!</h4>
        					</div>
        					<div class="modal-body">
        						<div class="row">
	        						<div class="col-sm-1"></div>
	        						<div class="col-sm-9" style="text-align: center;">
	         							<h3><span class="glyphicon glyphicon-alert"> Excluir Funcionário?</span></h3>
	         						</div>
	         						<div class="col-sm-2"></div>
	         					</div>
	         					<div class="row">
	        						<div class="col-sm-3"></div>
	        						<div class="col-sm-2" style="text-align: center;">
	         							<h3><a href="#"><span class="glyphicon glyphicon-ok"></span></a></span></h3>
	         						</div>
	         						<div class="col-sm-2"></div>
	        						<div class="col-sm-2" style="text-align: center;">
	         							<h3><a href="#"><span class="glyphicon glyphicon-remove"></span></a></span></h3>
	         						</div>
	         					</div>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					</div>
      					</div>
    				</div>
  				</div>
		</div>
			<div class="col-sm-1">
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
					<span class="glyphicon glyphicon-info-sign"></span>
				</button>
				<!-- Modal -->
  				<div class="modal fade" id="myModal" role="dialog">
    				<div class="modal-dialog">
      			<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Detalhes</h4>
        					</div>
        					<div class="modal-body">
         						<div class="row">
									<div class="col-sm-5">
										<img class="foto-perfil" src="imagens/usuario.jpg" alt="" />
									</div>
									<div class="col-sm-5">
										CPF:<h4>104-912-559.26</h4>
									</div>
								</div>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					</div>
      					</div>
    				</div>
  				</div>
			</div>
		</div>
		<br>
		
		<br>
		<div class="row" id="glypicon-cadastra-funcionario">
		    <div class="col-sm-9"></div>
		    <div class="col-sm-2">	
		      	<a href="index.html" class="btn btn-info btn-lg">
		      		<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
		      	</a>
		    </div>	
		    <!--Responsável pro Adiconar um Cliente-->
			<div class="col-sm-1">
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
					<span class=" 	glyphicon glyphicon-plus-sign"></span>
				</button>
				<!-- Modal -->
  				<div class="modal fade" id="myModal" role="dialog">
    				<div class="modal-dialog">
      			<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Detalhes</h4>
        					</div>
        					<div class="modal-body">
         						<div class="row">
									<div class="col-sm-5">
										<img class="foto-perfil" src="imagens/usuario.jpg" alt="" />
									</div>
									<div class="col-sm-5">
										CPF:<h4>104-912-559.26</h4>
									</div>
								</div>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					</div>
      					</div>
    				</div>
  				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<footer id="footer">
		<div id="estilorodape">
	
			<div class="row">
				<div class="col-sm-6" id="controdape"><h5 >Conteudo X </h5>
					<h5><a id="linksrodape" href="#"> Rasckspace</a></h5>
					<h5><a id="linksrodape" href="#"> Rasckspace</a></h5>
				</div>
				<div class="col-sm-6" id="controdape"><h5 >EMPRESA</h5>
					<h5> <a id="linksrodape" href="https://www.liguesite.com.br/sobre-nos/">Sobre</a></h5>
					<h5> <a id="linksrodape" href="https://www.liguesite.com.br/blog/">Blog</a></h5>
				</div>
			</div>
			<div class="rodapef">
				<div class="row">
					<div class="col-sm-2" ></div>
					<div class="col-sm-2" >
						<h4> 2018 © ForeverAlone Inc.</h4>
					</div>
					<div class="col-sm-2" >
						<h5> <a id="linksrodape" href="#">Termos de Compromisso</a></h5>
					</div>
					<div class="col-sm-2" >
						<h5>SAC:sac@forever.com.br</h5>
					</div>
				</div>
				<br>
			</div>
		</div>
	</footer>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html