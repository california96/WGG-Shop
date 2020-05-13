<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file = "navbar.jsp"%>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Account Settings</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Account Settings</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Account Settings</h3>
            </div>
            <!-- /.card-header -->
          </div>
          <div class = "card">
          	<div class = "card-header">
          		<h3 class="card-title">User Profile</h3>
          	</div>
          	<div class = "card-body">
          		<img src = "retrieveimage.action?module=profile&fileName=${sessionScope.user.image }"/>
          		<form>
          			<div class = "form-group">
          			<label for = "firstname">First Name</label>
          			<input type = "text" name = "firstname" class = "form-control" value = "${sessionScope.user.firstName }">
          			</div>
          			<div class = "form-group">
          			<label for = "lastname">Last Name</label>
          			<input type = "text" name = "lastname" class = "form-control" value = "${sessionScope.user.lastName }">
          			</div>
          			<div class = "form-group">
          			<label for = "username">User Name</label>
          			<input type = "text" name = "username" class = "form-control" value = "${sessionScope.user.userName }">
          			</div>
          			<div class = "form-group">
          			<label for = "firstname">Email</label>
          			<input type = "email" name = "email" class = "form-control" value = "${sessionScope.user.email }">
          			</div>
          		</form>
          	</div>
          </div>
          
<%@include file = "footer.jsp"%>