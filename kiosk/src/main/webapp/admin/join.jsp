<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<style>
form {
	position: absolute;
	text-align: center;
	top: 40%;
	left: 40%;
}
input {
	margin-bottom: 10px;
}
</style>
<body>
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="../index.jsp"><img src="../resources/dist/img/logo.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<form action="/ad/login" method="post">
		Admin ID: <input type="text" name="id" class="col-lg-8" placeholder="admin id"><br>
		Password: <input type="password" name="pd" class="col-lg-8" placeholder="password"><br>
		<button type="submit" class="site-btn">로그인</button>
	</form>
<jsp:include page="../footer.jsp" />
