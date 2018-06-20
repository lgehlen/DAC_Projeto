<%-- 
    Document   : encontros
    Created on : 10/06/2018, 16:48:43
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
        <title>Encontros</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
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
                    <div class="col-sm-1"><img id="logo" src="logo-forever.png" alt="logo"></div>
                    <div class="container">

                        <div class="row">
                            <div class="col-sm-2">
                                <a href="clientes" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-home"></span> Home
                                </a>
                            </div>
                            <div class="col-sm-2">
                                <a href="clientes?action=pares" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-user"></span> Pares
                                </a>
                            </div>
                            <div class="col-sm-2">
                                <a href="CasamentoServlet" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-gift"></span> Casamento
                                </a>
                            </div>
                            <div class="col-sm-2" >
                                <a href="clientes?action=formUpdate&id=${loginBean.id}" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-filter"></span> Preferências
                                </a>
                            </div>
                            <div class="col-sm-1"> 
                                <div class="dropdown">
                                    <button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="clientes?action=formUpdate&id=${loginBean.id}"> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>
                                        <li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: ${loginBean.tipo}   </a></li>
                                        <li><a href="#">Home</a></li>
                                        <li class="divider"></li>
                                        <li><a href="logout"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <!--Corpo da página-->
        <div class="container" id="container-encontros">
            <div class="row">
                <div class="col-sm-4"><h4> Encontros Pendentes</h4></div>
            </div>
            <br>
            <c:forEach items="${encontros}" var="x" varStatus="i">
                <c:if test="${x.idCliente1.nome == loginBean.nome}">
                    <c:set var="nome" value="${x.idCliente2.nome}"/>
                </c:if> 
                <c:if test="${x.idCliente2.nome == loginBean.nome}">
                    <c:set var="nome" value="${x.idCliente1.nome}"/>
                </c:if>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-parent="#accordion" data-toggle="collapse" href="#collapse<c:out value="${x.id}"/>">Encontro com&nbsp;<c:out value="${nome}"/></a>
                            </h4>
                        </div>
                        <div id="collapse<c:out value="${x.id}"/>" class="panel-collapse collapse out">
                            <div class="panel-body">
                                <div class="col-sm-6" >Nome:<p><c:out value="${nome}"/></p> </div>
                                <div class="col-sm-6" ><p>&nbsp;<br><br></p></div> 
                                <div class="col-sm-6" >Data:<p><fmt:formatDate value="${x.data}" pattern="dd/MM/yy"/></p></div>  
                                <div class="col-sm-6" >Local:<p><c:out value="${x.local.rua}"/></p></p></div>
                                <div class="col-sm-12">&nbsp;</div>
                                <div class="col-sm-6"></div>
                                <div class="col-sm-2"></div>

                                <div class="col-sm-2">
                                    <a class="btn btn-success" href="clientes?action=aceitaEncontro&id=<c:out value="${x.id}"/>">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        Aceitar 
                                    </a>
                                </div>
                                <div class="col-sm-2">
                                    <c:if test="${x.idCliente1.nome == loginBean.nome}">
                                        <c:set var="bloqueado" value="${x.idCliente2.id}"/>
                                    </c:if> 
                                    <c:if test="${x.idCliente2.nome == loginBean.nome}">
                                        <c:set var="bloqueado" value="${x.idCliente1.id}"/>
                                    </c:if>
                                    <a class="btn btn-danger" href="clientes?action=listaNegra&cliente=<c:out value="${bloqueado}"/>&bloqueado=<c:out value="${loginBean.id}"/>&id=<c:out value="${x.id}"/>">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        Recusar 
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty encontros}">
                <h5>Você não possui encontros pendentes</h5>
            </c:if>
        </div>
        
        <div class="container" id="container-encontros">
            <div class="row">
                <div class="col-sm-4"><h4> Encontros Marcados </h4></div>
            </div>
            <br>
            <c:forEach items="${encontrosMarcados}" var="x" varStatus="i">
                <c:if test="${x.idCliente1.nome == loginBean.nome}">
                    <c:set var="nome" value="${x.idCliente2.nome}"/>
                </c:if> 
                <c:if test="${x.idCliente2.nome == loginBean.nome}">
                    <c:set var="nome" value="${x.idCliente1.nome}"/>
                </c:if>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-parent="#accordion" data-toggle="collapse" href="#collapse<c:out value="${x.id}"/>">Encontro com&nbsp;<c:out value="${nome}"/></a>
                            </h4>
                        </div>
                        <div id="collapse<c:out value="${x.id}"/>" class="panel-collapse collapse out">
                            <div class="panel-body">
                                <div class="col-sm-6" >Nome:<p><c:out value="${nome}"/></p> </div>
                                <div class="col-sm-6" ><p>&nbsp;<br><br></p></div> 
                                <div class="col-sm-6" >Data:<p><fmt:formatDate value="${x.data}" pattern="dd/MM/yy"/></p></div>  
                                <div class="col-sm-6" >Local:<p><c:out value="${x.local.rua}"/></p></p></div>
                                <div class="col-sm-12">&nbsp;</div>
                                <div class="col-sm-6"></div>
                                <div class="col-sm-2"></div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty encontrosMarcados}">
                <h5>Você não possui encontros marcados</h5>
            </c:if>
        </div>
        
        <div class="container" id="container-encontros">
            <div class="row">
                <div class="col-sm-4"><h4> Festas </h4></div>
            </div>
            <br>
            <c:forEach items="${eventos}" var="x" varStatus="i">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-parent="#accordion" data-toggle="collapse" href="#collapse<c:out value="${x.id}"/>">Encontro com&nbsp;<c:out value="${nome}"/></a>
                            </h4>
                        </div>
                        <div id="collapse<c:out value="${x.id}"/>" class="panel-collapse collapse out">
                            <div class="panel-body">
                                <div class="col-sm-6" >Nome:<p><c:out value="${x.tema}"/></p> </div>
                                <div class="col-sm-6" ><p>&nbsp;<br><br></p></div> 
                                <div class="col-sm-6" >Data:<p><fmt:formatDate value="${x.data}" pattern="dd/MM/yy"/></p></div>  
                                <div class="col-sm-6" >Local:<p><c:out value="${x.local.rua}"/></p></p></div>
                                <div class="col-sm-12">&nbsp;</div>
                                <div class="col-sm-6"></div>
                                <div class="col-sm-2"></div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty eventos}">
                <h5>Você não possui convite de festas</h5>
            </c:if>
        </div>

        <br>
        <footer class="container-fluid text-center">
            <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
            <p>Em caso de problemas contactar o administrador: 
                <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
        </footer>
    </body>
</html>