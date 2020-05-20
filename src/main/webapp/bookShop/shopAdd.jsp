<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
</head>
 	<link rel="stylesheet" href="${ctx}/manager/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/layuimini.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/public.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">  
<body>
<div class="layuimini-main">
    <div class="layui-form layuimini-form">
    <div class="layui-form-item">
            <label class="layui-form-label required" >用户名</label>
            <div class="layui-input-block">
            	<input type="hidden" name="userId" disabled required lay-verify="required" style="width: 249px"  value="${sessionScope.user.getUserId()}" class="layui-input">
                <input type="text" name="userName" disabled required lay-verify="required" style="width: 249px"  value="${sessionScope.user.getUserName()}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">书籍名</label>
            <div class="layui-input-block">
            	<input type="hidden" name ="bookId" value="${book.bookId}"/>
                <input type="text" name="bookName" disabled required lay-verify="required" style="width: 249px"  value="${book.title}" class="layui-input">
                <tip></tip>
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label required">数量</label>
            <div class="layui-input-block">
                <input type="text" name="orderNum" disabled required lay-verify="required" style="width: 249px" value="${num}" class="layui-input">
                <tip></tip>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">收件人姓名</label>
            <div class="layui-input-block">
                <input type="text" name="orderName" required lay-verify="required|orderName" style="width: 249px" lay-reqtext="收件人不能为空" placeholder="请输入收件人" value="" class="layui-input">
                <tip>填写收件人姓名。</tip>
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label required">详细地址</label>
            <div class="layui-input-block">
                <input type="text" name="orderAddr" required lay-verify="required|orderAddr" style="width: 249px" lay-reqtext="用户名不能为空" placeholder="请正确书写地址" value="" class="layui-input">
                <tip>填写详细地址。</tip>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="saveBtn">确认支付</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/manager/js/area.js"></script>
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script type="text/javascript">
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
       	});
        form.on('submit(saveBtn)', function (data) {
            var index = layer.alert("真的购买吗？", {
                title: '最终的提交信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'ShoppingUserAction?method=insertOrder',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
          			  if(res.code==0){
          				parent.layer.msg('购买成功',{icon:6,time:2000});
          			  }
          		  }  	  
          	  });
            	 var index = parent.layer.getFrameIndex(window.name);
            	    parent.layer.close(index);
            	  //  parent.location.href：
            	   	window.parent.location.href="${ctx}/ShoppingUserAction?method=firstBooks1";
                // 关闭弹出层
               // layer.close(index);
               // layer.close(parentIndex);

            });
            return false;
        });

    });
</script>
</body>

</html>
