<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file = "navbar.jsp" %>
<!-- Cart -->
	<section class="cart bgwhite p-t-70 p-b-100">
	
	
		<div class="container">
			<!-- Cart item -->
			
			<div class="container-table-cart pos-relative">
			
			
				<div class="wrap-table-shopping-cart bgwhite">
				<form action = "finalizecart.action" method = "post" id = "cart-form">
					<table class="table-shopping-cart" id = "cart-table">
						<tr class="table-head">
							<th class="column-1"></th>
							<th class="column-2">Product</th>
							<th class="column-3">Price</th>
							<th class="column-4 p-l-70">Quantity</th>
							<th class="column-5">Total</th>
							<th class="column-6">Action</th>
						</tr>

					
						
						 <c:forEach items = "${sessionScope.products }" var = "elem">
						 <tr class="table-row">
							<td class="column-1">
								<div class="cart-img-product b-rad-4 o-f-hidden">
									<img src = "retrieveimage.action?fileName=${elem.image }">
								</div>
							</td>
							<td class="column-2">${elem.name }</td>
							<td class="column-3" id = "price${elem.productID }">${elem.price }</td>
							<td class="column-4">
								<div class="flex-w bo5 of-hidden w-size17" style="margin-left: 80px;">
									<!-- <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
										<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
									</button> -->

									<input class="size8 m-text18 t-center num-product" type="number" name="quantity" id = "quantity${elem.productID }"value="${elem.quantity }" min = "1" oninput = "computePrice(${elem.productID })">

									<!-- <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
										<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
									</button> -->
								</div>
							</td>
							<td class="column-5" id = "${elem.productID }">${elem.price }</td>
							<td class="column-6">
								<a href = "removefromcart.action?id=${elem.productID }" onclick = 'return confirm("Confirm removal?")'>
								<button type = "button" class="flex-c-m sizefull bg9 bo-rad-23 hov9 s-text1 trans-0-4">Remove</button>
								
								</a>
							</td>
						</tr>
						 </c:forEach>
						
					</table>
					</form>
				</div>
			</div>

			<!-- <div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
				<div class="size10 trans-0-4 m-t-10 m-b-10">
					Button
					<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
						Update Cart
					</button>
				</div>
			</div> -->

			<!-- Total -->
			<div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
				<h5 class="m-text20 p-b-24">
					Cart Totals
				</h5>

				<!--  -->
				<div class="flex-w flex-sb-m p-b-12">
					<span class="s-text18 w-size19 w-full-sm">
						Subtotal:
					</span>

					<span class="m-text21 w-size20 w-full-sm" id = "subtotal">
						
					</span>
				</div>

				<!--  -->
				<div class="flex-w flex-sb bo10 p-t-15 p-b-20">
					<span class="s-text18 w-size19 w-full-sm">
						Shipping Fee:
					</span>

					<div class="w-size20 w-full-sm">
						<p class="s-text8 p-b-23" id = "shipping">
							${initParam.shippingFee }
						</p>
					</div>
				</div>

				<!--  -->
				<div class="flex-w flex-sb-m p-t-26 p-b-30">
					<span class="m-text22 w-size19 w-full-sm">
						Total:
					</span>

					<span class="m-text21 w-size20 w-full-sm" id = "totalBill">
						

					</span>
				</div>

				<div class="size15 trans-0-4">
					<!-- Button -->
					<button type = "submit" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" form = "cart-form">
						Proceed to Checkout
					</button>
					
				</div>
			</div>
		</div>
		</form>
	</section>
	<script>
document.title = "WGG Shop - Cart";

</script>
<%@include file = "footer.jsp" %>