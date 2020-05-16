<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "navbar.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Dashboard</h1>             
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<section class="content">
<div class="container-fluid">
<div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner" id = "expense-today">
               
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-dangers">
              <div class="inner" id = "expense-month">
               
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner" id = "monthly-income">
               
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner" id = "wishlist-total">
               
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
      <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-7 connectedSortable">

            <!-- TO DO List -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Transaction Activities</h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
               <div class="timeline" id = "transaction-history">
              <!-- /.timeline-label -->
              <!-- timeline item -->
              <!-- <div>
                <i class="fas"><img src="resources/images/coffee-category.png"style="margin-left: -5px;"></i>
                <div class="timeline-item">
                  <h3 class="timeline-header"><a href="#" class="activities">John Doe</a> had a <a href="#"class="activities">Starbucks Coffee</a> worth<a href="#" class="activities"> ₱180.00</a></h3>

                  <div class="timeline-body">
                    <span><i class="fas fa-clock" style="color: #999;"></i> 2 hrs ago</span>
                  </div>
                </div>
              </div> -->
              
              </div>
            </div>
          </div>
              <!-- END timeline item -->
              <!-- timeline item -->
               <!-- /.timeline-label -->
              <!-- timeline item -->
            <!-- /.card -->

          </section>

          <!-- /.Left col -->
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          <section class="col-lg-5 connectedSortable">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Top 5 Categories with biggest expense:</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="products-list product-list-in-card pl-2 pr-2" id = "top-categories">
                  <!-- li class="item">
                    <div class="product-img">
                      <img src="resources/images/coffee-category.png" alt="Product Image" class="img-size-50">
                    </div>
                    <div class="product-info" style="margin-top: 15px;">
                      <a href="#" class="activities">Coffee</a>
                        <a class="product-price" href="#"><span class="float-right">$1800</span></a>
                    </div>
                  </li>
                  /.item
                  <li class="item">
                   <div class="product-img">
                      <img src="resources/images/coffee-category.png" alt="Product Image" class="img-size-50">
                    </div>
                    <div class="product-info" style="margin-top: 15px;">
                      <a href="#" class="activities">Coffee</a>
                        <a class="product-price" href="#"><span class="float-right">$1800</span></a>
                    </div>
                  </li>
                  /.item
                  <li class="item">
                   <div class="product-img">
                      <img src="resources/images/coffee-category.png" alt="Product Image" class="img-size-50">
                    </div>
                    <div class="product-info" style="margin-top: 15px;">
                      <a href="#" class="activities">Coffee</a>
                        <a class="product-price" href="#"><span class="float-right">$1800</span></a>
                    </div>
                  </li>
                  /.item
                  <li class="item">
                    <div class="product-img">
                      <img src="resources/images/coffee-category.png" alt="Product Image" class="img-size-50">
                    </div>
                    <div class="product-info" style="margin-top: 15px;">
                      <a href="#" class="activities">Coffee</a>
                        <a class="product-price" href="#"><span class="float-right">$1800</span></a>
                    </div>
                  </li>

                  <li class="item">
                    <div class="product-img">
                      <img src="resources/images/coffee-category.png" alt="Product Image" class="img-size-50">
                    </div>
                    <div class="product-info" style="margin-top: 15px;">
                      <a href="#" class="activities">Coffee</a>
                        <a class="product-price" href="#"><span class="float-right">$1800</span></a>
                    </div>
                  </li> -->
                  <!-- /.item -->
                </ul>
              </div>
              <!-- /.card-footer -->
            </div>

            <!-- solid sales graph -->
             <div class="card">
              <div class="card-header">
                <h3 class="card-title">My Wishlist</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="products-list product-list-in-card pl-2 pr-2">
                  <li class="item">
                    <div class="progress-group" style="padding-left: 12px;padding-right: 12px;">
                      Mobile Phone
                      <span class="float-right"><b>₱13,000</b>/₱20,000</span>
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-primary" style="width: 80%;background-color: #73C2FB!important;"></div>
                      </div>
                    </div>
                  </li>
                  <!-- /.item -->
                  <li class="item">
                    <div class="progress-group" style="padding-left: 12px;padding-right: 12px;">
                      Mobile Phone
                      <span class="float-right"><b>₱13,000</b>/₱20,000</span>
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-primary" style="width: 80%;background-color: #73C2FB!important;"></div>
                      </div>
                    </div>
                  </li>
                  <!-- /.item -->
                  <li class="item">
                    <div class="progress-group" style="padding-left: 12px;padding-right: 12px;">
                      Mobile Phone
                      <span class="float-right"><b>₱13,000</b>/₱20,000</span>
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-primary" style="width: 80%;background-color: #73C2FB!important;"></div>
                      </div>
                    </div>
                  </li>
                  <!-- /.item -->
                  <li class="item">
                    <div class="progress-group" style="padding-left: 12px;padding-right: 12px;">
                      Mobile Phone
                      <span class="float-right"><b>₱13,000</b>/₱20,000</span>
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-primary" style="width: 80%;background-color: #73C2FB!important;"></div>
                      </div>
                    </div>
                  </li>
                  <!-- /.item -->
                 <li class="item">
                    <div class="progress-group" style="padding-left: 12px;padding-right: 12px;">
                      Mobile Phone
                      <span class="float-right"><b>₱13,000</b>/₱20,000</span>
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-primary" style="width: 80%;background-color: #73C2FB!important;"></div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
              <!-- /.card-footer -->
            </div>

            </div>
            <!-- /.card -->
          </section>
          <!-- right col -->
        </div>
<%@include file = "footer.jsp" %>