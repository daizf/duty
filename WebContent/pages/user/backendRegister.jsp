<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../commonHeader.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="dynamic manager technique">
    <meta name="author" content="LiLimin,GuDong,WangRonghua">
    <meta name="keyword" content="dynamicform,template">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>志愿者后台注册</title>

    <!-- Bootstrap core CSS -->
    <link href="jslib/flatlab/css/bootstrap.min.css" rel="stylesheet">
    <link href="jslib/flatlab/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="jslib/flatlab/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="jslib/flatlab/css/style.css" rel="stylesheet">
    <link href="jslib/flatlab/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="jslib/flatlab/js/html5shiv.js"></script>
    <script src="jslib/flatlab/js/respond.min.js"></script>
    <![endif]-->
</head>

  <body class="login-body">
    <div class="container">
      <form id="registerForm" class="form-signin" action="backend/register.action" method="post">
        <h2 class="form-signin-heading">后台注册</h2>
        <h5 style="color: red;text-align: center;"><s:actionerror/><s:actionmessage/></h5>
        <div class="login-wrap">
            <input type="text" name="user.name" class="form-control" placeholder="用户名" autofocus required="required">
            <input type="password" id="password" name="user.password" class="form-control" placeholder="密码" required="required">
            <input type="password" name="confirm_password" class="form-control" placeholder="再次输入密码" required="required">
            <button class="btn btn-lg btn-login btn-block" type="submit">注册</button>
        </div> 
      </form>
    </div> 
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="jslib/flatlab/js/jquery.js"></script>
    <script src="jslib/flatlab/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="jslib/flatlab/js/jquery.validate.min.js"></script>

    <script type="text/javascript">
    //please refer to form-validation-script.js
    $(document).ready(function() {
        $("#registerForm").validate({
            rules: {
                confirm_password: {
                    equalTo: "#password"
                }
            },
            messages: {
                'user.name': {
                    required: "请输入用户名"
                },
                'user.password': {
                    required: "请输入密码"
                },
                confirm_password: {
                    required: "请再次输入密码",
                    equalTo: "两次输入密码不一致"
                },
            }
        }); 
    });
    </script>
  </body>
</html>