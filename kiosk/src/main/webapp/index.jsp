<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" />
<style>
  a {
    margin-top: 8%;
    margin-left: 21%;
  }
</style>
<body>
<header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="index.jsp"><img src="resources/dist/img/logo.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </header>
	<section class="featured spad">
    <a href="od/list" class="site-btn"><h1>Order</h1></a>
    <c:if test="${ses.id eq null }"><a href="ad/join" class="site-btn"><h1>Admin</h1></a></c:if>
    <c:if test="${ses.id ne null }"><a href="ad/list" class="site-btn"><h1>Admin</h1></a></c:if>
	</section>
<jsp:include page="footer.jsp" />
