<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "navbar.jsp"%>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Add an Expense</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item active">New Expense</li>
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
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Expense Form</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="createexpense.action" method = "post">
                <div class="card-body">
                  <div class="form-group col-sm-3">
                    <label for="category">Select Category</label>
                      <select class="form-control" id = "categoriesforexpense" name = "categoryID" required>
  
                        </select>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="cost">Cost</label>
                    <input type="number" step = ".01" class="form-control" id="cost" name = "cost" required>
                  </div>
                  
                  <div class="form-group col-sm-3">
                  <label>Date:</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="far fa-calendar-alt"></i>
                      </span>
                    </div>
                    <input type="datetime-local" class="form-control float-right" id="date" name = "date"  min='2020-01-01' required>
                  </div>
                  <!-- /.input group -->
                </div>
                 <div class="form-group">
                    <label>Comment</label>
                     <textarea name = "comment" id = "description" class="form-control" rows="3" placeholder="Enter ..."></textarea>
                 </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->

</div>
</div>
<%@include file = "footer.jsp"%>