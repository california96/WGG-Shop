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
            <h1 class="m-0 text-dark">Update Product</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index-admin.jsp">Home</a></li>
              <li class="breadcrumb-item active">Update Product</li>
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
              <form action = "updateproduct.action" method = "post" enctype = "multipart/form-data" autocomplete = "pff">
              <input type = "hidden" name = "productID" value = "${product.productID}">
                <div class="card-body">
                  <div class="form-group col-sm-3">
                    <label for="category">Product Name</label>
                       <input type="text" class="form-control" name = "name" id="name" value = "${product.name }" required>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="cost">Cost</label>
                    <input name = "price" type="number" step = ".01" class="form-control" id="price" value = "${product.price }" min = "1" required>
                  </div>
                   <div class="form-group col-sm-3">
                    <label for="price">Quantity</label>
                    <input name = "quantity"type="number" class="form-control" id="quantity" min = "0" value = "${product.quantity }"required>
                  </div>
                   <div class="form-group col-sm-3">
                    <label for="cost">Category</label>
                    <select name = "category">
                    	<option value = "clothing"  ${product.category.name == "Clothing"  ? 'selected' : '' }>Clothing</option>
                    	<option value = "accessories" ${product.category.name == "Accessories"  ? 'selected' : '' }>Accessories</option>
                    	<option value = "sports" ${product.category.name == "Sports & Lifestyle"  ? 'selected' : '' }>Sports & Lifestyle</option>
                    	
                    </select>
                  </div>
                    <div class="form-group col-sm-3">
                    <label for="cost">Subcategory</label>
                    <select name = "subcategory">
                    	<option value = "men" ${product.subcategory.name == "Men"  ? 'selected' : '' }>Men</option>
                    	<option value = "women" ${product.subcategory.name == "Women"  ? 'selected' : '' }>Women</option>
                    	<option value = "unisex" ${product.subcategory.name == "Unisex"  ? 'selected' : '' }>Unisex</option>
                    	
                    </select>
                  </div>
                   <div class="form-group col-sm-6">
                    <label>Description</label>
                     <textarea name = "description" id = "description" class="form-control" rows="3" required>${product.description }</textarea>
                 </div>
                 <div class = "form-group col-sm-3">
                <label for = "file">Upload Product Picture</label>
                    <input type = "file" name = "file">
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
document.title = "WGG SHOP - Update Product";

</script>
<%@include file = "footer-admin.jsp" %>