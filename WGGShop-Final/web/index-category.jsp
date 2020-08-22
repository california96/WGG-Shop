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
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Categories</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index-admin.jsp">Home</a></li>
              <li class="breadcrumb-item active">Categories</li>
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
              <h3 class="card-title">List of Categories</h3>
            
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row" style="padding-bottom: 10px;">
             <a href = "add-category.jsp"style="padding-right: 5px; padding-bottom: 10px; padding-left: 5px;"><button type="button" class="btn btn-block btn-new" style="width:auto;height: auto;"><i class="fas fa-plus" style="padding-right: 5px;"></i>Add a Category</button></a>
           </div>
             <table id="expenses" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Date Added</th>
                  <th>Action</th>
                </tr>
              <tbody>
              <tr>
              
          <td>Sample</td>
          <td>Sample</td>
          <td>Sample</td>
          <td><div class="row" style="justify-content: center;"><a href = "edit-category.jsp"><button type="button" class="btn btn-block btn-edit"><i class="fas fa-pen"></i> Edit</button></a>
          <a href = "#"onclick = 'return confirm("Confirm Deletion")' style="padding-left: 5px;"><button type="button" class="btn btn-block btn-delete"><i class="fas fa-trash"></i>Delete</button></a></div>
          </td>
          </tr>
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