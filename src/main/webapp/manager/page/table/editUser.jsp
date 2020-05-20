<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ctx}/manager/lib/layui-v2.5.5/css/layui.css">
<link rel="stylesheet" href="${ctx}/manager/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/layuimini.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/public.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
   
<title>Insert title here</title>
</head>
<body>
<div class="layuimini-main">
    <div class="layui-form layuimini-form">
        <div class="layui-form-item">
        	 <input type="hidden" name="userId"  value="${user.userId}" class="layui-input"> 
            <label class="layui-form-label required">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" lay-verify="required|userName" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="${user.userName}" class="layui-input">
                <tip>填写自己管理账号的名称。</tip>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">密码</label>
            <div class="layui-input-block">
                <input type="text" name="userPass" lay-verify="required|userPass" lay-reqtext="密码不能为空" placeholder="请输入密码" value="${user.userPass}" class="layui-input">
                <tip>填写自己管理账号的密码。</tip>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">是否是管理员</label>
            <div class="layui-input-block">
                <input type="radio" name="noAdmin" value="1" title="是" ${user.noAdmin==1?'checked':''} >
                <input type="radio" name="noAdmin" value="0" title="否" ${user.noAdmin==0?'checked':''}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">手机</label>
            <div class="layui-input-block">
                <input type="number" name="phone" lay-verify="required|phone" lay-reqtext="手机不能为空" placeholder="请输入手机" value="${user.phone}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" placeholder="请输入邮箱"  lay-verify="required|email" lay-reqtext="邮箱不能为空" value="${user.email}"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/manager/js/area.js"></script>
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
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
        
       	form.verify({
       		userName: function(value){
       			$.post('${ctx}/manager/UserAction?method=judgeName',{userName: value},function(data,status){
       	       		if(data == 'no'&&value != '${user.userName}'){
       	       			message = '用户重复了，请重新输入不重复的用户名';
       	       		}else{
       	       			message = '';
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
       		userPass: function(value){
       			if(value.length < 6){
       				return '内容请输入至少6个字符';
       			}
       			if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
       				return '密码不能有特殊字符';
       			}
       			if(/^\d+\d+\d$/.test(value)){
       				return '密码不能全为数字';
       			}
            }
           ,phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字,且要输入正确的号码！']
            ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
		});
        form.on('submit(saveBtn)', function (data) {
            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'${ctx}/manager/UserAction?method=insert',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
          			 if(res.code == 0){
          			parent.layer.msg('修改成功',{icon:6,time:2000});
          			 }
          		  }  
          	  });
                // 关闭弹出层
            	var index = parent.layer.getFrameIndex(window.name);  
         	    parent.layer.close(index);
         	    window.parent.location.reload();

            });


            return false;
        });

    });
</script>
</body>
</html>