<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../metrouiHeader.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">

   <style type="text/css">
	.metro .volunteerinfo:before {
       content: "个人信息";
     }
    </style>
<!--external css-->
<title>我的注册</title>
</head>
<body class="metro" style="padding-left: 50%;padding-top: 20px;">
   <div class="example volunteerinfo" style="width: 500px;margin-left: -250px;">
    <form>
      <fieldset>
          <legend>个人信息</legend>
          <h5 style="color: red;text-align: center;"><s:actionerror/><s:actionmessage/></h5>
          
          <label>个人照片</label>
          <div class="input-control text" data-role="input-control">
			  <img src="${volunteer.iconpath}" />
		  </div>
          
          <%@ include file="volunteerFields.jsp"%> 
          
          <button type="button" onclick="window.location.href='volunteer/edit.action?id=${volunteer.id}'">修改</button>
          <button type="button" onclick="window.location.href='index.action'">取消</button>
          <div style="margin-top: 20px">
          </div>
      </fieldset>
  </form>
 </div>
 <script type="text/javascript">
 $(document).ready(function() {
     $("form input,select").attr("disabled","disabled");
 });
 </script>
</body>
</html>