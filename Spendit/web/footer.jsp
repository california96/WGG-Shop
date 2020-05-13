<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
  </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2020 Kupunan ni Eugene</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Spendit</b> 
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<script src="adminlte/plugins/jquery/jquery.min.js"></script>
<!-- for dropdown -->
<script src = "dropdownresources/jquery.dd.min.js"></script>
<!-- <script>

$('#imagechoices').ddslick({
	 onSelected: function(data){
		 if(data.selectedIndex > 0) {
             $('#image').val(data.selectedData.value);

            //  $('#editcflag').submit();
         }   
	    	
	        alert($('#image').attr('value'));
   
    }   
});

</script> -->
<script language="javascript" type="text/javascript"> 
    $('#imagechoices').ddslick({  
        onSelected: function(data){  
            if(data.selectedIndex > 0) {
                $('#image').attr('readonly', false);
                $('#image').val(data.selectedData.value);
                $('#image').attr('readonly', true);
				$('#image').hide();
               // $('#editcflag').submit();
            }   
        }    
    }); 
</script>
<!-- jQuery UI 1.11.4 -->
<script src="adminlte/plugins/jquery-ui/jquery-ui.min.js">
</script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- ChartJS -->
<script src="adminlte/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="adminlte/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="adminlte/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="adminlte/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="adminlte/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="adminlte/plugins/moment/moment.min.js"></script>
<script src="adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="adminlte/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="adminlte/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="adminlte/dist/js/demo.js"></script>
<!-- <script>
$(document).ready(function(){

    $.ajax({
      url: 'retrieveexpenses.action',
      type: 'get',
      contentType: "application/json; charset=utf-8",
      dataType: 'json',
      success:function(response){
    	$('#expenses').find('tbody').empty();
        var len = response.length;

        $.each(response, function(i, item) {
            $('<tr>').append(
                $('<td>').text(item.category),
                $('<td>').text(item.cost),
                $('<td>').text(item.comment),
                $('<td>').text(item.date),
                $('<td>Edit Delete')
            ).appendTo('#expenses');
           
        });
      }
    });
 
});
</script> -->
<script>
function preventNumbers(e) {
    var keyCode = (e.keyCode ? e.keyCode : e.which);
    if (keyCode > 47 && keyCode < 58) {
        e.preventDefault();
    }
}
</script>
<script>
$(document).ready(function() {
	$.ajax({
		 url : "retrievecategoryoptions.action",
         type:'GET',
         data: {
        	 module : '1'
         },
         dataType: 'json',
         success: function(response) {
             $.each(response,function(i, item)
             {
                 $("#categoriesforexpense").append('<option value=' + item.id + '>' + item.name + '</option>');
             });
          }
	});
	 });
</script>
<script>
$(document).ready(function() {
	$.ajax({
		 url : "retrievecategoryoptions.action",
         type:'GET',
         data: {
        	 module : '2'
         },
         dataType: 'json',
         success: function(response) {
             $.each(response,function(i, item)
             {
                 $("#categoriesforincome").append('<option value=' + item.id + '>' + item.name + '</option>');
             });
          }
	});
	$.ajax({
		 url : "retrievecategoryoptions.action",
        type:'GET',
        data: {
       	 module : '3'
        },
        dataType: 'json',
        success: function(response) {
            $.each(response,function(i, item)
            {
                $("#categoriesforwishes").append('<option value=' + item.id + '>' + item.name + '</option>');
            });
         }
	});
	 });
</script>
<script>
$(document).ready(function() {
	$.ajax({
		 url : "retrievemodules.action",
         type:'GET',
         dataType: 'json',
         success: function(response) {
             $.each(response,function(i, item)
             {
                 $("#modules").append('<option value=' + item.moduleID + '>' + item.name + '</option>');
             });
          }
	});
	 });
</script> 
<script>
$(document).ready(function() {
	$.ajax({
		 url : "expensetoday.action",
         type:'GET',
         dataType: 'json',
         success: function(data) {
          /*    $.each(response,function(data)
             {
            	

                 $("#expense-today").append('<h3>Php' +data.expense+'<h3>');
                 $("#expense-today").append('<p>Spent today</p>');
             }); */
             $("#expense-today").append('<h3>Php ' + data['expense'] + '</h3>');
             $("#expense-today").append('<p>Spent today</p>');

			
             /* for(var i = 0; i < jsonObj.length; i++)
             {
                 alert(jsonObj[i]['expense']);
             } */
           //  var obj = jQuery.parseJSON( data );

             //alert(obj.b);
          }
	});
	$.ajax({
		 url : "monthexpense.action",
        type:'GET',
        dataType: 'json',
        success: function(data) {
         /*    $.each(response,function(data)
            {
           	

                $("#expense-today").append('<h3>Php' +data.expense+'<h3>');
                $("#expense-today").append('<p>Spent today</p>');
            }); */
            $("#expense-month").append('<h3>Php ' + data['monthexpense'] + '</h3>');
            $("#expense-month").append('<p>Spent this month</p>');

			
            /* for(var i = 0; i < jsonObj.length; i++)
            {
                alert(jsonObj[i]['expense']);
            } */
          //  var obj = jQuery.parseJSON( data );

            //alert(obj.b);
         }
	});
	$.ajax({
		 url : "monthlyincome.action",
       type:'GET',
       dataType: 'json',
       success: function(data) {
  
           $("#monthly-income").append('<h3>Php ' + data['monthlyincome'] + '</h3>');
           $("#monthly-income").append('<p>Income this month/p>');

			
          
        }
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

</body>
</html>
