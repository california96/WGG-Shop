<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
body {
    /*font-family: "Lato", sans-serif;*/
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 1120px;
    width: 1080px;
    background-color: #50C878;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
  
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 60%; 
    }

    .sidenav{
        width: 55%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #73C2FB !important;
    color: #fff !important;
}
.btn-log{
  background-color: #73C2FB !important;
    color: #fff;
}
</style>
<%@include file = "header.jsp" %>
<body>

	<div class="sidenav">
         <div class="login-main-text">
            <h2>Application<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action = "login.action" method = "post" id = "login-form">
                  <div class="form-group">
                     <label>Username</label>
                     <input id = "username" type="text" class="form-control" placeholder="User Name" name = "username" required>
                  	<p id = "errormsg"></p>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input id = "password" type="password" class="form-control" placeholder="Password" name = "password" required>
                  </div>
                  <a href = "forgotpassword.jsp">Forgot password</a>
                  <p id = "errormsg"></p>
                  <button type="submit" class="btn btn-black">Login</button>
                 
                
               </form>
               	<div class = "form-group">
                <a href = "register.jsp"><button class="btn btn-secondary">Register</button></a>
                </div>
            </div>
         </div>
      </div>
<!-- jQuery -->
<script src="adminlte/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
 $("#login-form").submit(function(e){
	 e.preventDefault();
	 

	 $.ajax({
		 type: "POST",
		 url: "login.action",
		 data: $(this).serialize(),
		 success: function(data){
			// alert(JSON.stringify(data.msg));
			 if(data.msg === "success"){
				  window.location.href = "index.jsp";
			 }else{
				 $("#errormsg").empty();
				 $("#errormsg").append("<p style='color:red'>Invalid Credentials.</p>");
			 }
		 }
	 })
 });
 </script>
</body>
</html>