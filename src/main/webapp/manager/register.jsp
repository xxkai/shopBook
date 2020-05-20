<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<style>
    .layui-form-item .layui-input-company {width: auto;padding-right: 10px;line-height: 38px;}
    .layui-form-label{ font-size: 17px}
</style>
<head>
    <meta charset="UTF-8">
    <title>信息注册界面</title>
   	<link rel="stylesheet" href="${ctx}/manager/lib/layui-v2.5.5/css/layui.css">
	<link rel="stylesheet" href="${ctx}/manager/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/layuimini.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/public.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
   <style>
        .admin-header {text-align:center;margin-bottom:20px;color:#ff7600;font-weight:bold;font-size:40px}
       
        body {background: #009688;}
      
       

    </style>
</head>
<body>
<div class="layuimini-main" style="width: 600px; margin: 40px auto;" >
    <div class="layui-form layuimini-form" style="margin-top: 30px">
    	<div class="admin-header">
            <span>图书商城注册</span>
        </div>
        <div class="layui-form-item">
        	 <input type="hidden" name="userId"  value="${user.userId}" class="layui-input"> 
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" style="width: 380px;"  lay-verify="required|userName" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="userPass" style="width: 380px;" lay-verify="required|userPass" lay-reqtext="密码不能为空" placeholder="请输入密码" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label">手机</label>
            <div class="layui-input-block">
                <input type="number" name="phone" style="width: 380px;" lay-verify="required|phone" lay-reqtext="手机不能为空" placeholder="请输入手机" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" style="width: 380px;" placeholder="请输入邮箱"  lay-verify="required|email" lay-reqtext="邮箱不能为空" value=""  class="layui-input">
            </div>
        </div>
        <div>
          <div class="layui-input-block" style="margin-bottom: 50px">
                <a href="login.jsp"  class="layui-btn layui-btn-warm" style="margin: 0 50px;"><i class="layui-icon">&#xe65c;</i> 返回登录</a>
             	<button  class="layui-btn " style="margin: 0 40px;" lay-submit lay-filter="saveBtn"><i class="layui-icon">&#xe608;</i> 确认注册</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/manager/js/area.js"></script>
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>

<script src="lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var form = layui.form,
            layer = layui.layer,
            table = layui.table,
       		 $ = layui.jquery;
        var message = '';

        /**
         * 初始化表单，要加上，不然刷新部分组件可能会不加载
         */
        form.render();

        // 当前弹出层，防止ID被覆盖
        var parentIndex = layer.index;
        //监听提交
        var message = '';
       	form.verify({
       		userName: function(value){	
       		//	var datas={userName: value};
       			$.ajax({
          		  type:'post',
          		  async: false, 
          		  url:'UserAction?method=judgeName',
          		  data:{"userName":value},
          		  dataType:'json',
          		  success:function (res){
          			  if(res.data.result =='yes'){
          				message = '用户重复了，请重新输入不重复的用户名';
          			  }else if(res.data.result=='no'){
          				  message = '';
          			  }
          		  }
       			});
       			if(message != ''){
       				return message;
       			}
       			if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
       				return '用户名不能有特殊字符';
       			}
       			if(/(^\_)|(\__)|(\_+$)/.test(value)){
       				return '用户名首尾不能出现下划线\'_\'';
       			}
       			if(/^\d+\d+\d$/.test(value)){
       				return '用户名不能全为数字';
       			} 
       		},
       		userPass: function(value){if(value.length < 6){return '内容请输入至少6个字符';}
            }
           ,phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字,且要输入正确的号码！']
            ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
		});
        form.on('submit(saveBtn)', function (data) {
            	$.ajax({
          		  type:'post',
          		  url:'${ctx}/manager/UserAction?method=insert',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
         			 if(res.code == 0){
         				parent.layer.msg('注册成功',{icon:6,time:2000});
         			 }
         			 else {

                     }
         		  }
                });
            	layer.msg('返回登陆界面', function () {
                    window.location = "login.jsp";
              
           		 });
            return false;
        });
       
   });
</script>
</body>
</html>