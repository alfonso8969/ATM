<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="f"%> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Cajero Admin: Eliminar Cuenta</title>
    <!-- Font Awesome -->
  <link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
  rel="stylesheet"/>
  <!-- Google Fonts -->
  <link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet" />
  <!-- MDB -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css"
  integrity="sha512-lB7yIzvz6+ap0+tZODJB6YU4SwZbCOI89a2DAnFiapgqtohkiWBoKOeAZzjSHVhmc8CGz2m3BjlzIRofFx2PHg=="
  crossorigin="anonymous" referrerpolicy="no-referrer" />
  <jsp:directive.include file="head.html" />
</head>

<body>
  <div class="container">
    <div class="demo-headline" style="padding:0px;">
      <h1 class="demo-logo">Cajero
        <small>24 Hour Banking</small>
      </h1>
    </div> <!-- /demo-headline -->
    <div class="row">
      <div class="col-xs-12" id="screenView">
        <h1 class="demo-section-title text-uppercase text-center">Administraci&oacute;n: Eliminar Cuenta</h1>
        <h6 class="text-center">Administrador: ${ sessionScope.user.name }</h6>
        <div class="row">

          <!-- 3/4 -->
          <div class="col-xs-9 adm">
            <div class="row">
            
            <div class="col-xs-4">
	            <label class="form-label" id="lblClients" for="clients">Cuentas</label>              
	              <select class="browser-default custom-select mb-5 delete" id="accounts" name="accounts" title="seleccione cuenta" onchange="selectAccount()">
	                <option selected>Seleccione cuenta</option>
	                <c:forEach var="ac" items="${ requestScope.accounts }">
	                	<option value=${ ac.idAccount }>Id Cuenta: ${ ac.idAccount }</option>
	              	</c:forEach>                
	              </select>
              </div>
              <div class="col-xs-4 accountdelete">
				<label class="form-label" id="lblClients" for="clients">Clientes</label>              
              	<select class="browser-default custom-select mb-5 delete" id="clients" name="clients" title="seleccione cliente" onchange="selectClient()">
                	<option selected>Seleccione cliente</option>
               
             	 </select>
              </div>
              <f:form method="post">
              	<input type="number" id="idClient" name="idClient" class="form-control" style="display: none"/>	
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4" style="margin-left: -0.75rem!important;">
                  <div class="col">
	                <div class="mb-4">
	                  <label class="form-label" for="idAccount">Número de cuenta</label>
	                  <input type="number" id="idAccountNew" name="idAccount" class="form-control" style="pointer-events: none" />
	                </div>
                    <div class="">
                      <label class="form-label" for="accountType">Tipo de cuenta</label>
                      <input type="text" id="accountType" name="accountType" class="form-control" style="pointer-events: none"/>
                    </div>
                    <div class="mt-4">
	                  <label class="form-label" for="balance">Saldo</label>
	                  <input type="number" id="balance" name="balance" class="form-control" style="pointer-events: none"/>
	                </div>
                  </div>
				</div>
                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                  <label class="form-check-label" for="checkAcccount">Eliminar cuenta</label>
                </div>

                <!-- Submit button -->
                <button type="button" onclick="validate()" class="btn btn-danger btn-block mb-4">Eliminar</button>
              </f:form>
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
	<c:if test="${ not empty requestScope.error }">
		<script type="text/javascript">
			Swal.fire("Error", "${error}", "error");
		</script>
	</c:if>
	<c:if test="${ not empty requestScope.success }">
		<script type="text/javascript">
			Swal.fire("Completada", "${success}", "success");
		</script>
	</c:if>
  </div> <!-- /container -->

  <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/deleteaccount.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"
  integrity="sha512-7yp3a7J7X9Swx2tmRKfrgud3omN1UKcrx/N/6ijyFtlnjZBTp1dN83Iw2sXbFuwFR0VUec8UW7HrccuvXQUFRA=="
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
</body>

</html>
