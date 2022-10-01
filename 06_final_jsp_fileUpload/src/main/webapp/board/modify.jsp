<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<!-- Header -->
<header class="ex-header">
  <div class="container">
    <div class="row">
      <div class="col-xl-10 offset-xl-1">
        <h1 class="text-center">Board Modify</h1>
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
          <form action="/brd/update" method="post" enctype="multipart/form-data">
          <input type="hidden" name="bno" value="${bvo.bno }">
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="title" value="${bvo.title }" required>
              <label for="">Title</label>
            </div>
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="price"
                value="${bvo.price }" required>
                <label for="">Price</label>
            </div>
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="made_by"
                value="${bvo.made_by }" required>
                <label for="floatingInput">Made by</label>
            </div>
            <div class="mb-4 form-floating">
              <input type="text" class="form-control" id="" name="category"
                value="${bvo.category }">
                <label for="">Category</label>
            </div>
            <div class="mb-4 form-floating">
              <textarea rows="" cols="" class="form-control" id="" name="description">${bvo.description }</textarea>
                <label for="">Description</label>
            </div>
            <div class="mb-4 form-floating">
              <input type="hidden" class="form-control" id="" name="image_file" value="${bvo.image_file }">
            </div>
            <div class="mb-4 form-floating">
              <input type="file" class="form-control" id="" name="new_file" accept="image/png, image/jpeg, image/jpg, image/gif">
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