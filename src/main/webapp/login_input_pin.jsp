<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="f"%>  
<!DOCTYPE html>
<html lang="en">

<head>
<title>Cajero Login: Inserte Pin</title>
<jsp:directive.include file="head.html" />
<script type="text/javascript">
	var pin = "";
	function printNumber(num) {
		pin += num + "";
		$("#pin").val(pin);
	}

	function deletePin() {
		pin = "";
		$("#pin").val("");
	}
	
	function validate() {
		var pin = $("#pin").val();
		if (pin === "") {
		 	Swal.fire("Error", "No ha introducido número de cuenta o no es válido", "error");	
			 return false;
		} 
		 
		 if (pin.length < 4 && pin != "55555") {
			 Swal.fire("Error", "El pin no es válido, cuatro cifras o más", "error");	
			 return false;
		 }
		 
		 return true;
	}
</script>
</head>

<body>
	<div class="container">
		<div class="demo-headline" style="padding: 0px;">
			<h1 class="demo-logo">
				Cajero <small>24 Horas Banking</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-xs-12" id="screenView">
				<div class="row">
					<div class="col-xs-8 text-center"
						style="border-right: solid 3px #CCC">
						<h1 class="demo-section-title text-uppercase text-center">Ingrese número de cuenta</h1>
						<form action="doLogin" method="post" onsubmit="return validate()">
							<!-- <input id="dni" type="text" style="font-size: 25px;height: 50px" class="form-control" placeholder="inserte dni" /> -->
							<input id="pin" autocomplete="new-password" name="idAccount" type="password" class="form-control mt-2"/>
							<!-- TABLE -->
							<div id="pinPad" class="account">
								<table>
									<caption></caption>
									<tr>
										<th id=""></th>
									</tr>
									<tr>
										<td><a id="btn1" onclick="printNumber(1)"
											class="btn btn-block btn-lg btn-inverse">1</a></td>
										<td><a id="btn2" onclick="printNumber(2)"
											class="btn btn-block btn-lg btn-inverse">2</a></td>
										<td><a id="btn3" onclick="printNumber(3)"
											class="btn btn-block btn-lg btn-inverse">3</a></td>
									</tr>
									<tr>
										<td><a id="btn4" onclick="printNumber(4)"
											class="btn btn-block btn-lg btn-inverse">4</a></td>
										<td><a id="btn5" onclick="printNumber(5)"
											class="btn btn-block btn-lg btn-inverse">5</a></td>
										<td><a id="btn6" onclick="printNumber(6)"
											class="btn btn-block btn-lg btn-inverse">6</a></td>
									</tr>
									<tr>
										<td><a id="btn7" onclick="printNumber(7)"
											class="btn btn-block btn-lg btn-inverse">7</a></td>
										<td><a id="btn8" onclick="printNumber(8)"
											class="btn btn-block btn-lg btn-inverse">8</a></td>
										<td><a id="btn9" onclick="printNumber(9)"
											class="btn btn-block btn-lg btn-inverse">9</a></td>
									</tr>
									<tr>
										<td><a id="btn0" onclick="printNumber(0)"
											class="btn btn-block btn-lg btn-inverse">0</a></td>
										<td colspan="2"><a id="btnClear"
											class="btn btn-block btn-lg btn-default text-uppercase"
											style="color: yellow" onclick="deletePin()">Clear</a></td>

									</tr>
								</table>
							</div>
							<!-- // Pin Pad -->

							<div id="confirmPin">
								<button type="submit" id="init"	class="btn btn-block btn-lg btn-success text-uppercase ms-5">Listo</button>
							</div>
							<div id="cancelTransaction">
								<a href="toLogin"
									class="btn btn-block btn-lg btn-danger text-uppercase">
									 <span class="fui-cross"></span> Cancelar
								</a>
							</div>
						</form>
						<!-- // Pin Pad -->
					</div>


					<div class="col-xs-4">
						<div style="margin-top: 8rem;">
							<img src="${pageContext.request.contextPath}/resources/img/CardInsertedGreenLight.png" style="width: 16em;" alt="" />
						</div>
					</div>
					<!-- /.col-xs-4 -->


				</div>
				<!-- // END login screen  -->
			</div>
			<!--  // END column-->
			<div class="col-xs-12">
				<h2>
					<blockquote>
						Este sistema de cajero automático es solo para pruebas de software! --- <a href="#">Alf&copy; 2021</a>
					</blockquote>
				</h2>
			</div>
		</div>
		<!-- // END row-->
        <c:if test="${ not empty requestScope.error }">
			<script type="text/javascript">
			Swal.fire("Error", "${error}", "error");			    
	   		</script>
		</c:if>



	</div>
	<!-- /container -->



	<script	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>

</body>

</html>