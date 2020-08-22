<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file = "header.jsp" %>
<body class="animsition" onload = "updateTotal()">

	<!-- header fixed -->
	<div class="wrap_header fixed-header2 trans-0-4">
		<!-- Logo -->
		<a href="index" class="logo">
			<h2>WGG Shop </h2>
			
		</a>

		<!-- Menu -->
		<div class="wrap_menu">
			<nav class="menu">
				<ul class="main_menu">
					<li>
						<a href="index">Home</a>
					</li>
					<li>
						<a href="cart.jsp">Cart</a>
					</li>
				</ul>
			</nav>
		</div>

		<!-- Header Icon -->
		<div class="header-icons">
			<span class="linedivide1"></span>

			<div class="header-wrapicon2">
				<img src="fashe/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
				<span class="header-icons-noti">${fn:length(sessionScope.products)}</span>

				<!-- Header cart noti -->
				<div class="header-cart header-dropdown">
					<ul class="header-cart-wrapitem">
						<c:forEach items = "${sessionScope.products }" var = "elem">
						
						<li class="header-cart-item">
							<div class="header-cart-item-img">
								<img src = "retrieveimage.action?fileName=<c:out value ="${elem.image }"/>">
							</div>

							<div class="header-cart-item-txt">
								<a href="#" class="header-cart-item-name">
									${elem.name }
								</a>

								<span class="header-cart-item-info">
									${elem.quantity } x Php ${elem.price }00
								</span>
							</div>
						</li>
						</c:forEach>
					</ul>

					<div class="header-cart-total">
						Total: ???
					</div>

					<div class="header-cart-buttons" style="justify-content: center;">
						<div class="header-cart-wrapbtn">
							<!-- Button -->
							<a href="cart.jsp" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
								View Cart
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Header -->
	<header class="header2">
		<!-- Header desktop -->
		<div class="container-menu-header-v2 p-t-26">
			<div class="topbar2">
				<div class="topbar-social">
					<a href="#" class="topbar-social-item fa fa-facebook"></a>
					<a href="#" class="topbar-social-item fa fa-instagram"></a>
					<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
				</div>

				<!-- Logo2 -->
				<a href="index" class="logo2">
					<h2>WGG Shop </h2>
				</a>

				<div class="topbar-child2">

					<span class="linedivide1"></span>

					<div class="header-wrapicon2 m-r-13">
						<img src="fashe/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
						<span class="header-icons-noti">${fn:length(sessionScope.products)}</span>

						<!-- Header cart noti -->
						<div class="header-cart header-dropdown">
							<ul class="header-cart-wrapitem">
								<c:forEach items = "${sessionScope.products }" var = "elem">
						<li class="header-cart-item">
							<div class="header-cart-item-img">
								<img src = "retrieveimage.action?fileName=<c:out value ="${elem.image }"/>">
							</div>

							<div class="header-cart-item-txt">
								<a href="#" class="header-cart-item-name">
									${elem.name }
								</a>

								<span class="header-cart-item-info">
									${elem.quantity } x Php ${elem.price }
								</span>
							</div>
						</li>
						
						</c:forEach>

								
							</ul>


							<div class="header-cart-buttons" style="justify-content: center;">
								<div class="header-cart-wrapbtn">
									<!-- Button -->
									<a href="cart.jsp" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
										View Cart
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="wrap_header">

				<!-- Menu -->
				<div class="wrap_menu">
					<nav class="menu">
						<ul class="main_menu">
							<li>
								<a href="index">Home</a>
							</li>
							<li>
								<a href="cart.jsp">Cart</a>
							</li>
						</ul>
					</nav>
				</div>

				<!-- Header Icon -->
				<div class="header-icons">

				</div>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap_header_mobile">
			<!-- Logo moblie -->
			<a href="index.jsp" class="logo-mobile">
				<h3>WGG Shop </h3>
			</a>

			<!-- Button show menu -->
			<div class="btn-show-menu">
				<!-- Header Icon mobile -->
				<div class="header-icons-mobile">

					<span class="linedivide2"></span>

					<div class="header-wrapicon2">
						<img src="fashe/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
						<span class="header-icons-noti">${fn:length(sessionScope.products)}</span>

						<!-- Header cart noti -->
						<div class="header-cart header-dropdown">
							<ul class="header-cart-wrapitem">
								<c:forEach items = "${sessionScope.products }" var = "elem">
								<li class="header-cart-item">
									<div class="header-cart-item-img">
								<img src = "retrieveimage.action?fileName=<c:out value ="${elem.image }"/>">
									</div>

									<div class="header-cart-item-txt">
										<a href="#" class="header-cart-item-name">
											${elem.name }
										</a>

										<span class="header-cart-item-info">
											${elem.quantity } x Php ${elem.price }
										</span>
									</div>
								</li>
								</c:forEach>
							<div class="header-cart-buttons" style="justify-content: center;">
								<div class="header-cart-wrapbtn">
									<!-- Button -->
									<a href="cart.jsp" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
										View Cart
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
					<span class="hamburger-box">
						<span class="hamburger-inner"></span>
					</span>
				</div>
			</div>
		</div>

		<!-- Menu Mobile -->
		<div class="wrap-side-menu" >
			<nav class="side-menu">
				<ul class="main-menu">
					<li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
						<!-- <span class="topbar-child1">
							Free shipping for standard order over $100
						</span> -->
					</li>

					<li class="item-topbar-mobile p-l-10">
						<div class="topbar-social-mobile">
							<a href="#" class="topbar-social-item fa fa-facebook"></a>
							<a href="#" class="topbar-social-item fa fa-instagram"></a>
							<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
						</div>
					</li>

					<li class="item-menu-mobile">
						<a href="index">Home</a>
					</li>

					<li class="item-menu-mobile">
						<a href="cart.jsp">Cart</a>
					</li>
				</ul>
			</nav>
		</div>
	</header>