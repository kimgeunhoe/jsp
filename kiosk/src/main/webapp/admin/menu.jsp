<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<style>
.header__top__right__auth {
	float: right;
	line-height: 80px;
	vertical-align: middle;
}
body {
	text-align: center;
}
</style>
<body>
	<header class="header">
		<div class="container">
			<c:if test="${ses.id ne null }"><div class="header__top__right__auth">
				<a href="/ad/logout"><i class="fa fa-user"></i>로그아웃</a>
			</div></c:if>
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="/index.jsp"><img
							src="../resources/dist/img/logo.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Menu List</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active typeList" data-type="all">All</li>
							<li class="typeList" data-type="coffee">Coffee</li>
							<li class="typeList" data-type="tea">Tea</li>
							<li class="typeList" data-type="etc">Etc</li>
						</ul>
					</div>
				</div>
			</div>
			<c:if test="${ses.id ne null }">
			<div id="listbox" class="row featured__filter">
			<c:forEach var="mvo" items="${list }">
				<div class="col-lg-3 col-md-4 col-sm-6 mix">
					<div class="featured__item">
						<div class="featured__item__pic set-bg">
							<img alt="" src="/images/${mvo.image }">
						</div>
						<div class="featured__item__text">
							<h6>${mvo.name }</h6>
							<h5>${mvo.price }원</h5>
						</div>
						<div class="blog__sidebar__item__tags">
							<a href="/ad/modify?name=${mvo.name }" class="btn btn-outline-warning">수정</a>
							<a href="/ad/remove?name=${mvo.name }" class="btn btn-outline-danger">삭제</a>
						</div>
					</div>
				</div>
			</c:forEach>
			</div></c:if>
		</div>
	</section>
	<c:if test="${ses.id ne null }"><a href="/ad/add" class="site-btn">메뉴 추가</a></c:if>
<script>
  let msg_login = '<c:out value="${msg_login }"/>';
  let msg_logout = '<c:out value="${msg_logout }"/>';

  if (msg_login === '0') {
    alert('로그인 실패');
  }
  if (msg_logout === '1') {
    alert('로그아웃되었습니다')
  }
</script>
<script src="../resources/dist/js/admin.menuList.js"></script>
<jsp:include page="../footer.jsp" />