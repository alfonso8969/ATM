<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Cajero: Administración</title>
  <jsp:directive.include file="head.html" />	

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
  <!--[if lt IE 9]>
      <script src="dist/js/vendor/html5shiv.js"></script>
      <script src="dist/js/vendor/respond.min.js"></script>
    <![endif]-->
</head>

<body>
  <div class="container">
    <div class="demo-headline" style="padding:0px;">
      <h2 class="demo-logo">
        Cajero <small>24 Horas Banking</small>
      </h2>
    </div> <!-- /demo-headline -->
    <div class="row mt-5">
      <div class="col-xs-12" id="screenView">
        <h1 class="demo-section-title text-uppercase text-center">Administraci&oacute;n</h1>
        <h6 class="text-center">Administrador: ${ sessionScope.user.name }</h6>

        <div class="row">

          <!-- 3/4 -->
          <div class="col-xs-9 adm-main">
            <div class="row">
              <div class="col-xs-4 adm">
               <div class="tile">
                  <a id="newClient" onclick="location.href='account_admin_new_client.jsp'" class="btn btn-lg btn-primary btn-padding" title="Alta cliente">Alta cliente</a>
                </div>
                <div class="tile">
                  <a id="showClients" onclick="location.href='doGetAll?page=account_admin_clients'" class="btn btn-lg btn-primary btn-padding" title="Alta cliente">Ver clientes</a>
                </div>
                <div class="tile">
                  <a id="newAccount" onclick="location.href='doGetAll?page=account_admin_new_account'" class="btn btn-lg btn-primary btn-padding" title="Alta cuenta">Alta cuenta</a>
                </div>
                <div class="tile">
                  <a id="showCounts" onclick="location.href='doGetAllAccounts?page=account_admin_accounts'" class="btn btn-lg btn-primary btn-padding" title="Alta cuenta">Ver cuentas</a>
                </div>
              </div>
              <div class="col-xs-4" adm>
                <div class="tile">
                  <a id="updateClient" onclick="location.href='doGetAll?page=account_admin_edit_client'" class="btn btn-lg btn-primary btn-padding" title="Actualizar cliente">Act. cliente</a>
                </div>
                <div class="tile">
                	<a id="showAccountsClient" onclick="location.href='doGetAll?page=account_admin_client_accounts'" class="btn btn-lg btn-primary btn-padding" title="Actualizar cliente">Ver Cu/Cli</a>
                </div>
                <div class="tile">
                  <a id="updateAccount" onclick="location.href='doGetAllAccounts?page=account_admin_edit_account'" class="btn btn-lg btn-primary btn-padding" title="Actualizar cuenta">Act. Cuenta</a>
                </div>
              </div>
              <div class="col-xs-4 adm">
                <div class="tile">
                  <a id="qcDeCli" href="#" onclick="location.href='doGetAll?page=account_admin_delete_client'" class="btn btn-lg btn-danger btn-padding" title="Baja cliente">Baja cliente</a>
                </div>
                <div class="tile nv">

                </div>
                <div class="tile">
                  <a id="qcDeAcc" onclick="location.href='doGetAllAccounts?page=account_admin_delete_account'"  class="btn btn-lg btn-danger btn-padding" title="Baja cuenta">Baja cuenta</a>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12" adm>
              </div>
            </div>

          </div>
          <!-- 1/4 -->
          <div class="col-xs-3 adm">
            <div class="tile">
              <a id="logout" href="topin" class="btn btn-lg btn-info text-uppercase btn-padding" title="Cerrar sesión administrador"><span
                  class="fui-user"></span> Logout</a>
            </div>
            <div class="tile">
              <a id="cancelTransactin" href="toLogin" class="btn btn-lg btn-danger text-uppercase btn-padding" title="Salir"><span
                  class="fui-cross"></span> Cancel</a>
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
</body>

</html>
