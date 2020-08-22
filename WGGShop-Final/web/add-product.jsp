<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
    .btn-submit{
    background-color: #66a8a6;
    color: white;
    float: right;
  }
  </style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Add a Product</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index-admin.jsp">Home</a></li>
              <li class="breadcrumb-item active">Add a Product</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Product Form</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action = "createproduct.action" method = "post" enctype="multipart/form-data" autocomplete = "off">
                <div class="card-body">
                  <div class="form-group col-sm-3">
                    <label for="category">Product Name</label>
                       <input type="text" name = "name" class="form-control" id="inputName" placeholder="Name">
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="price">Price</label>
                    <input name = "price"type="number" step = ".01" class="form-control" id="cost" min = "0" required>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="price">Quantity</label>
                    <input name = "quantity"type="number" class="form-control" id="quantity" min = "0" required>
                  </div>
                   <div class="form-group col-sm-6">
                    <label>Description</label>
                     <textarea name = "description" id = "description" class="form-control" rows="3" required></textarea>
                 </div>
                 <div class = "form-group col-sm-3">
                <label for = "file">Upload Product Picture</label>
                    <input type = "file" name = "file">
                  </div>
                  
                  <div class="form-group col-sm-3">
                  <label>Category</label>
                  <div class="input-group">
                 <select class="form-control" id = "category" name = "category" required>
                 	<option selected disabled>Select a category</option>
  					<option value = "clothing">Clothing</option>
  					<option value = "accessories">Accessories</option>
  					<option value = "sports">Sports & Lifestyle</option>
  					
                 </select>
           		 </div>
                  <!-- /.input group -->
                </div>
                 
                  <div class="form-group col-sm-3">
                  <label>SubCategory</label>
                  <div class="input-group">
                 <select class="form-control" id = "subcategory" name = "subcategory" required>
            <option selected disabled>Select a subcategory</option>
  					<option value = "men">Men</option>
  					<option value = "women">Women</option>
  					<option value = "unisex">Unisex</option>
                 </select>
           		 </div>
                  <!-- /.input group -->
                </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-submit">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->

</div>
</div>
<script>
document.title = "WGG SHOP - Add a Product";

</script>
<%@include file = "footer-admin.jsp" %>