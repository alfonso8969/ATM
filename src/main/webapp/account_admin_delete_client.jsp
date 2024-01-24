<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="f"%> 
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <title>Cajero Admin: Eliminar Cliente</title>

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
        <h1 class="demo-section-title text-uppercase text-center">Administraci&oacute;n: Eliminar cliente</h1>
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
              <form id="form" method="post">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4" style="margin-left: -0.75rem!important;">
                  <div class="col">
                    <div class="mx-1">
                      <label  class="form-label" for="name">Nombre</label>
                      <input type="text" id="name" class="form-control" style="pointer-events: none"/>
                    </div>
                  </div>
                  <div class="col">
                    <div class="mx-3">
                      <label  class="form-label" for="lastName">Apellido</label>
                      <input type="text" id="lastName" style="pointer-events: none" class="form-control" />
                    </div>
                  </div>
                </div>

                <!-- Text input -->
                <div class="mb-4">
                  <label  class="form-label" for="company">DNI/NIE</label>
                  <input type="number" id="idClient" name="idClient" class="form-control" style="pointer-events: none"/>              
                </div>          
                <!-- Text input -->
                <div class="mb-4">
                  <label  class="form-label" for="address">Dirección</label>
                  <input type="text" id="address" style="pointer-events: none" class="form-control" />
                </div>

                <!-- Email input -->
                <div class="mb-4">
                  <label  class="form-label" for="email">Email</label>
                  <input id="email" type="email"  style="pointer-events: none" class="form-control" />
                </div>
                <!-- Number input -->
                <div class="mb-4">
                  <label  class="form-label" for="phone">Teléfono</label>
                  <input id="phone" type="number" style="pointer-events: none" class="form-control" />
                </div>

                <!-- Message input -->
                <div class="mb-4">
                  <label class="form-label" for="addInform">Información adicional</label>
                  <textarea id="addInform" class="form-control" style="pointer-events: none" rows="4"></textarea>
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                  <label class="form-check-label" for="checkAcccount">Borrar cuenta cliente</label>
                </div>

                <!-- Submit button -->
                <button type="button" onclick="validate()" class="btn btn-danger btn-block mb-4">Eliminar</button>
              </form>
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
        <jsp:directive.include file="footer.html" />	
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
  <script src="${pageContext.request.contextPath}/resources/js/deleteclient.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"
  integrity="sha512-7yp3a7J7X9Swx2tmRKfrgud3omN1UKcrx/N/6ijyFtlnjZBTp1dN83Iw2sXbFuwFR0VUec8UW7HrccuvXQUFRA=="
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>

</html>
