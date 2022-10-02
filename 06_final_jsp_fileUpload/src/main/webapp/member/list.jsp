<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<!-- Testimonials -->
<div class="slider-1 bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="h2-heading">Member List</h2>
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
		<div class="row">
			<div class="col-lg-12">

				<!-- Card Slider -->
				<div class="slider-container">
					<div class="swiper-container card-slider">
						<div class="swiper-wrapper">
							<c:forEach var="mvo" items="${list }">
								<!-- Slide -->
								<div class="swiper-slide">
									<div class="card">
										<img class="card-image"
											src="/resources/dist/images/testimonial-1.jpg"
											alt="alternative">
										<div class="card-body">
											<p class="testimonial-text">Register Date: ${mvo.reg_at }<br>Last Login: ${mvo.last_login }<br>Grade: ${mvo.grade }</p>
											<p class="testimonial-author">${mvo.nick_name }(<a href="/mem/modify?em=${mvo.email }">${mvo.email }</a>)</p>
										</div>
									</div>
								</div>
								<!-- end of swiper-slide -->
								<!-- end of slide -->
							</c:forEach>
						</div>
						<!-- end of swiper-wrapper -->

						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<!-- end of add arrows -->

					</div>
					<!-- end of swiper-container -->
				</div>
				<!-- end of slider-container -->
				<!-- end of card slider -->

			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</div>
<!-- end of slider-1 -->
<!-- end of testimonials -->
<jsp:include page="../footer.jsp" />