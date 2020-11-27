<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 	<link rel="icon" href="../../../main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../../../main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../../../main_resource/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../../../main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/nice-select/nice-select.css">

  <link rel="stylesheet" href="../../../main_resource/css/style.css"> -->
  <link rel="stylesheet" href="../../../main_resource/css/review.css">
  


</head>
<body>
	<!-- modal start -->
	<div id="my_modal">
	    <div class="review-modal__title">
			리뷰작성
		</div>
			<form class="review-modal__form"><!-- enctype="multipart/form-data" -->
			<!-- <div class="review-modal__form"> -->
					<input type="hidden"  name="${review.store_seq}" value="${review.store_seq}">
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="review-modal__form__product">
					<img class="review-modal__form__product__image" src="../../main_resource/img/product/product1.png">
					<div class="review-modal__form__product__contents">
						<div class="review-modal__form__product__contents__brand">제품명</div>
						<div class="review-modal__form__product__contents__name">
						제품설명 롸라라라롸라라라라ㅏㄹ
						</div>
						<div class="review-modal__form__product__contents__options"></div>
					</div>
				</div>
				<div class="col-md-12 text-right">
					<input type="file" class="ti-search" name="review_picture">사진 첨부하기
				</div>
				<div class="review-modal__section">
					<div class="review-modal__section__title">리뷰 내용</div>
					<div class="form-group">
	                    <textarea class="form-control different-control w-100" name="review_content" id="message" cols="30" rows="5" placeholder="Enter Message"></textarea>
	                </div>
					<div class="review-modal__form__review-input__length">
						<!-- <span class="review-modal__form__review-input__length__value">0</span> --><!-- 글자수 체크해주는거 -->
					</div>
				</div>
				<div class="col-md-12">
					<button id="reviewAddBtn" class="btn primary-btn">리뷰쓰기</button>
				</div>
			<!-- </div> -->
			</form>
	    <a class="modal_close_btn">닫기</a>
	</div>
	<!-- modal end -->

	<!-- review list start-->
	<div class="col-lg-12 review_sidebar_jsb">
		<%-- <c:if test="${list2.totalCount > 0}"> --%>
			<div class="review_sidebar_count_jsb" >
				<h4 >리뷰  ${reviewCnt}</h4>
			</div>
			<div class="review_sidebar_button_jsb">
				<a id="popup_open_btn">리뷰쓰기</a>
			</div>
			<div class="review_sidebar_select_jsb">
	                 <div class="nice-select" tabindex="0"><span class="current">상품옵션</span>
	                  <ul class="list">
	                  <!-- 글번호 불러오면 상품들 다 가져올 수 있다고 함 -->
	                  <li data-value="1" class="option selected focus">안마의자 핑크</li>
	                  <li data-value="1" class="option">안마의자 블랙</li>
	                  <li data-value="1" class="option">안마의자 옐로</li>
	                  </ul>
	                 </div>
	   		</div>
	        <div class="blog_left_sidebar">
	        	<a class="review_sidebar_alig_jsb">추천순</a>
	        	<a class="review_sidebar_alig_jsb">최신순</a>
	        	<a class="review_sidebar_alig_jsb">평점</a>
	        	<!-- review list 시작 -->
	            <div class="production-review-item__container">
	            </div>
	            <div class="review_paging"></div>
	        </div>
    </div>
              <!-- review list end -->
              
 <!-- <script src="../../../main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
 <script src="../../../main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
 <script src="../../../main_resource/vendors/skrollr.min.js"></script>
 <script src="../../../main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
 <script src="../../../main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
 <script src="../../../main_resource/vendors/jquery.ajaxchimp.min.js"></script>
 <script src="../../../main_resource/vendors/mail-script.js"></script>
 <script src="../../../main_resource/js/main.js"></script> -->
 <script type="text/javascript">
 	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
 </script>
 <script src="../../../main_resource/js/review.js"></script>

</body>
</html>