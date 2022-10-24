<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cajero Login: Inserte Tarjeta</title>
<jsp:directive.include file="head.html" />
</head>

<body>
	<div class="container">
		<div class="demo-headline" style="padding: 0px;">
			<h1 class="demo-logo">
				Cajero <small>24 Horas Banking</small>
			</h1>
		</div>
		<!-- /demo-headline -->
		<div class="row">
			<div class="col-xs-12" id="screenView">
				<div class="row">
					<div class="col-xs-8 text-center">
						<h1 class="demo-section-title text-uppercase text-center">Inserte
							la tarjeta para comenzar</h1>
						<img id="insertCard" src="${pageContext.request.contextPath}/resources/img/InsertCardAnimate.gif"
							alt="insert card" style="display: none" />
						<button id="init"
							class="btn btn-block btn-lg btn-success text-uppercase"
							onclick="init()">Insertar</button>
					</div>
					<!-- // ANIMATED GIF -->


					<div class="col-xs-4">
						<br />
						<div class="advertise">
							<div class="adImage">
								<img src="${pageContext.request.contextPath}/resources/img/icons/svg/chat.svg" alt="Chat">
							</div>
							<div style="display: block" class="addText">Síguenos en
								Twitter</div>
						</div>
						<div class="advertise" id="ad-highlight">
							<div class="adImage">
								<img src="${pageContext.request.contextPath}/resources/img/icons/svg/toilet-paper.svg" alt="Toilet-Paper">
							</div>
							<div style="display: block" class="addText">Regístrese para
								recibir estados de cuenta</div>
						</div>
						<div class="advertise">
							<div class="adImage">
								<img src="${pageContext.request.contextPath}/resources/img/icons/svg/compas.svg" alt="Compras">
							</div>
							<div style="display: block" class="addText">Ahorre en
								viajes</div>
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
						Este sistema de cajero automático es solo para pruebas de
						software! --- <a href="#">Alf&copy; 2021</a>
					</blockquote>
				</h2>
			</div>
		</div>
		<!-- // END row-->
	</div>
	<!-- /container -->



	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
	<script type="text/javascript">
	
		var init = () => {
			$("#init").hide();
			$("#insertCard").show();
			setTimeout(() => {
		    	 newDoc();
			}, 5000);
			
		}
		
		function newDoc() {
			  window.location.assign("login_input_pin.jsp")
			}
    </script>
</body>

</html>