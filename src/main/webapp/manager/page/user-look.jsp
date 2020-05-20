<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .layui-form-item .layui-input-company {width: auto;padding-right: 10px;line-height: 38px;}
    .layui-form-label{ font-size: 17px}
</style>
<body>
<div class="layuimini-container layui-anim layui-anim-upbit">
    <div class="layuimini-main" style="text-align: center;">
    	<h1 style="margin: 0 auto; padding-bottom: 20px" >==========>欢迎进入信息界面<==========</h1>
        <div class="layui-form-item" style="width:400px;margin: 0 auto;" >
        	<div class="layui-form-item" >
                <label class="layui-form-label required">用户名 :</label>
                <div class="layui-input-block">
                    <input type="text" name="userName" value="${sessionScope.user.getUserName()}"disabled="disabled" class="layui-input " style="width:240px;text-align: center;border: 0px">
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label required">用户密码:</label>
                <div class="layui-input-block">
                    <input type="text" name="userPass" value="${sessionScope.user.getUserPass()}"disabled="disabled" class="layui-input " style="width:240px ;text-align: center ;border: 0px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">用户电话 :</label>
                <div class="layui-input-block">
                    <input type="number" name="phone" value="${sessionScope.user.getPhone()}"disabled="disabled"class="layui-input " style="width:240px ;text-align: center;border: 0px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">用户邮箱 :</label>
                <div class="layui-input-block">
                    <input type="email" name="new_password"  value="${sessionScope.user.getEmail()}"disabled="disabled" class="layui-input"  style="width:240px;text-align: center;border: 0px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">注册时间 :</label>
                <div class="layui-input-block">
                    <input type="text" name="frist_time" value="${sessionScope.user.getFrist_time()}"disabled="disabled" class="layui-input" style="width:240px;text-align: center;border: 0px">
                </div>
            </div>


        </div>
    </div>
</div>

<script>
    layui.use(['form','layuimini'], function () {
        var form = layui.form,
            layer = layui.layer,
            layuimini = layui.layuimini,
        	$ = layui.jquery;
        form.render();
        //var tep = ;
        //判断密码是否重复
        form.verify({
        	old_password:function(value){
        		if(value!= '${sessionScope.user.getUserPass()}'){
        			return '密码错误！';
        		}
        	},
        	again_password:function(value){
        	   if($('input[name=new_password]').val() !== value)
        	  		return '两次密码输入不一致！';
        	}
    	  
    	});
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var index = layer.alert("是否确定修改！！！", {
                title: '提示信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'UserAction?method=updatePass&userName=${sessionScope.userName}',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
         			 if(res.code == 0){
         				parent.layer.msg('添加成功,正在重新登录中',{icon:6,time:2000});
         			 }
         		  }
            	});
            	window.location ="login.jsp";
                layer.close(index);
                layuimini.refresh();
            });
            return false;
        });

    });
</script>
</body>
</html>