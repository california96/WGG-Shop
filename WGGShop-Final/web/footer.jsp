<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- Footer -->
	<footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45">
		<div class="flex-w p-b-90">
			<div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
				<h4 class="s-text12 p-b-30">
					GET TO KNOW US
				</h4>

				<div>
					<p class="s-text7 w-size27">
						WGG Shop stands for Walang Gentle Gentle Shopping. The shop was created June 2020. The main pioneers of this shop is Bryan Novicio and RJ Angco. 
					</p>

					<div class="flex-m p-t-30">
						<a href="#" class="fs-18 color1 p-r-20 fa fa-facebook"></a>
						<a href="#" class="fs-18 color1 p-r-20 fa fa-instagram"></a>
						<a href="#" class="fs-18 color1 p-r-20 fa fa-pinterest-p"></a>
					</div>
				</div>
			</div>

			<div class="w-size8 p-t-30 p-l-15 p-r-15 respon3">
				<h4 class="s-text12 p-b-30">
					CONTACT US
				</h4>
				<div>
					<p class="s-text7 w-size27">
						Any questions? You could email us at wggshop@gmail.com
					</p>
				</div>
			</div>
		</div>
			<div class="t-center s-text8 p-t-20">
				Copyright © 2018 All rights reserved. | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
			</div>
	</footer>



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- DataTables -->
<script src="fashe/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="fashe/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="fashe/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="fashe/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"></script>
<script src="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css"></script>
<script src="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css"></script>


<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="fashe/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="fashe/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		$('.block2-btn-addcart').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		$('.block2-btn-addwishlist').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script>
	<script>
  $(function () {
    $('#expenses').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "responsive": true,
    });
   
  });
</script>
<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>

<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});

		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="fashe/js/slick-custom.js"></script>



<!--===============================================================================================-->
	<script type="text/javascript" src="fashe/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="fashe/js/main.js"></script>
	<script>
	function computePrice(x){
		var price = +document.getElementById("price" + x).innerHTML;
		var quantity = document.getElementById("quantity" + x).value;
		
		
		document.getElementById(x).innerHTML = (price * quantity);
		//var total =  parseFloat(quantity * price);
		
		//var shippingFee = parseFloat(document.getElementById("shippingfee").innerHTML);
		/* document.getElementById("price").innerHTML = beforeShipping;
		
		var overall = parseFloat(beforeShipping + shippingFee);
		document.getElementById("overall").innerHTML = overall;
		var input = document.getElementById("topay");
		input.setAttribute("min", overall); */
		updateTotal();
	}

	</script>
	<script>
	function updateTotal(){
		 var table = document.getElementById("cart-table"), sumVal = 0;
         var shipping = parseFloat(document.getElementById("shipping").innerHTML);
         for(var i = 1; i < table.rows.length; i++)
         {
             sumVal = sumVal + parseInt(table.rows[i].cells[4].innerHTML);
         }
         document.getElementById("subtotal").innerHTML = sumVal;
         document.getElementById("totalBill").innerHTML = "Php " + (sumVal + shipping);
         console.log(sumVal);
	}
	</script>
	<script>
	function cart(id){
		var ele = document.getElementById(id).value;
		var productID = document.getElementById(id+"_name");
		var quantity = 1
		var continuePrompt = 0;
		$.ajax({
			type: 'post',
			url: 'addtocart.action',
			
			data:{
				productID: ele,
				quantity: quantity,
				continueShopping: continuePrompt
			},
			success: function(response){
				window.location.replace('cart.jsp');
			}
		});
	}
	</script>
</body>
</html>