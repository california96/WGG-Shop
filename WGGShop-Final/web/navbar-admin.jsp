<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "header-admin.jsp" %>
<style>
  p.contents {
  color:#FFFFFF;
}

p.error-msg {
   margin-top: 5px;
   margin-bottom: -20px;
}
i.icons{
  color:white;
}

aside.color{
  background-color: #212529
}

a.contents{
   color:#FFFFFF;
}

img.avatar {
  /***vertical-align: middle;
  width: 50px;
  height: 50px;**/
  border-radius: 50%;
}

img.avatar-icon {
  /***vertical-align: middle;
  width: 50px;
  height: 50px;**/
  border-radius: 50%;
  width: 20px;
  height: 20px;
}
a.hover{
  background-color: #3BA960;
}
a.color{
  border-bottom: 1px solid #4b545c00;
    color: rgba(255,255,255,.8);
}
a.activities{
  color:black;
}
a.product-price{
  color:#FF6B7F;
  font-weight: bold;
}
i.icon{
  background-image: url(resources/images/coffee-category.png);
}
img.logo{
  width: 30%;
  height: auto;
}
span.logo-text{
   font-family: sans-serif;
   font-size: 24px;
   font-weight: bold;
   color: white;
}


</style>
<body class="hold-transition sidebar-mini layout-fixed">
<div class = "wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
     
    </ul>
    
	
    <!-- Right navbar links -->
<ul class="navbar-nav ml-auto">

      <li class="nav-item dropdown user-menu">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
         <img src = "user-avatar.png" class="img-circle elevation-2 avatar-icon" alt="User Image"/>
        </a>
        <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <!-- User image -->
          <li class="user-header bg-primary" style="background-color:#66a8a6!important; ">
            <img src = "user-avatar.png" class="img-circle elevation-2 avatar" alt="User Image"/>
          </li>
          <!-- Menu Footer-->
          <li class="user-footer">
              <form action = "logout.action" method = "post" style="padding-right: 90px;">
                 <button type="submit" class="btn btn-default float-right">Sign Out</button>         
              </form>
          </li>
        </ul>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-lime elevation-4 color">
    <!-- Brand Logo -->
    <a href="index-admin.jsp" class="brand-link " style="border-bottom: 1px solid #FFFFFF;
    color: rgba(255,255,255,.8);">
      <span class="brand-text font-weight-light logo-text">WGG SHOP ADMIN</span>
      <!---<span class="brand-text font-weight-light" style="color:white;">AdminLTE 3</span> --->
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         
        
              <li class="nav-item">
                <a href="admin" class="nav-link">
                  <i class="fas fa-shopping-bag icons"></i>
                  <p class="contents">Products</p>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a href="index-category.jsp" class="nav-link">
                  <i class="fas fa-tags icons"></i>
                  <p class="contents">Categories</p>
                </a>
              </li> -->
            </ul>
         
          
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>