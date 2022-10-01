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
					<h2>${bvo.title }</h2>
					<p>${bvo.description }</p>
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
						<img class="img-fluid" id="imgFile" src="/_fileUpload/${bvo.image_file }" alt="alternative">
					<c:if test="${bvo.image_file ne '' && bvo.image_file ne null }">
					  <button type="button" class="btn btn-outline-danger" id="fileDelBtn">Image Delete</button>
					</c:if>
					</div>
					<!-- end of image-container -->
				</div>
				<!-- end of col -->
				<div class="col-lg-4">
					<h3>${bvo.title }</h3>
					<hr>
					<p>${bvo.reg_at }/${bvo.mod_at }</p>
					<h4>${bvo.read_count }</h4>
					<p>${bvo.description }</p>
					<ul class="list-unstyled li-space-lg">
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${bvo.price }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${bvo.writer }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${bvo.made_by }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${bvo.bno }</div></li>
						<li class="d-flex"><i class="fas fa-chevron-right"></i>
							<div class="flex-grow-1">${bvo.category }</div></li>
					</ul>
					<c:if test="${ssmvo.email eq bvo.writer }">
						<a id="modalCtaBtn" class="btn-solid-reg"
							href="/brd/modify?bno=${bvo.bno }">Modify</a>
						<a id="modalCtaBtn" class="btn-outline-reg"
							href="/brd/remove?bno=${bvo.bno }">Remove</a>
					</c:if>
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
				<h2 class="h2-heading">Board Comment</h2>
				<div class="input-group mb-3">
					<span class="input-group-text" id="cmtWriter">${ssmvo.email }</span> <input type="text"
						class="form-control" id="cmtText" placeholder="Add Comment">
					<button class="btn btn-success" type="button" id="cmtAddBtn">ADD</button>
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
const bnoVal = '<c:out value="${bvo.bno}"/>';
</script>
<script src="/resources/js/board.detail.js"></script>
<script>
printCommentList(bnoVal);
</script>
<jsp:include page="../footer.jsp" />