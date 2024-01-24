<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cajero Opciones: cuenta</title>
<jsp:directive.include file="head.html" />
</head>
<body>
	<div class="container">
		<div class="container">
			<div class="demo-headline" style="padding: 0px">
				<h1 class="demo-logo">
					Cajero <small>24 Horas Banking</small>
				</h1>
			</div>
			<!-- /demo-headline -->
			<div class="row">
				<div class="col-xs-12" id="screenView">
					<!-- Place <h1></h1> below -->
					<h1 class="demo-section-title text-uppercase text-center">
						Opciones de la cuenta</h1>
					<h6 class="text-center">N&ordm; de cuenta: ${ sessionScope.account.idAccount }
					</h6>

					<br />
					<div class="row">
						<!-- 3/4 -->
						<!-- Balance -->
						<div class="col-xs-9">
							<div class="col-xs-12">
								<div class="tile"
									onclick="location.href='account_movements.jsp'">
									<h4 class="text-uppercase balance">
										<span>Saldo</span><span> <fmt:formatNumber
												type="number" maxFractionDigits="3"
												value="${ sessionScope.account.balance }" />&euro;
										</span>
									</h4>
									<h6 class="text-uppercase">
										<span>Ver movimientos</span>
									</h6>
								</div>
							</div>
							<!-- Options -->
							<div class="col-xs-4">
								<div class="tile" onclick="location.href='account_deposit.jsp'">
									<img
										src="${pageContext.request.contextPath}/resources/img/deposit_vault.png"
										alt="Make a Deposit" class="tile-image big-illustration" />
									<h3 class="tile-title">Ingresar</h3>
									<p>Deposite dinero en efectivo o cheque</p>
								</div>
							</div>

							<div class="col-xs-4">
								<div class="tile"
									onclick="location.href='account_withdrawl.jsp'">
									<img
										src="${pageContext.request.contextPath}/resources/img/quick_cash.png"
										alt="Withdraw Funds" class="tile-image" />
									<h3 class="tile-title">Retirar</h3>
									<p>Retirar fondos de la cuenta.</p>
								</div>
							</div>

							<div class="col-xs-4">
								<div class="tile" onclick="location.href='doGetAccounts'">
									<img
										src="${pageContext.request.contextPath}/resources/img/transfer_money.png"
										alt="Transfer Funds to Another Account" class="tile-image" />
									<h3 class="tile-title">Transferencia</h3>
									<p>Transfiera fondos a otras cuentas.</p>
								</div>
							</div>
							<!-- // END OPTIONS -->
						</div>
						<!-- 1/4 -->
						<div class="col-xs-3">
							<div class="tile">
								<a id="back" href="toPin"
									class="btn btn-lg btn-inverse text-uppercase btn-padding"><span
									class="fui-arrow-left"></span>Volver</a>
							</div>
							<div class="tile">
								<a id="cancelTransactin" href="toLogin"
									class="btn btn-lg btn-danger text-uppercase btn-padding"><span
									class="fui-cross"></span>Cancel</a>
							</div>
						</div>
					</div>
					<!-- // END OPTIONS-->
				</div>
				<!--  // END column-->
			</div>
			<div class="col-xs-12">
				<h2>
					<blockquote>
						Este sistema de cajero autom&aacute;tico es solo para pruebas de
						software! --- <a href="#">Alf&copy; 2021</a>
					</blockquote>
				</h2>
			</div>
		</div>
		<!-- // END row-->
	</div>
	<!-- /container -->

	<script
		src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
</body>
</html>
