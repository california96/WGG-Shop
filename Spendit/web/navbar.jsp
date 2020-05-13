<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "header.jsp" %>
 <%  
     if (session.getAttribute("user") == null) {  
        response.sendRedirect("login.jsp");
     }
  %>
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
    

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <!-- <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div> -->
      </div>
    </form>
	
    <!-- Right navbar links -->
<ul class="navbar-nav ml-auto">
     
      
      <li class="nav-item">
       	<form action = "signout.action" method = "post">
		<button type="submit" class="btn btn-default float-right">Sign Out</button>       	
		</form>
        
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-lime elevation-4">
    <!-- Brand Logo -->
    <a href="index.jsp" class="brand-link">
      <img src="adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      
        <div class="info">
   		<img src = "retrieveimage.action?module=profile&fileName=${sessionScope.user.image }"/>
          <a href="#" class="d-block">${sessionScope.user.firstName} ${sessionScope.user.lastName }</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         
        
              <li class="nav-item">
                <a href="index.jsp" class="nav-link">
                  <i class="fas fa-chart-bar"></i>
                  <p>Dashboard</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="retrieveexpenses.action" class="nav-link">
                  <i class="fas fa-calculator"></i>
                  <p>Expenses</p>
                </a>
              </li>
              <li class = "nav-item">
              	<a href = "retrieveallincome.action" class = "nav-link">
              		<i class="fas fa-dollar-sign"></i>
              		<p>Income</p>
              	</a>
              </li>
              <li class="nav-item">
                <a href="retrievewishlist.action" class="nav-link">
					<i class="fas fa-clipboard-list"></i>                  
					<p>My Wishlist</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="categoryindex.action" class="nav-link">
                  <i class="fas fa-list"></i>
                  <p>Categories</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="accountsettings.jsp" class="nav-link">
                  <i class="fas fa-cog"></i>
                  <p>Account Settings</p>
                </a>
              </li>
            
              
            </ul>
         
          
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
