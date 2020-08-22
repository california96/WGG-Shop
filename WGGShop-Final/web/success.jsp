<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header-admin.jsp" %>
<!------ Include the above in your HEAD tag ---------->
<style>
    .btn-submit{
    background-color: #50c878;
    color: white;
  }
  </style>
<body>
 <div id="success">
        <div class="success">
            <img src="fashe/images/success.png"style="width: 250px; height: 250px;">
            <div class="success-404">

                <h1>Success</h1>
            </div>
            <h2>Your Transaction was a success.</h2>
             <a href = "index" class="login"><button class="btn block btn-submit">Go back to Homepage</button></a>
        </div>
    </div>

</body>
<script>
document.title = "Success";
</script>
</html>