<%-- 
    Document   : lugar_acceso
    Created on : 08-24-2016, 04:41:38 PM
    Author     : joseph
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.AlumCtrl"%>
<%@page import="com.sv.udb.controlador.AlumGrupCtrl"%>
<%@page import="com.sv.udb.controlador.GrupCtrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>JSP</title>
    <!-- Core CSS - Include with every page -->
    <link href="plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
    </head>
    <body>
       <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <center><h1>Grupos y Alumnos</h1></center>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="alumnos.jsp"><i class="fa fa-dashboard fa-fw"></i>Alumnos</a>
                        <a href="grupalum.jsp"><i class="fa fa-dashboard fa-fw"></i>Grupo y Alumno</a>
                        <a href="reporte.jsp"><i class="fa fa-dashboard fa-fw"></i>Reporte</a>
                    </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
    
	        <div id="page-wrapper">

            
            <br>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Grupos y Alumnos
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1></h1>
        <h1>${mensAler}</h1>
                                <form role="form" name="alumBton" method="POST" action="GrupAlumServ">
                            <div class="form-group">
                                <label>Alumno</label>
                                <select name="codiAlum" class="form-control">
                                    <jsp:useBean id="alum" class="com.sv.udb.controlador.AlumCtrl" scope="page"/>
                                    <c:forEach items="${alum.consTodo()}" var="fila">
                                        <c:choose>
                                            <c:when test="${fila.codiAlum eq codiAlum}">
                                                <option value="${fila.codiAlum}" selected="">${fila.nombAlum}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${fila.codiAlum}">${fila.nombAlum}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Grupo</label>
                                <select name="codiGrup" class="form-control">
                                    <jsp:useBean id="grupo" class="com.sv.udb.controlador.GrupCtrl" scope="page"/>
                                    <c:forEach items="${grupo.consTodo()}" var="fila">
                                        <c:choose>
                                            <c:when test="${fila.codiGrup eq codiGrup}">
                                                <option value="${fila.codiGrup}" selected="">${fila.nombGrup}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${fila.codiGrup}">${fila.nombGrup}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <input type="submit" name="grupalumBton" value="Guardar" class="btn btn-primary"/>
                        </form>

                          </div>
          </div>
            </div>
       <div class="row">
                <div class="col-lg-12">
                  <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Tabla
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                <form method="POST" name="FrmGrupo" action="GrupAlumServ">
                            <div class="form-group">
                                <label>Grupo</label>
                                <select name="grup" class="form-control">
                                    <jsp:useBean id="grupo1" class="com.sv.udb.controlador.GrupCtrl" scope="page"/>
                                    <c:forEach items="${grupo1.consTodo()}" var="fila">
                                        <c:choose>
                                            <c:when test="${fila.codiGrup eq Grupo}">
                                                <option value="${fila.codiGrup}" selected="">${fila.nombGrup}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${fila.codiGrup}">${fila.nombGrup}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <input type="submit" name="grupalumBton" value="Consultar" class="btn btn-primary"/>
                        </form>              
                <form method="POST" name="Frm2" action="GrupAlumServ">
                    <% Object Codi = request.getAttribute("Grupo");
                    
                    %>
                    <% request.setAttribute( "demoAttr", new AlumGrupCtrl().ConsTodo(Codi)); %>
                <display:table id="Persona" name="demoAttr" class="table table-hover">
                    <display:column property="codiAlum.nombAlum" title="Alumno" sortable="true"/>
                    <display:column property="codiAlum.apelAlum" title="Apellido" sortable="true"/>
                    <display:column property="codiGrup.nombGrup" title="Grupo" sortable="true"/>
                </display:table>
                </form>

                               
        </div>
        <script src="plugins/jquery-1.10.2.js"></script>
    <script src="plugins/bootstrap/bootstrap.min.js"></script>
    <script src="plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="plugins/pace/pace.js"></script>
    <script src="scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="plugins/morris/morris.js"></script>
    <script src="scripts/dashboard-demo.js"></script>
    </body>
</html>
