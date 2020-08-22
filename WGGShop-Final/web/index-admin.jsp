<%@page import="utility.CookieHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file = "navbar-admin.jsp" %>
<style>
  .btn-new{
    background-color: #66a8a6;
    color: white;
  }
  .btn-generate{
    background-color: #DAA2EB;
    color: white;
  }
  .btn-edit{
    background-color: #2ca7ff;
    color: white;
  }
  .btn-delete{
    background-color: #fd5565;
    color: white;
  }
  </style>
  <%
  if((CookieHelper.getCookie(request.getCookies(), "user") == null) ) {
  		response.sendRedirect("login.jsp");
  	}
  %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Products</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index-admin.jsp">Home</a></li>
              <li class="breadcrumb-item active">Products</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">List of Products</h3>
            
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row" style="padding-bottom: 10px;">
             <a href = "add-product.jsp"style="padding-right: 5px; padding-bottom: 10px; padding-left: 5px;"><button type="button" class="btn btn-block btn-new" style="width:auto;height: auto;"><i class="fas fa-plus" style="padding-right: 5px;"></i>Add a Product</button></a>
           </div>
             <table id="expenses" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Category</th>
                  <th>SubCategory</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th>Image</th>
                  <th>Action</th>
                </tr>
              <tbody>
          <c:forEach items = "${products }" var = "elem">
              <tr>
              
          <td><c:out value="${elem.name}" /></td>
          <td><c:out value="${elem.description }"/></td>
          <td><c:out value="${elem.category.name }"/></td>
          <td><c:out value="${elem.subcategory.name }"/></td>
          <td><c:out value="${elem.price}" /></td>
          <td><c:out value="${elem.quantity}" /></td>
          <td><img style="width: 100px;"src = "retrieveimage.action?fileName=<c:out value ="${elem.image }"/>"></td>
          <td><div class="row" style="justify-content: center;"><a href = "retrieveproductforedit.action?id=${elem.productID }"><button type="button" class="btn btn-block btn-edit"><i class="fas fa-pen"></i> Edit</button></a>
          <a href = "deleteproduct.action?id=${elem.productID }"onclick = 'return confirm("Confirm Deletion")' style="padding-left: 5px;"><button type="button" class="btn btn-block btn-delete"><i class="fas fa-trash"></i>Delete</button></a></div>
          </td>
          </tr>
          
          </c:forEach>
              </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- /.control-sidebar -->
</div>
<script>
document.title = "WGG SHOP - Products";

</script>
<%@include file = "footer-admin.jsp" %>