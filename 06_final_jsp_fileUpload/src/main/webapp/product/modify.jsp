<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<!-- Header -->
<header class="ex-header">
  <div class="container">
    <div class="row">
      <div class="col-xl-10 offset-xl-1">
        <h1 class="text-center">Product Modify</h1>
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
          <!-- Sign Up Form -->
          <form action="/pd/update" method="post">
          <input type="hidden" name="pno" value="${pvo.pno }">
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="pname"
                value="${pvo.pname }" required>
                <label for="">Title</label>
            </div>
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="price"
                value="${pvo.price }" required>
                <label for="">Price</label>
            </div>
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="madeby"
                value="${pvo.madeby }" required>
                <label for="floatingInput">Made by</label>
            </div>
            <button type="submit" class="form-control-submit-button">Modify</button>
          </form>
          <!-- end of sign up form -->
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