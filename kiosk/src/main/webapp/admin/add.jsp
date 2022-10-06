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
.nice-select {
  margin-left: 40%;
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
	<form action="/ad/menuadd" method="post" enctype="multipart/form-data">
		이름: <input type="text" name="name" class="col-lg-8" placeholder="이름" required><br>
		가격: <input type="text" name="price" class="col-lg-8" placeholder="가격" required><br>
		<!-- 종류:  <input type="text" name="type" placeholder="종류" required><br> -->
		<select name="type" required>
		  <option value="coffee">coffee</option>
		  <option value="tea">tea</option>
		  <option value="etc">etc</option>
		</select><br><br>
		이미지: <input type="file" name="image" class="col-lg-8" accept="image/png, image/jpeg, image/jpg, image/gif" required><br>
		<button type="submit" class="site-btn">메뉴 추가</button>
	</form>
<jsp:include page="../footer.jsp" />