<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "navbar.jsp" %>
<!-- breadcrumb -->
	<div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
		<a href="cart.jsp" class="s-text16">
			Cart
			<i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a>
		<span class="s-text17">
			Checkout
		</span>
	</div>
<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="container-table-cart pos-relative">
				<div class="wrap-table-shopping-cart bgwhite">
					<table class="table-shopping-cart">
						<tr class="table-head">
							<th class="column-1"></th>
							<th class="column-2">Product</th>
							<th class="column-3">Price</th>
							<th class="column-4 p-l-70">Quantity</th>
						</tr>

					
						
						 <c:forEach items = "${sessionScope.products }" var = "elem">
						
						 <tr class="table-row">
							<td class="column-1">
								<div class="cart-img-product b-rad-4 o-f-hidden">
									<img src = "retrieveimage.action?fileName=<c:out value ="${elem.image }"/>">
								</div>
							</td>
							<td class="column-2">${elem.name }</td>
							<td class="column-3">Php ${elem.price }</td>
							<td class="column-4" style="max-width: 220px!important;">
								<div class="flex-w bo5 of-hidden w-size17" style="margin-left: 80px;">
									<input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value="${elem.quantity }" disabled>
								</div>
							</td>
						</tr>
						 </c:forEach>
						
					</table>
				</div>
			</div>
			<div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
				<div class="size10 trans-0-4 m-t-10 m-b-10" style="width: 340px;">
					<h5 class="m-text26 p-b-36 p-t-15" style="font-family: Montserrat-Bold;font-size: 14px;">
					
					
				Total: Php ${transaction.totalBill } *shipping fee included*
			</h5>
				</div>
			</div>
			<h4 class="m-text26 p-b-36 p-t-15">
				Checkout:
			</h4>
			<div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
				<div class="col-md-12 p-b-30">
					<form action="computetransaction.action" method = "post">
						<input type = "hidden" name = "totalBill" value = "${transaction.totalBill }">
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="customerName" placeholder="Full Name" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="contactNo" placeholder="Contact Number" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" placeholder="Email Address" required>
						</div>
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="number" name="amountPaid" step = ".1" min = "${transcation.totalBill }" placeholder="Amount to Pay" required>
						</div>
						<textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" name="shippingAddress" placeholder="Shipping Address"></textarea>
						<p>**Please take note that we only offer COD (Cash on Delivery) service. So please prepare the amount needed for the products ordered.**</p>
							
						<div class="w-size25 block2-btn-checkout" style="float: right;">
							<!-- Button -->
							
			
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4" type = "submit">
								Submit
							</button>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</section>
	<%@include file = "footer.jsp" %>