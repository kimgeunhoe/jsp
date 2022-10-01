<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<!-- Header -->
<header id="header" class="header">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
        <div class="text-container">
          <h1 class="h1-large">
            The #1 CRM app for <span class="replace-me">small business,
              young startups, bootstrappers</span>
          </h1>
          <p class="p-large">Lorem ipsum dolor sit amet, consectetur
            adipiscing elit. Ut dignissim, neque ut vanic barem ultrices
            sollicitudin</p>
            <c:if test="${ssmvo eq null }">
          <a class="btn-solid-lg" href="/mem/join">Sign up</a>
          </c:if>
        </div>
        <!-- end of text-container -->
      </div>
      <!-- end of col -->
      <div class="col-lg-6">
        <div class="image-container">
          <img class="img-fluid" src="/resources/dist/images/header-illustration.svg"
            alt="alternative">
        </div>
        <!-- end of image-container -->
      </div>
      <!-- end of col -->
    </div>
    <!-- end of row -->
  </div>
  <!-- end of container -->
</header>
<!-- end of header -->
<!-- end of header -->
<script>
  let msg_login = '<c:out value="${msg_login }"/>'; //'0'
  let msg_logout = '<c:out value="${msg_logout }"/>'; //'1'

  if (msg_login === '0') {
    alert('로그인 실패');
  }
  if (msg_logout === '1') {
    alert('로그아웃되었습니다')
  }
</script>
<jsp:include page="footer.jsp"/>