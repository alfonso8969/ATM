<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Cajero: Cuentas Clientes</title>
    <jsp:directive.include file="head.html" />
  </head>
  <body>
    <div class="container">
      <div class="demo-headline" style="padding: 0px;">
        <h2 class="demo-logo">
          Cajero <small>24 Horas Banking</small>
        </h2>
      </div><!-- /demo-headline -->
      <div class="row">
        <div class="col-xs-12" id="screenView">
         <h1 class="demo-section-title text-uppercase text-center">Administraci&oacute;n: Cuentas Clientes</h1>
         <h6 class="text-center">Administrador: ${ sessionScope.user.name }</h6>
       
           <div class="row">
            <!-- 3/4 -->
            <div class="col-xs-9" style="margin-top: 50px">
            <label class="form-label" id="lblClients" for="clients">Clientes</label>              
              <select class="browser-default custom-select mb-5" id="clients" name="clients" title="seleccione cliente" onchange="selectClient()">
                <option selected>Seleccione cliente</option>
                <c:forEach var="c" items="${ requestScope.clients }">
                	<option value="${ c.dni }">Dni: ${ c.dni } - Nombre ${ c.name }</option>
              	</c:forEach>                
              </select>
            
               <table class="table text-light bg-dark">
	               <thead>
	                   <tr>
	                        <th id="" style="width: 20px" class="text-center">ID Cuenta</th>
	                        <th id="" style="width: 50px" class="text-center">Tipo cuenta</th>
	                        <th id="" style="width: 90px" class="text-center">Saldo</th>
	                   </tr>
	               </thead>
               </table>
               <div class="tile movements">
	               	<table class="table table-bordered table-striped">
	               		<caption></caption>
		                   <tbody id="tbody">
		 
		                      
		                  </tbody>
		              </table>
		              <p id="saldo"></p>
             	</div>

            </div>
            <!-- 1/4 -->
            <div class="col-xs-3">
            <div class="tile">
              <a id="back" href="toAdmin" title="Volver" class="btn btn-lg btn-inverse text-uppercase btn-padding"><span
                  class="fui-arrow-left"></span>Volver</a>
            </div>
            <div class="tile">
              <a id="logout" href="topin" class="btn btn-lg btn-info text-uppercase btn-padding" title="Cerrar sesión administrador"><span
                  class="fui-user"></span>Logout</a>
            </div>
            <div class="tile">
              <a id="cancelTransactin" href="toLogin" class="btn btn-lg btn-danger text-uppercase btn-padding" title="Salir"><span
                  class="fui-cross"></span>Cancel</a>
            </div>
          </div>

      </div> <!-- // END OPTIONS-->

      </div><!--  // END column-->
      <div class="col-xs-12">
        <h2>
          <blockquote>
            Este sistema de cajero autom&aacute;tico es solo para pruebas de software! --- <a href="#">Alf&copy; 2021</a>
          </blockquote>
        </h2>
      </div>
  </div><!-- // END row-->
</div> <!-- /container -->
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/viewaccountsclients.js"></script>
  </body>
</html>
