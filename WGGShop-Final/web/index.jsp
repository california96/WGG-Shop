<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file = "navbar.jsp" %>
	<!-- Our product -->
	<section class="bgwhite p-t-45 p-b-58">
		<div class="container">
			<div class="sec-title p-b-22">
				<h3 class="m-text5 t-center">
					Our Products
				</h3>
			</div>

			<!-- Tab01 -->
			<div class="tab01">
				<!-- Tab panes -->
				<div class="tab-content p-t-35">
					<!-- - -->
					<div class="tab-pane fade show active" id="best-seller" role="tabpanel">
						<div class="row">
							<c:forEach items = "${products }" var = "elem">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<input type = "hidden" name = "id" id = "${elem.productID }" value = "${elem.productID }">
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2">
										<img style="width: 288px; height: 320px;"src = "retrieveimage.action?fileName=<c:out value ="${elem.image }"/>">

										<div class="block2-overlay trans-0-4">

											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4" onclick = "cart(${elem.productID})">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="viewproduct.action?id=${elem.productID }" class="block2-name dis-block s-text3 p-b-5">
											${elem.name }
										</a>
										
										<span class="block2-price m-text6 p-r-5">
											Php ${elem.price }
										</span>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="featured" role="tabpanel">
						<div class="row">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-07.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Frayed denim shorts
										</a>

										<span class="block2-oldprice m-text7 p-r-5">
											$29.50
										</span>

										<span class="block2-newprice m-text8 p-r-5">
											$15.90
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
										<img src="fashe/images/item-01.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative">
										<img src="fashe/images/item-14.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Denim jacket blue
										</a>

										<span class="block2-price m-text6 p-r-5">
											$92.50
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
										<img src="fashe/images/item-06.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-11.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Frayed denim shorts
										</a>

										<span class="block2-oldprice m-text7 p-r-5">
											$29.50
										</span>

										<span class="block2-newprice m-text8 p-r-5">
											$15.90
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
										<img src="fashe/images/item-12.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative">
										<img src="fashe/images/item-15.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Denim jacket blue
										</a>

										<span class="block2-price m-text6 p-r-5">
											$92.50
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!--  -->
					<div class="tab-pane fade" id="sale" role="tabpanel">
						<div class="row">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-01.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-14.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Denim jacket blue
										</a>

										<span class="block2-price m-text6 p-r-5">
											$92.50
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-06.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-08.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Denim jacket blue
										</a>

										<span class="block2-price m-text6 p-r-5">
											$92.50
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!--  -->
					<div class="tab-pane fade" id="top-rate" role="tabpanel">
						<div class="row">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
										<img src="fashe/images/item-02.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<a href="#" class="block2-btn-addwishlist hov-pointer trans-0-4">
												<i class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
												<i class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
											</a>

											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative">
										<img src="fashe/images/item-03.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Denim jacket blue
										</a>

										<span class="block2-price m-text6 p-r-5">
											$92.50
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative">
										<img src="fashe/images/item-05.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">

											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Coach slim easton black
										</a>

										<span class="block2-price m-text6 p-r-5">
											$165.90
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-07.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Frayed denim shorts
										</a>

										<span class="block2-oldprice m-text7 p-r-5">
											$29.50
										</span>

										<span class="block2-newprice m-text8 p-r-5">
											$15.90
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative">
										<img src="fashe/images/item-10.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">
											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Coach slim easton black
										</a>

										<span class="block2-price m-text6 p-r-5">
											$165.90
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
										<img src="fashe/images/item-11.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">

											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Frayed denim shorts
										</a>

										<span class="block2-oldprice m-text7 p-r-5">
											$29.50
										</span>

										<span class="block2-newprice m-text8 p-r-5">
											$15.90
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
										<img src="fashe/images/item-12.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">

											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Herschel supply co 25l
										</a>

										<span class="block2-price m-text6 p-r-5">
											$75.00
										</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-img wrap-pic-w of-hidden pos-relative">
										<img src="fashe/images/item-15.jpg" alt="IMG-PRODUCT">

										<div class="block2-overlay trans-0-4">

											<div class="block2-btn-addcart w-size1 trans-0-4">
												<!-- Button -->
												<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
													Add to Cart
												</button>
											</div>
										</div>
									</div>

									<div class="block2-txt p-t-20">
										<a href="product-details.jsp" class="block2-name dis-block s-text3 p-b-5">
											Denim jacket blue
										</a>

										<span class="block2-price m-text6 p-r-5">
											$92.50
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	

<%@include file = "footer.jsp" %>