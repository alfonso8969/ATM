<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Cajero opciones: Ingreso</title>
  	<jsp:directive.include file="head.html" />

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
      </div> <!-- /demo-headline -->
      <div class="row">
        <div class="col-xs-12" id="screenView">
          <!-- Place <h1></h1> below -->
          <h1 class="demo-section-title text-uppercase text-center">Ingresar Dinero</h1>
          <h6 class="text-center">N&ordm; de cuenta: ${ sessionScope.account.idAccount }</h6>
          <br />
           <div class="row">

            <!-- 3/4 -->
            <!-- Balance -->
            <div class="col-xs-9">
                <div class="col-xs-12">
                  <div class="tile">
                   <h4 class="text-uppercase balance"><span>Saldo</span>${ sessionScope.account.balance }&euro;</h4>
                  </div>
                </div>
            <!-- Options -->
                <div class="col-xs-4">
                  <div class="tile" onclick="location.href='account_deposit_cash.jsp'">
                    <img src="${pageContext.request.contextPath}/resources/img/quick_cash.png" alt="Deposit Cash" class="tile-image big-illustration">
                    <h3 class="tile-title">Efectivo</h3>
                    <p>Utilice esta opción para depositar dinero en efectivo.</p>
                  </div>
                </div>

                <div class="col-xs-4">
                  <div class="tile" onclick="location.href='account_deposit_check.jsp'">
                    <img src="${pageContext.request.contextPath}/resources/img/deposit_check.png" alt="Deposit Checks" class="tile-image">
                    <h3 class="tile-title">Cheques</h3>
                    <p>Utilice esta opción para depositar un cheque firmado.</p>
                  </div>
                </div>

                <div class="col-xs-4">
                  <blockquote>Los depósitos de cheques pueden tardar hasta 24 horas en confirmarse.</blockquote>
                </div><!-- // END OPTIONS -->
            </div>
            <!-- 1/4 -->
            <div class="col-xs-3">
              <div class="tile">
               <a id="back" href="toOptions" class="btn btn-lg btn-inverse text-uppercase btn-padding"><span class="fui-arrow-left"></span>Volver</a>
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
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/application.js"></script>
  </body>
</html>
