<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<!-- Header -->
<header class="ex-header">
	<div class="container">
		<div class="row">
			<div class="col-xl-10 offset-xl-1">
				<h1 class="text-center">Log In</h1>
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</header>
<!-- end of ex-header -->
<!-- end of header -->


<!-- Basic -->
<div class="ex-form-1 pt-5 pb-5">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 offset-xl-3">
				<div class="text-box mt-5 mb-5">
					<p class="mb-4">
						You don't have a password? Then please <a class="blue"
							href="/mem/join">Sign Up</a>
					</p>

					<!-- Log In Form -->
					<form action="/mem/login" method="post">
						<div class="mb-4 form-floating">
							<input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
							<label for="floatingInput">Email address</label>
						</div>
						<div class="mb-4 form-floating">
							<input type="password" class="form-control" id="floatingPassword" name="pwd"
								placeholder="Password"> <label for="floatingPassword">Password</label>
						</div>
						<div class="mb-4 form-check">
							<input type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">I agree with the site's stated <a
								href="privacy.html">Privacy Policy</a> and <a href="terms.html">Terms
									& Conditions</a></label>
						</div>
						<button type="submit" class="form-control-submit-button">Log
							in</button>
					</form>
					<!-- end of log in form -->

				</div>
				<!-- end of text-box -->
			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</div>
<!-- end of ex-basic-1 -->
<!-- end of basic -->
<jsp:include page="../footer.jsp" />