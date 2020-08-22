<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WGG Shop Admin | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="adminlte/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="adminlte/plugins/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="adminlte/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>WGG Shop Admin</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">

      <form action="admin-login.action" method="post" id = "login-form">
        <div class="input-group mb-3">
          <input type="name" class="form-control" placeholder="Enter Username" name = "username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user-circle"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Enter Password" name = "password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
    
          <div class="col-12">
            <div class="container-fluid">
            <p id = "errormsg"></p>
            <button type="submit" class="btn btn-primary btn-block" style="background-color: #66a8a6!important; border-color:#66a8a6!important;">Sign In</button>
          </div>
          </div>
      </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
</body>
<!-- jQuery -->
<script src="adminlte/plugins/jquery/jquery.min.js"></script>
<script>

document.title = "Admin - Login";
 $("#login-form").submit(function(e){
	
	 e.preventDefault();
	 

	 $.ajax({
		 type: "POST",
		 url: "admin-login.action",
		 data: $(this).serialize(),
		 success: function(data){
			// alert(JSON.stringify(data.msg));
			 if(data.msg === "success"){
				  window.location.href = "admin";
			 }else{
				 $("#errormsg").empty();
				 $("#errormsg").append("<p style='color:red'>Invalid Credentials.</p>");
			 }
		 }
	 })
 });
 </script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>