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
            <h1 class="m-0 text-dark">Add Category</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index-admin.jsp">Home</a></li>
              <li class="breadcrumb-item active">Add Category</li>
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
                <h3 class="card-title">Category Form</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action = "editexpense.action" method = "post">
              <input type = "hidden" name = "expenseID" value = "${expense.expenseID }">
                <div class="card-body">
                  <div class="form-group col-sm-3">
                    <label for="category">Category Name</label>
                       <input type="name" class="form-control" id="inputName" placeholder="Name">
                  </div>
                   <div class="form-group col-sm-6">
                    <label>Description</label>
                     <textarea name = "description" id = "description" class="form-control" rows="3" required></textarea>
                 </div>
                  <div class="form-group col-sm-3">
                  <label>Date</label>
                  <div class="input-group">
                    <div class="input-group date" id="datetimepicker1" data-target-input="nearest">            
                    <input type="text" class="form-control datetimepicker-input" id="date" name = "date" value = "${startFormat}">
                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
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
document.title = "WGG SHOP - Add Category";

</script>
<%@include file = "footer-admin.jsp" %>