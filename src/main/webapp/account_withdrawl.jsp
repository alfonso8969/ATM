<%@page import="com.atm.util.TransactionType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cajero: Retirar fondos</title>
<jsp:directive.include file="head.html" />
</head>
<body>
	<div class="container">
		<div class="demo-headline" style="padding: 0px;">
			<h2 class="demo-logo">
				Cajero <small>24 Horas Banking</small>
			</h2>
		</div>
		<!-- /demo-headline -->
		<div class="row">
			<div class="col-xs-12" id="screenView">
				<h1 class="demo-section-title text-uppercase text-center">Retirar fondos</h1>
				<h6 class="text-center">N&ordm; de cuenta: ${ sessionScope.account.idAccount } - Saldo: ${ sessionScope.account.balance }&euro;</h6>

				<div class="row">

					<!-- 3/4 -->
					<div class="col-xs-9">
						<div class="row">
							<div class="col-xs-4">
								<div class="tile">
									<a id="qc20" onclick="withDrawl(20, true)"
										class="btn btn-lg btn-primary text-uppercase btn-padding">20.00&euro;</a>
								</div>

								<div class="tile">
									<a id="qc40" onclick="withDrawl(40, true)"
										class="btn btn-lg btn-primary text-uppercase btn-padding">40.00&euro;</a>
								</div>

							</div>
							<div class="col-xs-4">
								<div class="tile">
									<a id="qc60" onclick="withDrawl(60, true)"
										class="btn btn-lg btn-primary text-uppercase btn-padding">60.00&euro;</a>
								</div>

								<div class="tile">
									<a id="qc80" onclick="withDrawl(80, true)"
										class="btn btn-lg btn-primary text-uppercase btn-padding">80.00&euro;</a>
								</div>
							</div>

							<div class="col-xs-4">
								<div class="tile">
									<a id="qc100" onclick="withDrawl(100, true)"
										class="btn btn-lg btn-primary text-uppercase btn-padding">100.00&euro;</a>
								</div>

								<div class="tile">
									<a id="qc200" onclick="withDrawl(200, true)"
										class="btn btn-lg btn-primary text-uppercase btn-padding">200.00&euro;</a>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<form action="doOperation" method="post">
									<h6>Haga clic en un bot&oacute;n para obtener esa cantidad de efectivo.</h6>
									<h6>o ingrese un m&uacute;ltiplo de 20&euro; ó 50&euro;. Debe ser inferior a 600&euro;</h6>
									<input type="text" id="qcWithdrawFounds" name="amount" class="form-control" placeholder="20.00"  />
									<input type="text" name="opType" style="display: none" value="<%=TransactionType.WITHDRAWAL%>" /> 
									<input type="text" name="page" style="display: none" value="account_withdrawl" />
									<!-- Number Keys -->

									<!-- TABLE -->
									<div id="pinPad">
										<table class="table table-bordered">
											<caption></caption>
											<tr><th id=""></th></tr>
											<tr>
												<td><a id="btn1" onclick="withDrawl(1)"
													class="btn btn-block btn-lg btn-inverse">1</a></td>
												<td><a id="btn2" onclick="withDrawl(2)"
													class="btn btn-block btn-lg btn-inverse">2</a></td>
												<td><a id="btn3" onclick="withDrawl(3)"
													class="btn btn-block btn-lg btn-inverse">3</a></td>
												<td><a id="btn4" onclick="withDrawl(4)"
													class="btn btn-block btn-lg btn-inverse">4</a></td>
												<td><a id="btn5" onclick="withDrawl(5)"
													class="btn btn-block btn-lg btn-inverse">5</a></td>
												<td id="tdConfirButton" colspan="2">
													<button id="btnConfirm" type="submit" class="btn btn-block btn-lg btn-primary text-uppercase">Confirmar</button>
												</td>
											</tr>
											<tr>
												<td><a id="btn6" onclick="withDrawl(6)"
													class="btn btn-block btn-lg btn-inverse">6</a></td>
												<td><a id="btn7" onclick="withDrawl(7)"
													class="btn btn-block btn-lg btn-inverse">7</a></td>
												<td><a id="btn8" onclick="withDrawl(8)"
													class="btn btn-block btn-lg btn-inverse">8</a></td>
												<td><a id="btn9" onclick="withDrawl(9)"
													class="btn btn-block btn-lg btn-inverse">9</a></td>
												<td><a id="btn0" onclick="withDrawl(0)"
													class="btn btn-block btn-lg btn-inverse">0</a></td>
												<td colspan="2"><a id="btnDelete"
													onclick="deleteAmount()"
													class="btn btn-block btn-lg btn-default text-uppercase">Corregir</a></td>
											</tr>
										</table>
									</div>
									<!-- // Pin Pad -->
								</form>
							</div>
						</div>

					</div>
					<!-- 1/4 -->
					<div class="col-xs-3">
						<div class="tile">
							<a id="back" href="toOptions"
								class="btn btn-lg btn-inverse text-uppercase btn-padding"><span
								class="fui-arrow-left"></span>Volver</a>
						</div>
						<div class="tile">
							<a id="cancelTransactin" href="toLogin"
								class="btn btn-lg btn-danger text-uppercase btn-padding"><span
								class="fui-cross"></span> Cancel</a>
						</div>
					</div>

				</div>
				<!-- // END OPTIONS-->
			</div>
			<!--  // END column-->
			<div class="col-xs-12">
				<jsp:directive.include file="head.html" />	
			</div>
		</div>
		<!-- // END row-->
		<c:if test="${ not empty requestScope.error }">
			<script type="text/javascript">
			Swal.fire("Error", "${error}", "error");
			</script>
		</c:if>
		<c:if test="${ not empty requestScope.success }">
			<script type="text/javascript">
			Swal.fire({
				  title: 'Completada!',
				  text: "${success}",
				  imageUrl: "${pageContext.request.contextPath}/resources/img/sacardinero.gif",
				  imageWidth: 400,
				  imageHeight: 200,
				  imageAlt: 'Sacar dinero',
				});
			</script>
		</c:if>
	</div>
	<!-- /container -->

	<script	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/withdrawl.js"></script>
</body>
</html>
