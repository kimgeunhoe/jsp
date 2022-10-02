<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<!-- Details 1 -->
<div id="details" class="basic-1 bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-xl-5">
				<div class="text-container">
					<h2>${pvo.pname }</h2>
					<p>${pvo.price }</p>
					<a class="btn-solid-reg" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">More</a>
				</div>
				<!-- end of text-container -->
			</div>
			<!-- end of col -->
			<div class="col-lg-6 col-xl-7">
				<div class="image-container">
					<img class="img-fluid" src="/resources/dist/images/details-1.svg"
						alt="alternative">
				</div>
				<!-- end of image-container -->
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</div>
<!-- end of basic-1 -->
<!-- end of details 1 -->
<!-- Details Modal -->
<div id="staticBackdrop" class="modal fade" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="row">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
				<div class="col-lg-8">
					<div class="image-container">
						<img class="img-fluid"
							src="resources/dist/images/details-modal.jpg" alt="alternative">
					</div>
					<!-- end of image-container -->
				</div>
				<!-- end of col -->
				<div class="col-lg-4">
					<ul class="list-unstyled li-space-lg">
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${pvo.price }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${pvo.pname }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${pvo.madeby }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${pvo.regdate }</div></li>
					</ul>
						<a id="modalCtaBtn" class="btn-solid-reg"
							href="/pd/modify?pno=${pvo.pno }">Modify</a>
						<a id="modalCtaBtn" class="btn-outline-reg"
							href="/pd/remove?pno=${pvo.pno }">Remove</a>
					<%-- <c:if test="${ssmvo.email eq bvo.writer }">
					</c:if> --%>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of modal-content -->
	</div>
	<!-- end of modal-dialog -->
</div>
<!-- end of modal -->
<!-- end of details modal -->
<!-- Questions -->
<div class="accordion-1">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="h2-heading">Product Reply</h2>
				<div class="input-group mb-3">
					<span class="input-group-text" id="rpWriter">${ssmvo.email }</span> <input type="text"
						class="form-control" id="rpText" placeholder="Add Reply">
					<button class="btn btn-success" type="button" id="rpAddBtn">ADD</button>
				</div>
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="accordion" id="accordionExample">

				</div>
				<!-- end of accordion -->
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</div>
<!-- end of accordion-1 -->
<!-- end of questions -->
<script>
const pnoVal = '<c:out value="${pvo.pno}"/>';
</script>
<script src="/resources/js/product.detail.js"></script>
<script>
printReplyList(pnoVal);
</script>
<jsp:include page="../footer.jsp" />