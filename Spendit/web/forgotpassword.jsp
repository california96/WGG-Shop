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
            <h2>Forgot<br>Password</h2>
            <p>Enter your email, and we will email you your password if you have an account.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action = "processpassword.action" method = "post" id = "password-request">
                  <div class="form-group">
                     <label>Email</label>
                     <input id = "email" type="email" class="form-control" placeholder="Email Address" name = "email" required>
                  	<p id = "errormsg"></p>
                  </div>
                  
                
                  <button type="submit" class="btn btn-black">Send Request</button>
                 
                
               </form>
              
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