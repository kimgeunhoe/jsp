<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<style>
.orderlist {
 float: left;
 display: inline;
 width: 70%;
}
.total {
  float: right;
  display: inline;
  width: 29%;
}
.shoping__checkout {
  margin-top: 0;
}
.tab:hover {
	cursor: pointer;
}
 .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
}
.modal.show {
  display: block;
}
.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  height: 600px;
  padding: 40px;
  text-align: center;
  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
  transform: translateX(-50%) translateY(-50%);
}
.featured__item__pic {
  text-align: center;
}
</style>
<body>
  <div id="preloder">
    <div class="loader"></div>
  </div>
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="../index.jsp"><img
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
			<div class="modal">
      <div class="modal_body"><h2>Option</h2><br>
      <div><div>ICE/HOT(선택하지 않으시면 기본적으로 핫으로 제공해드립니다.)</div><button type="button" id="ice" class="btn btn-outline-primary">ICE</button>
      <button type="button" id="hot" class="btn btn-outline-danger">HOT</button></div><br>
      <div><div>기타</div><button type="button" id="size" class="btn btn-outline-success">사이즈 업</button>
      <button type="button" id="shot" class="btn btn-outline-success">샷추가</button>
      <button type="button" id="syrup" class="btn btn-outline-success">시럽 추가</button></div><br>
      <div><button type="button" class="add site-btn">담기</button><button type="button" class="cancel site-btn">취소</button></div>
      </div>
    </div>
			<div id="listbox" class="row featured__filter">
			<c:forEach var="mvo" items="${list }">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="featured__item">
						<div class="featured__item__pic">
							<img alt="" src="/images/${mvo.image }" class="tab ${mvo.type }" data-name="${mvo.name }" data-price="${mvo.price }">
						</div>
						<div class="featured__item__text">
							<h6>${mvo.name }</h6>
							<h5>${mvo.price }원</h5>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row orderlist">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="4">주문 목록</th>
                                </tr>
                            </thead>
                            <tbody id="orderList">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row total">
                <div class="">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Total <span id="totalprice">0원</span></li>
                        </ul>
                        <a href="/od/list" class="primary-btn">결제</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

 	<script src="../resources/dist/js/order.menuList.js"></script>
 	<jsp:include page="../footer.jsp" />