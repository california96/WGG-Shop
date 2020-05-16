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
            <h1 class="m-0 text-dark">Wishlist</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Wishlist</li>
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
              <h3 class="card-title">Current Wishlist</h3>
            
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class = "col-sm-3">
             <a href = "newwish.jsp"><button type="button" class="btn btn-block btn-primary"><i class="fas fa-pen"></i>New Wish</button></a>
            	</div>
              <table id="expenses" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Category</th>
                  <th>Amount</th>
                  <th>Comment</th>
                  <th>Date Added</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
           		<tbody>
           		<c:forEach items="${wishlist}" var="elem">
           		<tr>
           		
    			<td><c:out value="${elem.category}" /></td>
    			<td><c:out value="${elem.amount }"/></td>
    			<td><c:out value="${elem.comment }"/></td>
    			<td><c:out value="${elem.date }"/></td>
    			<td><c:out value="${elem.status }"/></td>
    			<c:if test="${elem.statusID == 4}">
 				<td>No further action necessary</td>
				
    			
    			</c:if>
    			<c:if test = "${elem.statusID != 4 }">
    			<td><a href = "retrievewish.action?id=${elem.id }"><button type="button" class="btn btn-block btn-primary"><i class="fas fa-pen"></i> Edit</button></a>
    			<a href = "deletewish.action?id=${elem.id }"onclick = 'return confirm("Confirm Deletion")'><button type="button" class="btn btn-block btn-danger">Delete</button></a>
    			</td>
    			</c:if>
    			</tr>
				</c:forEach>
           		</tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          
<%@include file = "footer.jsp"%>