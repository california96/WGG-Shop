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
            <h1 class="m-0 text-dark">Update an Expense</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item active">Edit Expense</li>
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
              <form action = "editexpense.action" method = "post">
              <input type = "hidden" name = "expenseID" value = "${expense.expenseID }">
                <div class="card-body">
                  <div class="form-group col-sm-3">
                    <label for="category">Select Category</label>
                      <select class="form-control" id = "categoriesforexpenseupdate" name = "categoryID" required>
  						<c:forEach items="${categories}" var="elem">
  						<option value = "${elem.id }" ${expense.categoryID == elem.id ? 'selected' : '' }>${elem.name }</option>
  						</c:forEach>
                        </select>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="cost">Cost</label>
                    <input name = "cost"type="number" step = ".01" class="form-control" id="cost" value = "${expense.cost }" required>
                  </div>
                  
                  <div class="form-group col-sm-3">
                  <label>Date:</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="far fa-calendar-alt"></i>
                      </span>
                    </div>
                    <input type="datetime-local" class="form-control float-right" id="date" value = "${expense.date }"  min='2020-01-01' name = "date" required>
                  </div>
                  <!-- /.input group -->
                </div>
                 <div class="form-group">
                    <label>Comment</label>
                     <textarea name = "comment" id = "comment" class="form-control" rows="3">${expense.comment }</textarea>
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