<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="f"%> 
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <title>Cajero Admin: Actualizar Cliente</title>

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
      <h1 class="demo-logo">ATM
        <small>24 Hour Banking</small>
      </h1>
    </div> <!-- /demo-headline -->
    <div class="row">
      <div class="col-xs-12" id="screenView">
        <h1 class="demo-section-title text-uppercase text-center">Administraci&oacute;n: Editar cliente</h1>
        <h6 class="text-center">Administrador: ${ sessionScope.user.name }</h6>
        <div class="row">

          <!-- 3/4 -->
          <div class="col-xs-9 adm">
            <div class="row">
              <label class="form-label" id="lblClients" for="clients">Clientes</label>              
              <select class="browser-default custom-select mb-5" id="clients" name="clients" title="seleccione cliente" onchange="selectClient()">
                <option selected>Seleccione cliente</option>
                <c:forEach var="c" items="${ requestScope.clients }">
                	<option value="${ c.dni }">Dni: ${ c.dni } - Nombre ${ c.name }</option>
              	</c:forEach>                
              </select>
              <f:form action="doUpdateClient" method="post" modelAttribute="client" onsubmit="return validate()">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4" style="margin-left: -0.75rem!important;">
                  <div class="col">
                    <div class="form-outline mx-1">
                      <input type="text" id="name" name="name" class="form-control" />
                      <label class="form-label" for="name">Nombre</label>
                    </div>
                    <label id="nameErr" class="form-label text-danger error" for="name">*campo obligatorio</label>
                  </div>
                  <div class="col">
                    <div class="form-outline mx-3">
                      <input type="text" id="lastName" name="lastName" class="form-control" />
                      <label class="form-label" for="lastName">Apellido</label>
                    </div>
                  </div>
                </div>

                <!-- Text input -->
                <div class="form-outline mb-4">
                  <input type="number" id="dni" name="dni" class="form-control" />              
                  <label class="form-label" for="company">DNI/NIE</label>
                </div>
                <label id="dniErr" class="form-label text-danger error" for="dni">*campo obligatorio</label>
                <label id="dniErrLength" class="form-label text-danger error" for="dni">*si su DNI no tiene ocho dígitos, rellénelo con ceros al principio</label>
                <!-- Text input -->
                <div class="form-outline mb-4">
                  <input type="text" id="address" name="address" class="form-control" />
                  <label class="form-label" for="address">Dirección</label>
                </div>

                <!-- Email input -->
                <div class="form-outline mb-4">
                  <input type="email" id="email" name="email" class="form-control" />
                  <label class="form-label" for="email">Email</label>
                </div>
			        	<label id="emailErr" class="form-label text-danger error" for="email">*campo obligatorio</label>
                <!-- Number input -->
                <div class="form-outline mb-4">
                  <input type="number" id="phone" name="phone" class="form-control" />
                  <label class="form-label" for="phone">Teléfono</label>
                </div>

                <!-- Message input -->
                <div class="form-outline mb-4">
                  <textarea class="form-control" id="addInform" name="info" rows="4"></textarea>
                  <label class="form-label" for="addInform">Información adicional</label>
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                  <label class="form-check-label" for="checkAcccount">Editar cuenta cliente</label>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">Guardar</button>
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
    <script src="${pageContext.request.contextPath}/resources/js/newclient.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/editclient.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"
  integrity="sha512-7yp3a7J7X9Swx2tmRKfrgud3omN1UKcrx/N/6ijyFtlnjZBTp1dN83Iw2sXbFuwFR0VUec8UW7HrccuvXQUFRA=="
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script>
    videojs.options.flash.swf = "dist/js/vendors/video-js.swf"

  </script>
</body>

</html>
