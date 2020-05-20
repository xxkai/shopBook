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
</style>
<body>
<div class="layuimini-container layui-anim layui-anim-upbit">
    <div class="layuimini-main">

        <div class="layui-form layuimini-form">
            <div class="layui-form-item">
                <label class="layui-form-label required">旧的密码</label>
                <div class="layui-input-block">
                    <input type="password" name="old_password" lay-verify="required|old_password" lay-reqtext="旧的密码不能为空" placeholder="请输入旧的密码"  value="" class="layui-input">
                    <tip>填写自己账号的旧的密码。</tip>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label required">新的密码</label>
                <div class="layui-input-block">
                    <input type="password" name="new_password" lay-verify="required|new_password" lay-reqtext="新的密码不能为空" placeholder="请输入新的密码"  value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">新的密码</label>
                <div class="layui-input-block">
                    <input type="password" name="again_password" lay-verify="required|again_password" lay-reqtext="新的密码不能为空" placeholder="请输入新的密码"  value="" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
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
          		  url:'UserAction?method=updatePass&userName=${sessionScope.user.getUserName()}',
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