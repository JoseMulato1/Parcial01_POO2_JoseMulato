<%-- 
    Document   : lugar_acceso
    Created on : 08-24-2016, 04:41:38 PM
    Author     : joseph
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.AlumCtrl"%>
<%@page import="com.sv.udb.modelo.Alumnos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display" %>

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
            <center><h1>Alumnos</h1></center>
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
                            Alumnos
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1>Ingreso</h1>
        <h1>${mensAler}</h1>
        <form action="AlumServ" method="Post">                  
            <div class="form-group">
                    <input type="hidden" name="CodiAlum" value="${CodiAlum}"/>
                    <label for="nomb">Nombre:</label>
                     <input type="text" class="form-control" name="nombAlum" id="nombAlum" value="${nombAlum}">
                     <label for="apel">Apellidos:</label>
                     <input type="text" class="form-control" name="apelAlum" id="apelAlum" value="${apelAlum}">
                     <label for="fech">Fecha:</label>
                     <input type="date" class="form-control" name="fechNaciAlum" id="fechNaciAlum" value="${fechNaciAlum}">
                     <label for="mail">Correo: </label>
                     <input type="email" class="form-control" name="mailAlum" id="mailAlum" value="${mailAlum}">
                     <label for="tele">Telefono: </label>
                     <input type="numeric" class="form-control" name="teleAlum" id="teleAlum" value="${teleAlum}">
                     <label for="dire">Direccion: </label>
                     <input type="text" class="form-control" name="direAlum" id="direAlum" value="${direAlum}">
                     <label for="gene">Genero: </label>
                     <select name="geneAlum"  class="form-control">
                         <option  value="M" class="form-group">M</option>
                         <option  value="F" class="form-group">F</option>
                     </select>
                     
                </div>
                    <input type="submit" class="btn btn-primary" name="AlumBton" value="Guardar" class="btn btn-default" />
                    
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
                <form method="POST" name="Frm" action="AlumServ">
                    <% request.setAttribute( "demoAttr", new AlumCtrl().consTodo()); %>
                <display:table id="Persona" name="demoAttr" class="table table-hover">
                    <display:column property="nombAlum" title="Nombres" sortable="true"/>
                    <display:column property="apelAlum" title="Apellidos" sortable="true"/>
                    <display:column property="fechNaciAlum" title="Fecha" sortable="true"/>
                    <display:column property="mailAlum" title="Correo" sortable="true"/>
                    <display:column property="teleAlum" title="Telefono" sortable="true"/>
                    <display:column property="direAlum" title="Direccion" sortable="true"/>
                    <display:column property="geneAlum" title="Genero" sortable="true"/>
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
