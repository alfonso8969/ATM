<%@page import="com.atm.util.TransactionType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cajero: Transferencia</title>
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
				<h1 class="demo-section-title text-uppercase text-center">Transferir Fondos</h1>
				<h3 class="text-center" style="font-size: 25px;">Saldo disponible: ${ sessionScope.account.balance }&euro;</h3>
				<div class="row">

					<!-- 3/4 -->
					<!-- Balance -->
					<div class="col-xs-9">
					<form action="doMakeTransfer" method="post" onsubmit="return validateSubmit()">
						<div class="col-xs-12">
							<h6>Transfiere fondos de una cuenta a otra.
								Puede escribir un n&uacute;mero de otra cuenta que no
								est&aacute; en sus cuentas disponibles.</h6>
						</div>
						<!-- Options -->
						<div class="col-xs-6">
							<div class="tile">
								<h5>Desde:</h5>
								<button type="button" data-toggle="modal" data-target="#fromAccount" class="btn btn-block btn-lg btn-inverse">
									<h6>
										<input type="text" name="idAccountFrom" id="idAccountFrom" value="****" />
										<input type="text" name="opTypeFrom" style="display: none" value="<%=TransactionType.WITHDRAWAL_TRANSACTION%>" /> 
									</h6>
								</button>
							</div>
						</div>

						<div class="col-xs-6">
							<div class="tile">
								<h5>A:</h5>
								<button type="button" data-toggle="modal"
									data-target="#toAccount"
									class="btn btn-block btn-lg btn-inverse">
									<h6>
										<input type="text" name="idAccountTo" id="idAccountTo" value="****" />
										<input type="text" name="opTypeTo" style="display: none" value="<%=TransactionType.DEPOSIT_TRANSACTION%>" /> 
									</h6>
								</button>
							</div>
						</div>
						<!-- // END OPTIONS -->
						<div class="col-xs-12 text-center">
							<blockquote>
								<h6>Haga clic en un n&uacute;mero de cuenta para cambiar.</h6>
							</blockquote>
						</div>
						<div>
					</div>


						<div class="palette-clouds text-uppercase text-center w-100">Dinero a transferir</div>
							<input type="text" id="qcTransferFounds" name="amount" class="form-control" placeholder="20.00" /> 
							<input type="text" name="page" style="display: none" value="account_transfer_funds" />



						<!-- TABLE -->
						<div id="pinPad" class="transfer">
							<table class="table table-bordered">
								<caption></caption>

								<tr>
									<td><a id="btn1" onclick="transferFunds(1)"
										class="btn btn-block btn-lg btn-inverse">1</a></td>
									<td><a id="btn2" onclick="transferFunds(2)"
										class="btn btn-block btn-lg btn-inverse">2</a></td>
									<td><a id="btn3" onclick="transferFunds(3)"
										class="btn btn-block btn-lg btn-inverse">3</a></td>
									<td><a id="btn4" onclick="transferFunds(4)"
										class="btn btn-block btn-lg btn-inverse">4</a></td>
									<td><a id="btn5" onclick="transferFunds(5)"
										class="btn btn-block btn-lg btn-inverse">5</a></td>
									<td><a id="btnSpace" 
										class="btn btn-block btn-lg btn-inverse">*</a></td>
									<td id="tdConfirButton" colspan="2">
										<button id="btnConfirm" type="submit" class="btn btn-block btn-lg btn-primary text-uppercase">Confirmar</button>
									</td>
								</tr>
								<tr>
									<td><a id="btn6" onclick="transferFunds(6)"
										class="btn btn-block btn-lg btn-inverse">6</a></td>
									<td><a id="btn7" onclick="transferFunds(7)"
										class="btn btn-block btn-lg btn-inverse">7</a></td>
									<td><a id="btn8" onclick="transferFunds(8)"
										class="btn btn-block btn-lg btn-inverse">8</a></td>
									<td><a id="btn9" onclick="transferFunds(9)"
										class="btn btn-block btn-lg btn-inverse">9</a></td>
									<td><a id="btn0" onclick="transferFunds(0)"
										class="btn btn-block btn-lg btn-inverse">0</a></td>
									<td><a id="btnDot" onclick="transferFunds(',')"
										class="btn btn-block btn-lg btn-inverse">.</a></td>
									<td colspan="2"><a id="btnDelete" onclick="deleteAmount()"
										class="btn btn-block btn-lg btn-default text-uppercase">Corregir</a></td>
								</tr>
							</table>
						</div>
						</form>
						<!-- // Pin Pad -->
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
								class="fui-cross"></span>Cancel</a>
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
				Swal.fire("Completada", "${success}", "success");			    
	   		</script>
		</c:if>
	</div>
	<!-- /container -->

	<script	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/transferFunds.js"></script>

	<!-- Modal fromAccount -->
	<div class="modal fade" id="fromAccount" tabindex="-1" role="dialog"
		aria-labelledby="fromAccount" onload="location.href='doGetThisAccount'">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="fromAccount">Cuentas disponibles</h4>
				</div>  
				<div class="modal-body">
					<!-- Available Accounts -->

					<p>Seleccione una cuenta disponible a continuación.</p>
	
					<button onclick="selectAccountFrom('${ requestScope.account.idAccount }')" data-dismiss="modal" class="btn btn-block btn-lg btn-inverse text-uppercase modalList">
						<p>
							<span >${ requestScope.account.accountType }:</span>${ requestScope.account.idAccount }
						</p>
					</button> 
					


					<!-- // END Available Accounts -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal toAccount -->
	<div class="modal fade" id="toAccount" tabindex="-1" role="dialog"
		aria-labelledby="toAccount">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="toAccount">Cuentas disponibles</h4>
				</div>
				<div class="modal-body">
					<!-- Available Accounts -->
					<label for="toAccountCustom">Introduzca n&uacute;mero de
						cuenta</label> 
						<input type="number" id="toAccountInput"	class="form-control" />
					<button type="button" class="btn btn-primary text-uppercase routingButton">Seleccionar</button>
					<p>o seleccione de una cuenta disponible a continuaci&oacute;n.</p>
					<span>Cuenta actual: ${ sessionScope.account.idAccount }</span>
					<c:forEach var="ac" items="${ requestScope.accounts }"> 
					<c:if test="${ sessionScope.account.idAccount != ac.idAccount }">
						<button onclick="selectAccountTo('${ ac.idAccount  }')" data-dismiss="modal" class="btn btn-block btn-lg btn-inverse text-uppercase modalList">
							<p>
								<span>${ ac.accountType } </span> ${ ac.idAccount }
							</p>
						</button> 
						</c:if>
					</c:forEach>

					<!-- // END Available Accounts -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
