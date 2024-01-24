<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Cajero: Movimientos</title>
    <jsp:directive.include file="head.html" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="dist/js/vendor/html5shiv.js"></script>
      <script src="dist/js/vendor/respond.min.js"></script>
    <![endif]-->
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
          <h1 class="demo-section-title text-uppercase text-center">Movimientos de la cuenta</h1>
          <h6 class="text-center">N&ordm; de cuenta: ${ sessionScope.account.idAccount }</h6>
          <input id="idAccount" value="${ sessionScope.account.idAccount }" style="display: none"/>
          <p id="idExtr" style="display: none">extracci&oacute;n</p>
           <div class="row">
            <!-- 3/4 -->
            <div class="col-xs-9" style="margin-top: -31px">
              <h3 style="font-size: 30px;">Saldo disponible: ${ sessionScope.account.balance }&euro;</h3>
              
              <form class="ms-3 d-inline-block">
	               <div class="form-group ">
		              <div class="form-label-group d-inline-block">
				        <label class="lblDate" for="label-date ms-3">Fecha desde</label>
		 				<input type="text" id="dateInit" class="form-control" autofocus />			
				      </div>
		              <div class="form-label-group d-inline-block" style="margin-left: 270px">
				        <label class="lblDate" for="label-date ms-3">Fecha hasta</label>
		 				<input type="text" id="dateEnd" class="form-control" autofocus />
				      </div>
	               </div>
               </form>
               <div class="text-center mt-1 mb-3">
	               <input type="button" onclick="getMovementsBetweendates();" class="btn btn-block btn-lg btn-primary text-uppercase" value="Buscar" />	               
               </div>
               <table class="table text-light bg-dark">
               <thead>
                   <tr>
                       <th style="width: 180px" id="" class="text-center">Cantidad</th>
                       <th style="width: 280px" id="" class="text-center">Operaci&oacute;n</th>
                       <th style="width: 270px" id="" class="text-center">Fecha</th>
                   </tr>
               </thead>
               </table>
               <div class="tile movements">
	                <table class="table table-bordered table-striped">
	                  <caption></caption>
	                    <tbody id="movs">
	                      
	                  </tbody>
	              </table>
	              <p id="saldo"></p>
             </div>

            </div>
            <!-- 1/4 -->
            <div class="col-xs-3">
              <div class="tile">
               <a id="back" href="toOptions" class="btn btn-lg btn-inverse text-uppercase btn-padding"><span class="fui-arrow-left"></span> Back</a>
              </div>
              <div class="tile">
               <a id="cancelTransactin" href="toLogin" class="btn btn-lg btn-danger text-uppercase btn-padding"><span class="fui-cross"></span> Cancel</a>
              </div>
            </div>

      </div> <!-- // END OPTIONS-->

      </div><!--  // END column-->
      <div class="col-xs-12">
       <jsp:directive.include file="footer.html" />	
      </div>
  </div><!-- // END row-->
</div> <!-- /container -->
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/movements.js"></script>
  </body>
</html>
