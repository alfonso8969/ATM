<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Cajero: Cuentas</title>
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
         <h1 class="demo-section-title text-uppercase text-center">Administraci&oacute;n: Cuentas</h1>
         <h6 class="text-center">Administrador: ${ sessionScope.user.name }</h6>
       
           <div class="row">
            <!-- 3/4 -->
            <div class="col-xs-9" style="margin-top: 50px">
            
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
	                    <tbody id="clients">
	                      <c:forEach var="acc" items="${ requestScope.accounts }">
	                      <tr>
		                       <td id="" class="text-center">${ acc.idAccount }</td>
		                       <td id="" class="text-center">${ acc.accountType }</td>
		                       <td id="" class="text-center">${ acc.balance
		                       
		                        }</td>
		                   </tr>
	                      </c:forEach>
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
        <jsp:directive.include file="head.html" />	
      </div>
  </div><!-- // END row-->
</div> <!-- /container -->
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/viewclients.js"></script>
  </body>
</html>
