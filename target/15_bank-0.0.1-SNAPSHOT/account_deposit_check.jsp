<%@page import="com.atm.util.TransactionType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Cajero Ingreso: cheque</title>
  <jsp:directive.include file="head.html" />

</head>

<body>
  <div class="container" style="width: 1070px !important">
    <div class="demo-headline" style="padding: 0px;">
      <h2 class="demo-logo">
        Cajero <small>24 Horas Banking</small>
      </h2>
    </div> <!-- /demo-headline -->
    <div class="row">
      <div class="col-xs-12" id="screenView">
			
        <h1 class="demo-section-title text-uppercase text-center">Ingreso Cheque</h1>
        <h6 class="text-center">N&ordm; de cuenta: ${ sessionScope.account.idAccount }</h6>
        <br />
        <div class="row">
          <!-- 3/4 -->
          <!-- Balance -->
          <div class="col-xs-9">

            <div class="col-xs-6">

              <blockquote>Inserte el cheque en la ranura con la etiqueta "Insertar cheque" cuando la luz se ponga verde. Hacer clic en
                <strong>HECHO</strong> para completar la transacci&oacute;n.</blockquote>

              <div class="tile">
                <h4 class="text-uppercase">
                  <div class="palette-clouds">Saldo</div>${ sessionScope.account.balance }
                </h4>
              </div>

			<form action="doOperation" method="post">
              <div class="tile">
                <h4 class="text-uppercase">
                  <div class="palette-clouds">Check(s) Total</div>
                  <input type="text" id="qcCustomNumberCheck" name="amount" class="form-control" placeholder="20.00"/>
                  <input type="text" name="opType" style="display: none" value="<%=TransactionType.DEPOSIT%>"/>		                    	                    
		          <input type="text" name="page" style="display: none" value="account_deposit_check"/>		
                </h4>
              </div>


              <button id="done" type="submit" class="btn btn-lg btn-success text-uppercase btn-padding"
                style="width:100%; margin-bottom:1rem;"><span class="fui-check"></span> Hecho</button>
			</form>

            </div>

            <div class="col-xs-6" style="border:solid 1px #CCC; border-top:none; border-bottom:none;">
              <img src="${pageContext.request.contextPath}/resources/img/InsertCheckAnimations.gif" style="width:18em;" alt="Insert chech"/>
            </div>

          </div>
          <!-- 1/4 -->
          <div class="col-xs-3">
            <div class="tile">
              <a id="back" href="toSelectTypeDeposit" class="btn btn-lg btn-inverse text-uppercase btn-padding"><span
                  class="fui-arrow-left"></span>Volver</a>
            </div>
            <div class="tile">
              <a id="cancelTransactin" href="toLogin" class="btn btn-lg btn-danger text-uppercase btn-padding"><span
                  class="fui-cross"></span> Cancel</a>
            </div>
          </div>
        </div> <!-- // END OPTIONS-->
		<!-- Number Keys -->
              <!-- TABLE -->
              <div id="pinPad">

                <table class="table table-bordered">
                <caption></caption>
                <tr><th id=""></th></tr>
                  <tr>
                    <td><a id="btn1" onclick="insertCheck(1)" class="btn btn-block btn-lg btn-inverse">1</a></td>
                    <td><a id="btn2" onclick="insertCheck(2)" class="btn btn-block btn-lg btn-inverse">2</a></td>
                    <td><a id="btn3" onclick="insertCheck(3)" class="btn btn-block btn-lg btn-inverse">3</a></td>
                    <td><a id="btn4" onclick="insertCheck(4)" class="btn btn-block btn-lg btn-inverse">4</a></td>
                    <td><a id="btn5" onclick="insertCheck(5)" class="btn btn-block btn-lg btn-inverse">5</a></td>
                    <td colspan="2"><a id="btnDelete" onclick="deleteAmount()" class="btn btn-block btn-lg btn-default text-uppercase">Corregir</a></td>
                  </tr>
                  <tr>
                    <td><a id="btn6" onclick="insertCheck(6)" class="btn btn-block btn-lg btn-inverse">6</a></td>
                    <td><a id="btn7" onclick="insertCheck(7)" class="btn btn-block btn-lg btn-inverse">7</a></td>
                    <td><a id="btn8" onclick="insertCheck(8)" class="btn btn-block btn-lg btn-inverse">8</a></td>
                    <td><a id="btn9" onclick="insertCheck(9)" class="btn btn-block btn-lg btn-inverse">9</a></td>
                    <td><a id="btn0" onclick="insertCheck(0)" class="btn btn-block btn-lg btn-inverse">0</a></td>
                    <td><a id="btn0" onclick="insertCheck(',')" class="btn btn-block btn-lg btn-inverse">.</a></td>
                    
                  </tr>
                </table>
              </div><!-- // Pin Pad -->
	
      </div><!--  // END column-->
      <div class="col-xs-12">
        <h2>
          <blockquote>
            Este sistema de cajero autom&aacute;tico es solo para pruebas de
            software! --- <a href="#">Alf&copy; 2021</a>
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
  <script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/account_deposit.js"></script>

</body>

</html>
