<%-- 
    Document   : manter-pedidos
    Created on : 17/06/2018, 17:17:19
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
	<title>mater_pedidos</title>
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
		  				<a href="#" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-pencil"></span> Orçamentos
		  				</a>
		  			</div>
		  			<div class="col-sm-3" id="correcao-menu">
		  				<a href="deleta_conta.html" class="btn btn-primary btn-lg">
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
	<div class="container" id="container-manter-pedidos">
		<div class="row">
			<div class="col-sm-4"><h4>Pares Compativeis</h4></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th id="colunas-pesquisa" scope="col">Clientes</th>
			      <th id="colunas-pesquisa" scope="col"></th>
			      <th id="colunas-pesquisa" scope="col">Status</th>
			       <th id="colunas-pesquisa" scope="col">Opções</th>

    			</tr>
  			</thead>
		  <tbody>
		    <tr>
		      <th id="colunas-pesquisa" scope="row"><h4>Gabiel e Luiza</h4></th>
		      <td> </td>
		      <td> <div id="status" style=" background-color: red;"></div></td> 	
		      <td>
		      	<!-- Todos os modais lá embaixo -->
		      	<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc1">
					<span class="glyphicon glyphicon-trash"></span>
				</button>
		      	<a href="detalhe-orcamento.html" type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span></a>
	        	</a>
	        	<button  type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-cloud-download"></span>
	        	</button>
		      </td>
		    </tr>
		   <tr>
		      <th id="colunas-pesquisa" scope="row"><h4>Vai Gabriel!</h4></th>
		      <td> </td>
		      <td> <div id="status" style=" background-color: yellow;"></div></td> 	
		      <td>
		      	<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc2">
					<span class="glyphicon glyphicon-trash"></span>
				</button>
		      	<a href="detalhe-orcamento.html" type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span></a>
	        	</a>
	        	<button  type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-cloud-download"></span>
	        	</button>
		      </td>
		     
		    </tr>
		   <tr>
		      <th id="colunas-pesquisa" scope="row"><h4>Ela Liberou!</h4></th>
		      <td> </td>
		      <td> <div id="status" style=" background-color: green;"></div></td> 	
		      <td>
		      	<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc3">
					<span class="glyphicon glyphicon-trash"></span>
				</button>
		      	<a href="detalhe-orcamento.html" type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span></a>
	        	</a>
	        	<button  type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-cloud-download"></span>
	        	</button>
		    </tr>
		  </tbody>
		</table>
		<div class="row" id="glypicon-encontro">
	      	<div class="col-sm-11"></div>
	      	<div class="col-sm-1">	
	      		<a href="encontros.html" class="btn btn-default btn-lg">
	      			<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
	      		</a>
	      	</div>
	    </div>
	    <!-- Modais de Exclusão -->
	    	<!-- Cada Modal possui um ID PrÓPRIO!!! -->
	  				<div class="modal fade" id="excluifunc1" role="dialog">
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
		        						<div class="col-sm-2" id="popup-gerenciausuarios">
		         							<button  type="button" class="btn btn-default btn-sm">
	          									<span class="glyphicon glyphicon-ok"></span>
	        								</button>
		         						</div>
		         						<div class="col-sm-2"></div>
		        						<div class="col-sm-2" id="popup-gerenciausuarios">
		         							<button  type="button" class="btn btn-default btn-sm">
	          									<span class="glyphicon glyphicon-remove"></span>
	        								</button>
		         						</div>
		         					</div>
	        					</div>
	        					<div class="modal-footer">
	          						<button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
	        					</div>
	      					</div>
	    				</div>
	  				</div>
					<div class="modal fade" id="excluifunc2" role="dialog">
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
			        					<div class="col-sm-2" id="popup-gerenciausuarios">
			         						<button  type="button" class="btn btn-default btn-sm">
		          								<span class="glyphicon glyphicon-ok"></span>
		        							</button>
			         					</div>
			         					<div class="col-sm-2"></div>
			        					<div class="col-sm-2" id="popup-gerenciausuarios">
			         						<button  type="button" class="btn btn-default btn-sm">
		          								<span class="glyphicon glyphicon-remove"></span>
		        							</button>
			         					</div>
			         				</div>
		        				</div>
		        					<div class="modal-footer">
		          						<button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
		        					</div>
		      					</div>
		    			</div>
		  			</div>
		  			<div class="modal fade" id="excluifunc3" role="dialog">
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
			        					<div class="col-sm-2" id="popup-gerenciausuarios">
			         						<button  type="button" class="btn btn-default btn-sm">
		          								<span class="glyphicon glyphicon-ok"></span>
		        							</button>
			         					</div>
			         					<div class="col-sm-2"></div>
			        					<div class="col-sm-2" id="popup-gerenciausuarios">
			         						<button  type="button" class="btn btn-default btn-sm">
		          								<span class="glyphicon glyphicon-remove"></span>
		        							</button>
			         					</div>
			         				</div>
		        				</div>
		        					<div class="modal-footer">
		          						<button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
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