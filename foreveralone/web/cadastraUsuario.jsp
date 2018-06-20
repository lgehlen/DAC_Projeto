<%-- 
    Document   : cadastrausuario
    Created on : 10/06/2018, 16:42:47
    Author     : gqueiroz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cadastrp de Usuarios</title>
        
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/custom.js"> </script>


	
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
	  			<div class="col-sm-1" id="logo"> <a href="/foreveralone/login"><img id="logo" src="logo-forever.png" alt="logo" width="120" height="100"></a></div>
		  		<div class="container">
					<div class="row">
		  				<div class="col-sm-2">
		  					<a href="/" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<c:if test="${loginBean != null}">
			  				<div class="col-sm-3">
			  					<a href="#" class="btn btn-primary btn-lg">
			  						<span class="glyphicon glyphicon-pencil"></span> Cadastrar Usuário
			  					</a>
			  				</div>
			  				<div class="col-sm-3">
			  					<a href="atualiza-dados.html" class="btn btn-primary btn-lg">
			  						<span class="glyphicon glyphicon-refresh"></span> Atualizar Dados
			  					</a>
			  				</div>
			  				<div class="col-sm-3">
			  					<a href="gerenciar-perfis.html" class="btn btn-primary btn-lg">
			  						<span class="glyphicon glyphicon-wrench"></span> Gerenciar Perfis
			  					</a>
			  				</div>
			  				<div class="col-sm-1"> 	
		    					<div class="dropdown">
		    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
		    						<span class="caret"></span></button>
		   							<ul class="dropdown-menu">
		   								<li><a> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>
		   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: ${loginBean.tipo} </a></li>
			      						<li><a href="#">Home</a></li>
			      						<li class="divider"></li>
			      						<li><a href="logout"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
		    						</ul>
		  						</div>
	    					</div>
	    				</c:if>	
		  			</div>
		  		</div>
		  	</div>
		</nav>
	</header>

	<!--Corpo da página-->
	<div class="container" id="container-pesquisa-pares">
		<div class="row">
			<div class="col-sm-4"><h4> Cadastro de Cliente</h4></div>
		</div>
                <c:choose>
                    <c:when test="${formType == 1}">
                    <form name="dadoscliente" action="clientes?action=new" method= "post" >
                            <div class="row">
                                    <div class="col-sm-6">
                                            <input class="form-control" name="nome" type="text"  id="input_nome" placeholder="Nome" required>
                                    </div>
                                    <div class="col-sm-6">
                                            <input class="form-control" name="email" type="text"  id="input_email" placeholder="Email" required>
                                    </div>

                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-sm-4">
                                            <input class="form-control" name="cpf" type="text"  id="input_cpf" placeholder="CPF" required>
                                    </div>
                                    <div class="col-sm-3">
                                            <select name="escolaridade" class="form-control" id="ensino" size="1" required> 
                                            <option value="">Escolaridade</option>
                                            <option value="Fundamental Incompleto">Fundamental Incompleto</option>
                                            <option value="Fundamental Cursando">Fundamental Cursando</option>
                                            <option value="Fundamental Completo">Fundamental Completo</option>
                                            <option value="Médio Incompleto">Médio Incompleto</option>
                                            <option value="Médio Cursando">Médio Cursando</option>
                                            <option value="Médio Completo">Médio Completo</option>
                                            <option value="Superior Incompleto">Superior Incompleto</option>
                                            <option value="Superior Cursando">Superior Cursando</option>
                                            <option value="Superior Completo">Superior Completo</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-1 text-right">
                                        <label>Aniversário</label>
                                    </div>
                                    <div class="col-sm-4">
                                       <input class="form-control" name="data" type="date" required>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-sm-2">
                                        <select class="form-control" name="estado" id="estado" name="estado" required>
                                            <c:forEach items="${estados}" var="x">
                                                    <option value="${x.id}">${x.uf}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="cidade" id="cidade" name="cidade" required>

                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="rua" type="text"  id="input_rua" placeholder="Rua" required>
                                    </div>
                            </div>
                                <div class="row">
                                    <br>
                                    <div class="col-sm-3">
                                        <input class="form-control" name="cep" type="text"  id="input_cep" placeholder="CEP" required>
                                    </div>
                                    <div class="col-sm-3">
                                        <input class="form-control" name="numero" type="text"  id="input_numero" placeholder="Numero" required>
                                    </div>
                                    <div class="col-sm-6" >
                                        <input class="form-control" name="senha" type="password"  id="input_senha" placeholder="Senha" required>
                                    </div>
                                </div>
                            <br>
                            <div class="row">

                                    <c:if test="${loginBean.tipo != 'funcionario'}">

                                    <div class="col-sm-2">
                                    <select name="sexo" class="form-control" id="sexo" size="1" required> 
                                            <option value="">Sexo</option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Feminino</option>
                                    </select>
                                    </div>

                                    <div class="col-sm-2">
                                    <select name="cordocabelo" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="">Cor do Cabelo</option>
                                            <option value="Loiro">Loiro</option>
                                            <option value="Ruivo">Ruivo</option>
                                            <option value="Castanho">Castanho</option>
                                            <option value="Preto">Preto</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-2">
                                    <select name="cordapele" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="">Cor da Pele</option>
                                            <option value="Branco">Branco</option>
                                            <option value="Negro">Negro</option>
                                            <option value="Amarelo">Amarelo</option>
                                    </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-sm-12">

                                            <div class="form-group">
                                                    <label for="comment">Breve Descrição:</label>
                                                    <textarea name="descricao" class="form-control" rows="5" id="comment" required></textarea>
                                            </div>

                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12"><strong>Preferências</strong></div>
                                <br>
                                <br>
                                    <div class="col-sm-2">
                                        <select name="pcordocabelo" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="">Cor do Cabelo</option>
                                            <option value="Loiro">Loiro</option>
                                            <option value="Ruivo">Ruivo</option>
                                            <option value="Castanho">Castanho</option>
                                            <option value="Preto">Preto</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-2">
                                    <select name="pcordapele" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="">Cor da Pele</option>
                                            <option value="Branco">Branco</option>
                                            <option value="Negro">Negro</option>
                                            <option value="Amarelo">Amarelo</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-2">
                                    <select name="psexo" class="form-control" id="sexo" size="1" required> 
                                            <option value="">Sexo</option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Feminino</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-2">
                                            <input class="form-control" name="rangemin" type="number"  id="rangemin" placeholder="Idade Mínima" required>
                                    </div>
                                 <div class="col-sm-2">
                                            <input class="form-control" name="rangemax" type="number"  id="rangemax" placeholder="Idade Máxima" required>
                                 </div>
                                <div class="col-sm-12" ><br> <br></div>
                                    </c:if>
                            </div>

                            <div class="row" id="glypicon-cadastra-funcionario">
                                <div class="col-sm-12"><br><br></div>
                                <div class="col-sm-7"><br></div>
                                <c:choose>
                                    <c:when test="${loginBean.tipo != 'funcionario'}">
                                        <div class="col-sm-2">	
                                            <a href="/index.jsp" class="btn btn-info btn-lg">
                                                    <span class="glyphicon glyphicon-remove"></span> Cancelar 
                                            </a>
                                        </div><div class="col-sm-1"></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-sm-2">	
                                            <a href="clientes" class="btn btn-info btn-lg">
                                                    <span class="glyphicon glyphicon-remove"></span> Cancelar 
                                            </a>
                                    </div><div class="col-sm-1"></div>
                                    </c:otherwise>
                                </c:choose>
                                    <div class="col-sm-2">	
                                            <button type="submit" class="btn btn-info btn-lg">
                                                    <span class="glyphicon glyphicon-paperclip"></span> Cadastrar
                                            </button>
                                    </div>
                            </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <form name="dadoscliente" action="clientes?action=update&id=${cliente.id}" method= "post" >
                            <div class="row">
                                    <div class="col-sm-6">
                                            <input class="form-control" name="nome" type="text"  id="input_nome" placeholder="Nome" value="<c:out value="${cliente.nome}" />" required>
                                    </div>
                                    <div class="col-sm-6">
                                            <input class="form-control" name="email" type="text"  id="input_email" placeholder="Email" value="<c:out value="${cliente.email}" />" required>
                                    </div>

                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-sm-4">
                                        <input class="form-control" name="cpf" type="text"  id="input_cpf" placeholder="CPF" value="<c:out value="${cliente.cpf}" />" required>
                                    </div>
                                    <div class="col-sm-3">
                                            <select name="escolaridade" class="form-control" id="ensino" size="1" required> 
                                            <option value="<c:out value="${cliente.escolaridade}" />" > <c:out value="${cliente.escolaridade}" /> </option>
                                            <option value="Fundamental Incompleto">Fundamental Incompleto</option>
                                            <option value="Fundamental Cursando">Fundamental Cursando</option>
                                            <option value="Fundamental Completo">Fundamental Completo</option>
                                            <option value="Médio Incompleto">Médio Incompleto</option>
                                            <option value="Médio Cursando">Médio Cursando</option>
                                            <option value="Médio Completo">Médio Completo</option>
                                            <option value="Superior Incompleto">Superior Incompleto</option>
                                            <option value="Superior Cursando">Superior Cursando</option>
                                            <option value="Superior Completo">Superior Completo</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-1 text-right">
                                        <label>Aniversário</label>
                                    </div>
                                    <div class="col-sm-4">
                                       <input class="form-control" name="data" type="date" required value=<fmt:formatDate value="${cliente.dataNasc}" pattern="yyyy-MM-dd"/> >
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-sm-2">
                                        <select id="estado" name="estado" required>
                                          
                                         <c:forEach items="${estados}" var="x">
                                             <c:if test = "${x.id == cliente.endereço.cidade.estado.id}">
                                                 <option value="${x.id}" selected>${x.uf}</option>
                                                 getCidades();                                                 
                                             </c:if>
                                             <c:if test = "${x.id != cliente.endereço.cidade.estado.id}">
                                                 <option value="${x.id}">${x.uf}</option>
                                             </c:if>
                                        </c:forEach>
                                                 
                                    </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <select id="cidade" name="cidade" required>
                                            <c:forEach items="${cidades}" var="x">
                                             <c:if test = "${x.id == cliente.endereço.cidade.id}">
                                                 <option value="${x.id}" selected>${x.nome}</option>
                                                 getCidades();                                                 
                                             </c:if>
                                             <c:if test = "${x.id != cliente.endereço.cidade.id}">
                                                 <option value="${x.id}">${x.nome}</option>
                                             </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="rua" type="text"  id="input_rua" placeholder="Rua" value="<c:out value="${cliente.endereço.rua}" />" required>
                                    </div>
                            </div>
                                <div class="row">
                                    <br>
                                    <div class="col-sm-3">
                                        <input class="form-control" name="cep" type="text"  id="input_cep" placeholder="CEP" value="<c:out value="${cliente.endereço.cep}" />" required>
                                    </div>
                                    <div class="col-sm-3">
                                        <input class="form-control" name="numero" type="text"  id="input_numero" placeholder="Numero" value="<c:out value="${cliente.endereço.logradouro}" />" required>
                                    </div>
                                    <div class="col-sm-6" >
                                        <input class="form-control" name="senha" type="password"  id="input_senha" placeholder="Senha" value="<c:out value="${cliente.senha}" />" required>
                                    </div>
                                </div>
                            <br>
                            <div class="row">

                                    <c:if test="${loginBean.tipo != 'funcionario'}">

                                    <div class="col-sm-2">
                                    <select name="sexo" class="form-control" id="sexo" size="1" required> 
                                            <option value="<c:out value="${cliente.caracteristicas.sexo}" />"><c:out value="${cliente.caracteristicas.sexo}" /></option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Feminino</option>
                                    </select>
                                    </div>

                                    <div class="col-sm-2">
                                    <select name="cordocabelo" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="<c:out value="${cliente.caracteristicas.corDeCabelo}" />"><c:out value="${cliente.caracteristicas.corDeCabelo}" /></option>
                                            <option value="Loiro">Loiro</option>
                                            <option value="Ruivo">Ruivo</option>
                                            <option value="Castanho">Castanho</option>
                                            <option value="Preto">Preto</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-2">
                                    <select name="cordapele" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="<c:out value="${cliente.caracteristicas.corDePele}" />"><c:out value="${cliente.caracteristicas.corDePele}" /></option>
                                            <option value="Branco">Branco</option>
                                            <option value="Negro">Negro</option>
                                            <option value="Amarelo">Amarelo</option>
                                    </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                    <div class="col-sm-12">

                                            <div class="form-group">
                                                    <label for="comment">Breve Descrição:</label>
                                                    <textarea name="descricao" class="form-control" rows="5" id="comment" value="<c:out value="${cliente.caracteristicas.descricao}" />" required><c:out value="${cliente.caracteristicas.descricao}" /></textarea>
                                            </div>

                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12"><strong>Preferências</strong></div>
                                <br>
                                <br>
                                    <div class="col-sm-2">
                                        <select name="pcordocabelo" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="<c:out value="${cliente.preferencias.corDeCabelo}" />"> <c:out value="${cliente.preferencias.corDeCabelo}" /> </option>
                                            <option value="Loiro">Loiro</option>
                                            <option value="Ruivo">Ruivo</option>
                                            <option value="Castanho">Castanho</option>
                                            <option value="Preto">Preto</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-2">
                                    <select name="pcordapele" class="form-control" id="cor_cabelo" size="1" required> 
                                            <option value="<c:out value="${cliente.preferencias.corDePele}" />"> <c:out value="${cliente.preferencias.corDePele}" /></option>
                                            <option value="Branco">Branco</option>
                                            <option value="Negro">Negro</option>
                                            <option value="Amarelo">Amarelo</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-2">
                                    <select name="psexo" class="form-control" id="sexo" size="1" required> 
                                            <option value="<c:out value="${cliente.preferencias.sexo}" />"><c:out value="${cliente.preferencias.sexo}" /></option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Feminino</option>
                                    </select>
                                    </div>
                                    <div class="col-sm-2">
                                            <input class="form-control" value="${cliente.preferencias.idadeMin}" name="rangemin" type="number"  id="rangemin" placeholder="Idade Mínima" required>
                                    </div>
                                 <div class="col-sm-2">
                                            <input class="form-control" value="${cliente.preferencias.idadeMax}" name="rangemax" type="number"  id="rangemax" placeholder="Idade Máxima" required>
                                 </div>
                                <div class="col-sm-12" ><br> <br></div>
                                    </c:if>
                            </div>

                            <div class="row" id="glypicon-cadastra-funcionario">
                                <div class="col-sm-12"><br><br></div>
                                <div class="col-sm-7"><br></div>
                                
                                        <div class="col-sm-2">	
                                            <a href="/index.jsp" class="btn btn-info btn-lg">
                                                    <span class="glyphicon glyphicon-remove"></span> Cancelar 
                                            </a>
                                        </div><div class="col-sm-1"></div>
                                    
                               
                                    <div class="col-sm-2">	
                                            <button type="submit" class="btn btn-info btn-lg">
                                                    <span class="glyphicon glyphicon-paperclip"></span> Cadastrar
                                            </button>
                                    </div>
                            </div>
                    </form>      
                </c:otherwise>
                </c:choose>
	</div>
	<br>
	<footer class="container-fluid text-center">
            <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
            <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>