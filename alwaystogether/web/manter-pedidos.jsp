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
	<title>manter_pedidos</title>
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
			<div class="col-sm-4"><h2>Pedidos Abertos</h2></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th id="colunas-pesquisa" scope="col">Clientes</th>
			      <th id="colunas-pesquisa" scope="col">Status</th>
			      <th id="colunas-pesquisa" scope="col">Opções</th>

    			</tr>
  			</thead>
		  <tbody>
                   <c:forEach items="${pedidosAbertos}" var="p">
		    <tr>
                        <th id="colunas-pesquisa" scope="row"><h4>${p.idOrcamento.emailCliente}</h4> e <h4>${p.idOrcamento.emailCliente2}</h4></th>
		      <td><h4>${p.statusOrcamento}</h4></td> 	
		      <td>
		      	<!-- Todos os modais lá embaixo -->
		      	
		      	<button type="button" data-toggle="modal" data-target="#myModal${p.idPedido}" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span>
	        	</button>
                        
                        <div class="modal fade" id="myModal${p.idPedido}" role="dialog">
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
                                                    <h4>Email cliente 1</h4>
                                                    ${p.idOrcamento.emailCliente}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Email cliente 2</h4>
                                                    ${p.idOrcamento.emailCliente2}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Standard</h4>
                                                    ${p.idOrcamento.detalhamentoStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Premium</h4>
                                                    ${p.idOrcamento.detalhamentoPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Valor Standard</h4>
                                                    ${p.idOrcamento.valorStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Valor Premium</h4>
                                                    ${p.idOrcamento.valorPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Email Funcionario</h4>
                                                    ${p.idOrcamento.emailFuncionario}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Status</h4>
                                                    ${p.idOrcamento.status}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
	        	<a href="PedidoServlet?action=formNew&id=${p.idPedido}" type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-plus-sign"></span>
	        	</a>
		      </td>
		    </tr>
                   </c:forEach>
		  </tbody>
		</table>
		
		  			
	</div>
        
        <div class="container" id="container-manter-pedidos">
		<div class="row">
			<div class="col-sm-4"><h2>Pedidos Orçados</h2></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th id="colunas-pesquisa" scope="col">Clientes</th>
			      <th id="colunas-pesquisa" scope="col">Status</th>
			      <th id="colunas-pesquisa" scope="col">Opções</th>

    			</tr>
  			</thead>
		  <tbody>
                   <c:forEach items="${pedidosOrcados}" var="p">
		    <tr>
		      <th id="colunas-pesquisa" scope="row"><h4>${p.idOrcamento.emailCliente}</h4> e <h4>${p.idOrcamento.emailCliente2}</h4></th>
                      <td><h4>${p.statusOrcamento}</h4></td> 	
		      <td>
		      	<!-- Todos os modais lá embaixo -->
		      	
		      	<button type="button" data-toggle="modal" data-target="#myModal${p.idPedido}" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span>
	        	</button>
                        
                        <div class="modal fade" id="myModal${p.idPedido}" role="dialog">
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
                                                    <h4>Email cliente 1</h4>
                                                    ${p.idOrcamento.emailCliente}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Email cliente 2</h4>
                                                    ${p.idOrcamento.emailCliente2}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Standard</h4>
                                                    ${p.idOrcamento.detalhamentoStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Premium</h4>
                                                    ${p.idOrcamento.detalhamentoPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Valor Standard</h4>
                                                    ${p.idOrcamento.valorStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Valor Premium</h4>
                                                    ${p.idOrcamento.valorPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Email Funcionario</h4>
                                                    ${p.idOrcamento.emailFuncionario}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Status</h4>
                                                    ${p.idOrcamento.status}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
		      </td>
		    </tr>
                   </c:forEach>
		  </tbody>
		</table>
		
		  			
	</div>
        
        <div class="container" id="container-manter-pedidos">
		<div class="row">
			<div class="col-sm-4"><h2>Pedidos Rejeitados</h2></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th id="colunas-pesquisa" scope="col">Clientes</th>
			      <th id="colunas-pesquisa" scope="col">Status</th>
			      <th id="colunas-pesquisa" scope="col">Opções</th>

    			</tr>
  			</thead>
		  <tbody>
                   <c:forEach items="${pedidosRejeitados}" var="p">
		    <tr>
		      <th id="colunas-pesquisa" scope="row"><h4>${p.idOrcamento.emailCliente}</h4> e <h4>${p.idOrcamento.emailCliente2}</h4></th>
		      <td><h4>${p.statusOrcamento}</h4></td> 	
		      <td>
		      	<!-- Todos os modais lá embaixo -->
		      	
		      	<button type="button" data-toggle="modal" data-target="#myModal${p.idPedido}" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span>
	        	</button>
                        
                        <div class="modal fade" id="myModal${p.idPedido}" role="dialog">
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
                                                    <h4>Email cliente 1</h4>
                                                    ${p.idOrcamento.emailCliente}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Email cliente 2</h4>
                                                    ${p.idOrcamento.emailCliente2}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Standard</h4>
                                                    ${p.idOrcamento.detalhamentoStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Premium</h4>
                                                    ${p.idOrcamento.detalhamentoPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Valor Standard</h4>
                                                    ${p.idOrcamento.valorStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Valor Premium</h4>
                                                    ${p.idOrcamento.valorPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Email Funcionario</h4>
                                                    ${p.idOrcamento.emailFuncionario}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Status</h4>
                                                    ${p.idOrcamento.status}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
		      </td>
		    </tr>
                   </c:forEach>
		  </tbody>
		</table>
		
		  			
	</div>
        
        <div class="container" id="container-manter-pedidos">
		<div class="row">
			<div class="col-sm-4"><h2>Pedidos Aceitos</h2></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th id="colunas-pesquisa" scope="col">Clientes</th>
			      <th id="colunas-pesquisa" scope="col">Status</th>
			      <th id="colunas-pesquisa" scope="col">Opções</th>

    			</tr>
  			</thead>
		  <tbody>
                   <c:forEach items="${pedidosAceitos}" var="p">
		    <tr>
		      <th id="colunas-pesquisa" scope="row"><h4>${p.idOrcamento.emailCliente}</h4> e <h4>${p.idOrcamento.emailCliente2}</h4></th>
		      <td><h4>${p.statusOrcamento}</h4></td> 	
		      <td>
		      	<!-- Todos os modais lá embaixo -->
		      	
		      	<button type="button" data-toggle="modal" data-target="#myModal${p.idPedido}" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-info-sign"></span>
	        	</button>
                        
                        <div class="modal fade" id="myModal${p.idPedido}" role="dialog">
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
                                                    <h4>Email cliente 1</h4>
                                                    ${p.idOrcamento.emailCliente}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Email cliente 2</h4>
                                                    ${p.idOrcamento.emailCliente2}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Standard</h4>
                                                    ${p.idOrcamento.detalhamentoStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Detalhamento Premium</h4>
                                                    ${p.idOrcamento.detalhamentoPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Valor Standard</h4>
                                                    ${p.idOrcamento.valorStandard}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Valor Premium</h4>
                                                    ${p.idOrcamento.valorPremium}
                                                </div>
                                                <br>
                                                <div class="col-sm-5">
                                                    <h4>Email Funcionario</h4>
                                                    ${p.idOrcamento.emailFuncionario}
                                                </div>
                                                <div class="col-sm-5">
                                                    <h4>Status</h4>
                                                    ${p.idOrcamento.status}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
		      </td>
		    </tr>
                   </c:forEach>
		  </tbody>
		</table>
		
		  			
	</div>
	<br>
	<footer class="container-fluid text-center">
       <p>Em caso de problemas contactar o administrador: 
	</footer>
</body>