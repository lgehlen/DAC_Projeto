<%-- 
    Document   : gestaoFuncionarios
    Created on : 10/06/2018, 16:51:33
    Author     : gqueiroz
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>gestão_de_funcionarios</title>
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
	  		<div id="cabe">
	  			<!--LOGO -->
	  			<div class="col-sm-1"> <a href="/"><img id="logo" src="logo-forever.png" alt="logo"></a></div>
		  		<div class="container">
					<div class="row">
		  				<div class="col-sm-1">
		  					<a href="index.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-3">
		  					<a href="gestao_relatoriosA" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-open"></span> Gerenciar Relatórios
		  					</a>
		  				</div>
		  				<div class="col-sm-3">
		  					<a href="gestao_clientesA" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-user"></span> Gerenciar Clientes
		  					</a>
		  				</div>
		  				<div class="col-sm-3">
		  					<a href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-link"></span> Gerenciar Funcionários
		  					</a>
		  				</div>
		  				<div class="col-sm-1"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   User   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo:Administrador </a></li>
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
	<!--Lista de Clientes-->
	<div class="container" id="container-pesquisa-pares">
		<div class="row">
			<div class="col-sm-4"><h4> Quadro de Funcionários</h4></div>
		</div>
		<br>
		<div class="row" id="relatorios">
			<div class="col-sm-1"><h4>24</h4></div>
			<div class="col-sm-9"><h4> Gabriel Vieira</h4></div>
			<!--Modal-->
			<div class="col-sm-1">
				<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc">
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
	        						<div class="col-sm-2" id="popup-gerenciafuncionarios">
	         							<button  type="button" class="btn btn-default btn-sm">
	          								<span class="glyphicon glyphicon-ok"></span>
	        							</button>
	         						</div>
	         						<div class="col-sm-2"></div>
	        						<div class="col-sm-2" id="popup-gerenciafuncionarios" >
	         							<button  type="button" class="btn btn-default btn-sm">
	          								<span class="glyphicon glyphicon-remove"></span>
	        							</button>
	         						</div>
	         					</div>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        					</div>
      					</div>
    				</div>
  				</div>
		</div>
			<div class="col-sm-1">
				<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#editafunc">
					<span class="glyphicon glyphicon-pencil"></span>
				</button>

				<!-- Modal -->
  				<div class="modal fade" id="editafunc" role="dialog">
    				<div class="modal-dialog">
      			<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Editar Dados</h4>
        					</div>
        					<div class="modal-body">
         						<form name="editadados" action="edita_dados" onsubmit="" method= "post" >
         							<div class="row">
										<div class="col-sm-6">
											<input name="Nome" id=" " type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="col-sm-6">
											<input name="CPF" id=" " type="text" class="form-control" placeholder="CPF">
										</div>
									</div> 
									<br>
         							<div class="row">
										<div class='col-sm-7'>
           									<h5>Data:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
          								</div>
									</div> 
									<br>
									<div class="row">
										<div class="col-sm-8">
											<input name="E-mail" id=" " type="text" class="form-control" placeholder="Email">
										</div>
									</div>
									<br>
									<div class="row" id="glypicon-gestaofunc">
							      		<div class="col-sm-10"></div>
							      		<div class="col-sm-2">	
							      			<button  type="button" class="btn btn-default btn-lg">
	          									<span class="glyphicon glyphicon-refresh"></span> Atualizar
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
		</div>
		<br>
		<div class="row" id="relatorios">
			<div class="col-sm-1"><h4>24</h4></div>
			<div class="col-sm-9"><h4> Gabriel Vieira</h4></div>
			<!--Modal-->
			<div class="col-sm-1">
				<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc">
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
	        						<div class="col-sm-2" id="popup-gerenciafuncionarios">
	         							<button  type="button" class="btn btn-default btn-sm">
	          								<span class="glyphicon glyphicon-ok"></span>
	        							</button>
	         						</div>
	         						<div class="col-sm-2"></div>
	        						<div class="col-sm-2" id="popup-gerenciafuncionarios">
	         							<button  type="button" class="btn btn-default btn-sm">
	          								<span class="glyphicon glyphicon-ok"></span>
	        							</button>
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
				<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#editafunc">
					<span class="glyphicon glyphicon-pencil"></span>
				</button>

				<!-- Modal -->
  				<div class="modal fade" id="editafunc" role="dialog">
    				<div class="modal-dialog">
      			<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Editar Dados</h4>
        					</div>
        					<div class="modal-body">
         						<form name="editadados" action="edita_dados" onsubmit="" method= "post" >
         							<div class="row">
										<div class="col-sm-6">
											<input name="Nome" id=" " type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="col-sm-6">
											<input name="CPF" id=" " type="text" class="form-control" placeholder="CPF">
										</div>
									</div> 
									<br>
         							<div class="row">
										<div class='col-sm-7'>
           									<h5>Data:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
          								</div>
									</div> 
									<br>
									<div class="row">
										<div class="col-sm-8">
											<input name="E-mail" id=" " type="text" class="form-control" placeholder="Email">
										</div>
									</div>
									<br>
									<div class="row" id="glypicon-gestaofunc">
							      		<div class="col-sm-10"></div>
							      		<div class="col-sm-2">	
							      			<button  type="button" class="btn btn-default btn-lg">
	          									<span class="glyphicon glyphicon-refresh"></span> Atualizar
	        								</button>
							      		</div>
	      							</div>
         						</form>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        					</div>
      					</div>
    				</div>
  				</div>
			</div>
		</div>
		<br>
		<div class="row" id="relatorios">
			<div class="col-sm-1"><h4>24</h4></div>
			<div class="col-sm-9"><h4> Gabriel Vieira</h4></div>
			<!--Modal-->
			<div class="col-sm-1">
				<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc">
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
	        						<button  type="button" class="btn btn-default btn-lg">
	          							<span class="glyphicon glyphicon-refresh"></span> Atualizar
	        						</button>
	         						<div class="col-sm-2"></div>
	         						<button  type="button" class="btn btn-default btn-lg">
	          							<span class="glyphicon glyphicon-remove"></span> Atualizar
	        						</button>
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
				<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#editafunc">
					<span class="glyphicon glyphicon-pencil"></span>
				</button>

				<!-- Modal -->
  				<div class="modal fade" id="editafunc" role="dialog">
    				<div class="modal-dialog">
      			<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Editar Dados</h4>
        					</div>
        					<div class="modal-body">
         						<form name="editadados" action="edita_dados" onsubmit="" method= "post" >
         							<div class="row">
										<div class="col-sm-6">
											<input name="Nome" id=" " type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="col-sm-6">
											<input name="CPF" id=" " type="text" class="form-control" placeholder="CPF">
										</div>
									</div> 
									<br>
         							<div class="row">
										<div class='col-sm-7'>
           									<h5>Data:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
          								</div>
									</div> 
									<br>
									<div class="row">
										<div class="col-sm-8">
											<input name="E-mail" id=" " type="text" class="form-control" placeholder="Email">
										</div>
									</div>
									<br>
									<div class="row" id="glypicon-gestaofunc">
							      		<div class="col-sm-10"></div>
							      		<div class="col-sm-2">	
							      			<button  type="button" class="btn btn-default btn-lg">
							      				<span class="glyphicon glyphicon-refresh"></span> Atualizar
							      			</button>
							      		</div>
	      							</div>
         						</form>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        					</div>
      					</div>
    				</div>
  				</div>
			</div>
		</div>
		<br>
		<div class="row" id="glypicon-gestaofuncionario">
		    <div class="col-sm-9"></div>
		    <div class="col-sm-2">	
		      	<a href="index.html" class="btn btn-default btn-lg">
		      		<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
		      	</a>
		    </div>	
		      	<div class="col-sm-1">
					<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#cadastrafunc">
						<span class="glyphicon glyphicon-plus-sign"></span>
					</button>
					<!-- Modal -->
	  				<div class="modal fade" id="cadastrafunc" role="dialog">
	    				<div class="modal-dialog">
      			<!-- Modal content-->
	      					      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">&times;</button>
          						<h4 class="modal-title">Cadastro de Funcionário</h4>
        					</div>
        					<div class="modal-body">
         						<form name="editadados" action="edita_dados" onsubmit="" method= "post" >
         							<div class="row">
										<div class="col-sm-6">
											<input name="Nome" id=" " type="text" class="form-control" placeholder="Nome">
										</div>
										<div class="col-sm-6">
											<input name="CPF" id=" " type="text" class="form-control" placeholder="CPF">
										</div>
									</div> 
									<br>
         							<div class="row">
										<div class='col-sm-7'>
           									<h5>Data:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
          								</div>
									</div> 
									<br>
									<div class="row">
										<div class="col-sm-8">
											<input name="E-mail" id=" " type="text" class="form-control" placeholder="Email">
										</div>
									</div>
									<br>
									<div class="row" id="glypicon-gestaofunc">
							      		<div class="col-sm-10"></div>
							      		<div class="col-sm-2">	
							      			<button  type="button" class="btn btn-default btn-lg">
							      				<span class="glyphicon glyphicon-plus-sign"></span> Cadastrar
							      			</button>
							      		</div>
	      							</div>
         						</form>
        					</div>
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        					</div>
      					</div>
    					</div>
  					</div>
				</div>
		    </div>
		</div>
	<br>
	<footer class="container-fluid text-center">
        <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
        <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>
</body>
</html>