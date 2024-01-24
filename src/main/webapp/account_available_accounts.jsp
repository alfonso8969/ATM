<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Cajero: Cuentas disponibles: Available Accounts</title>

  <jsp:directive.include file="head.html" />
  </head>
  <body>
    <div class="container">
      <div class="demo-headline" style="padding:0px;">
        <h1 class="demo-logo">Cajero
          <small>24 Horas Banking</small>
        </h1>
      </div> <!-- /demo-headline -->
      <div class="row">
        <div class="col-xs-12" id="screenView">
          <h1 class="demo-section-title text-uppercase text-center">Cuentas disponibles</h1>
          <br />
           <div class="row">
            <!-- 3/4 -->
	            <div class="col-xs-9">
				<c:forEach var="ac" items="${ requestScope.availableAccounts }">
	              <div class="tile">
	                <h6 class="text-uppercase text-left accountsListItem">
	                  <span>${ ac.idAccount }</span>
	                  ${ ac.accounType }
	                  <span class="fui-arrow-right icon"></span>
	                </h6>
	              </div>
				</c:forEach>
	
	            </div>
	            <!-- 1/4 -->
	            <div class="col-xs-3">
	              <div class="tile">
	               <a id="back" href="topin" class="btn btn-lg btn-inverse text-uppercase btn-padding"><span class="fui-arrow-left"></span> Back</a>
	              </div>
	              <div class="tile">
	               <a id="logout" href="toLogin" class="btn btn-lg btn-info text-uppercase btn-padding"><span class="fui-user"></span> Logout</a>
	              </div>
	              <div class="tile">
	               <a id="cancelTransactin" href="toLogin" class="btn btn-lg btn-danger text-uppercase btn-padding"><span class="fui-cross"></span> Cancel</a>
	              </div>
	            </div>
      	  	</div> <!-- // END OPTIONS-->
      </div><!--  // END column-->
      <div class="col-xs-12">
        <jsp:directive.include file="footer.html" />	
      </div>
  </div><!-- // END row-->

 </div> <!-- /container -->
	<script	src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/flat-ui.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/availableaccount.js"></script>

  </body>
</html>
