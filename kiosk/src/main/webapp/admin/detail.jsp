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
.header__top__right__auth {
	float: right;
	line-height: 80px;
	vertical-align: middle;
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
	<form action="/ad/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="old_image" value="${mvo.image }"><br>
		이름: <input type="text" name="name" class="col-lg-8" value="${mvo.name }" readonly><br>
		가격: <input type="text" name="price" class="col-lg-8" value="${mvo.price }"><br>
		이미지: <input type="file" name="new_image" class="col-lg-8" accept="image/png, image/jpeg, image/jpg, image/gif"><br>
		<button type="submit" class="site-btn">수정</button>
	</form>
<jsp:include page="../footer.jsp" />