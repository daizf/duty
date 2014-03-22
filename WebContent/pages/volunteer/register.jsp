<!DOCTYPE html>
<html lang="en">
  <head>
      <%@ include file="../metrouiHeader.jsp" %>

     <script>

         function submitConfirm(){
        	 var s = '请牢记你的工号：' + $("input[name='volunteer.code']").val() + ',这将做为你的登录凭证！';
        	 return confirm(s);
         }
     </script>
     
  
   <style type="text/css">
	.metro .volunteerinfo:before {
       content: "个人信息";
     }
     .metro .face:before {
       content: "个人头像";
     }
    </style>
    <title>注册新用户</title>
</head>
<body  class="metro" style="padding: 10px;">
    <div class="example face" style="width: 30%;float: left;">
      <img id="personicon" src="${volunteer.iconpath}" onerror="this.src='img/volunteer.png';">
    </div>
    <div id="cameraDialog" style="position:absolute;left:3px;top:260px">
        <%@ include file="../frontend_service/flashcamera.jsp" %>
    </div>
    <div class="example volunteerinfo" style="width: 60%;float: left;margin-left: 40px;">
       <form  id="volunteerForm" action="register.action" method="post" onsubmit="return submitConfirm();">
           <input name="volunteer.iconpath" id="iconpath" type="hidden" value="${volunteer.iconpath}"/>
           <fieldset>
               <legend>志愿者注册</legend>
               <h5 style="color: red;text-align: center;"><s:actionerror/><s:actionmessage/></h5>
               
               <%@ include file="volunteerFields.jsp"%>
               
               <input type="submit" value="注册"/>
               <input type="button" onclick="history.go(-1);" value="取消"/>

               <div style="margin-top: 20px">
               </div>
           </fieldset>
       </form>
    </div>
   
   <footer class="site-footer" style="position:fixed;bottom:1px;width:100%;z-index:-1">
       <div class="text-center">
           2014-01 &copy; 版权所有
       </div>
   </footer>
   <%@ include file="volunteerFieldsValidation.jsp"%>
  </body>
</html>