<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<!-- Pricing -->
<div id="pricing" class="cards-2 bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="h2-heading">
					Board List 
					<c:if test="${ssmvo.email ne null && ssmvo.email ne ''}">
					<a href="/brd/register" class="btn btn-primary">Register</a>
					</c:if>
				</h2>
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
		<div class="row">
			<div class="col-lg-12">
				<c:forEach var="bvo" items="${list }">
					<!-- Card -->
					<div class="card">
						<div class="card-body">
							<div class="card-title">
							<c:if test="${bvo.image_file ne '' && bvo.image_file ne null }">
								<img class="decoration-lines" src="/_fileUpload/th_${bvo.image_file }" alt="alternative">
							</c:if>
									<span>${bvo.title }</span><img class="decoration-lines flipped" src="/resources/dist/images/decoration-lines.svg" alt="alternative">
							</div>
							<ul class="list-unstyled li-space-lg">
								<li>${bvo.bno }</li>
								<li>${bvo.mod_at }</li>
								<li>${bvo.read_count }</li>
							</ul>
							<div class="price">${bvo.price }</div>
							<a href="/brd/detail?bno=${bvo.bno }" class="btn-solid-reg">Go Detail</a>
						</div>
					</div>
					<!-- end of card -->
				</c:forEach>
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</div>
<!-- end of cards-2 -->
<!-- end of pricing -->
<jsp:include page="../footer.jsp" />