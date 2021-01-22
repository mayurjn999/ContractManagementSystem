<html>

<head>
<title>Login Page</title>
<link href="Styling.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Contract<br> Management<br> System<br></h2>
            <p>Login from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div>
               <img class="contract-logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3IWsfmY10zLw_7uVSt-Ttl1Em_CKU9_J20A&usqp=CAU" alt="contract logo">
            </div>
            <div class="login-form">
               <form action="SaveLoginServlet" method="post">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" name="uname"
                     class="form-control" placeholder="User Name" >
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="password"
                     class="form-control" placeholder="Password" >
                  </div>
                  <button type="submit" class="btn btn-black" style="margin-left:120px;">Login</button>
                 
               </form>
            </div>
         </div>
      </div>
</html>