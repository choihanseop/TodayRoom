<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Cart</title>
	<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="/main_resource/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="/main_resource/css/style.css">
  <link rel="stylesheet" href="/main_resource/css/basketlist.css">
</head>
<body>
  <!--================ Start Header Menu Area =================-->
  	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>장바구니</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">장바구니</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
      
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">제품명</th>
                              <th scope="col">가격</th>
                              <th scope="col">수량</th>
                              <th scope="col">총계</th>
                          </tr>
                      </thead>
                      <tbody class="tbody_class">
                         <c:forEach items="${list }" var="basket" varStatus="status">
                          <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="/main_resource/upload/${basket.productvo.product_fname}" alt="">
                                      </div>
                                      <div class="media-body">
                                          <a href="/store/read?store_seq=${basket.productvo.store_seq }">
                                          <p>${basket.productvo.product_name }</p></a>
                                          <button class="carted-product__delete" type="button" aria-label="삭제" data-basket_seq=${basket.basket_seq }>
                                          	<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                          		<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z">
                                          		</path>
                                          	</svg>
                                          </button>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${basket.productvo.product_price }</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                      <span class="product_price_hidden" id="${status.count }" hidden="">${basket.productvo.product_price }</span>
                                      <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                          class="input-text">
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                          class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                          class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                  </div>
                              </td>
                              <td>
                              <h5>
                                  <span class="product_one_price" id="${status.count }">${basket.productvo.product_price }</span>원
                              </h5>
                              </td>
                          </tr>
                          </c:forEach>
                          <tr class="bottom_button">
                              <td>
                                  <a class="button" href="#">Update Cart</a>
                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="cupon_text d-flex align-items-center">
                                      <a class="primary-btn" href="#">Apply</a>

                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <h5>Subtotal</h5>
                              </td>
                              <td>
                                  <h5>
                                	  <span class="product_total_price">0</span>원
                                  </h5>
                              </td>
                          </tr>
                          <tr class="shipping_area">
                              <td class="d-none d-md-block">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <h5>Shipping</h5>
                              </td>
                              <td>
                                  <div class="shipping_box">
                                      <ul class="list">
                                          <li><a href="#">Flat Rate: $5.00</a></li>
                                          <li><a href="#">Free Shipping</a></li>
                                          <li><a href="#">Flat Rate: $10.00</a></li>
                                          <li class="active"><a href="#">Local Delivery: $2.00</a></li>
                                      </ul>
                                      <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6>
                                      <select class="shipping_select">
                                          <option value="1">Bangladesh</option>
                                          <option value="2">India</option>
                                          <option value="4">Pakistan</option>
                                      </select>
                                      <select class="shipping_select">
                                          <option value="1">Select a State</option>
                                          <option value="2">Select a State</option>
                                          <option value="4">Select a State</option>
                                      </select>
                                      <input type="text" placeholder="Postcode/Zipcode">
                                      <a class="gray_btn" href="#">Update Details</a>
                                  </div>
                              </td>
                          </tr>
                          <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td class="">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="checkout_btn_inner d-flex align-items-center">
                                      <a class="gray_btn" href="#">Continue Shopping</a>
                                      <a class="primary-btn ml-2" href="#">Proceed to checkout</a>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->



  <!--================ Start footer Area  =================-->	
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->



  <script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="/main_resource/vendors/skrollr.min.js"></script>
  <script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="/main_resource/vendors/mail-script.js"></script>
  <script src="/main_resource/js/main.js"></script>
  <script src="/main_resource/js/basket_list.js"></script>
</body>
</html>