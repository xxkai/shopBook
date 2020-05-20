<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="layuimini-main">
    <div class="layui-form layuimini-form">
    <form class="layui-form">
   		<div class="layui-form-item layui-inline ">
    		 <label class="layui-form-label required">图书</label>
     		 <div class="layui-input-inline">
     		 	<select name="bookId" id="bookId" lay-verify="required" lay-filter="bookIdFilter">
					<option value=""></option>
				</select>
				<tip>选择要添加的书名</tip>
			</div>
   		</div>
   		<div class="layui-form-item layui-inline ">
    		 <label class="layui-form-label required">用户</label>
     		 <div class="layui-input-inline">
     		 	<select name="userId" id="userId" lay-verify="required" lay-filter="userIdFilter">
					<option value=""></option>
				</select>
				<tip>选择要添加的书名</tip>
			</div>
   		</div>
          <div class="layui-form-item">
            	<label class="layui-form-label required">送货地址</label>
          		<div class="layui-input-inline">
               		<input type="text"  name="orderAddr" lay-verify="required" placeholder="请输入详系地址"  autocomplete="off" class="layui-input">
                </div>
          </div>
            <div class="layui-form-item">
            	<label class="layui-form-label required">收件人姓名</label>
            	<div class="layui-input-block">
                <input type="text" name="orderName" required lay-verify="required" lay-reqtext="收货人不能为空" placeholder="请输入收货人" value="" class="layui-input">
                <tip>填写收货人姓名。</tip>
            </div>
            </div>
            <div class="layui-form-item">
            	<label class="layui-form-label required">图书数量</label>
            	<div class="layui-input-block">
                	<input type="number" name="orderNum" required lay-verify="required"  value="" class="layui-input">
           		</div>
        	</div>
        <div class="layui-form-item" >
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
            </div>
        </div>
      </form>
    </div>
</div>
<script type="text/javascript" ></script>
<script>
    layui.use(['form', 'table','layedit','laydate'], function () {       
    	var form = layui.form;
          var  layer = layui.layer;
          var  table = layui.table;
          var  layedit = layui.layedit;
          var  laydate = layui.laydate;
          var $ = layui.jquery;
        $.ajax({
     	   url: 'BooksAction?method=books',
     	   dataType: 'json',
     	   type: 'get',
     	   success: function (data) {
     	   	$.each(data, function (index, item) {
     	   		$('#bookId').append(new Option(item.title,item.bookId));// 下拉菜单里添加元素
     	   	});
     	   	layui.form.render("select");
     	   }
        });
        $.ajax({
      	   url: 'UserAction?method=users',
      	   dataType: 'json',
      	   type: 'get',
      	   success: function (data) {
      	   	$.each(data, function (index, item) {
      	   		$('#userId').append(new Option(item.userName,item.userId));// 下拉菜单里添加元素
      	   	});
      	   	layui.form.render("select");
      	   }
         });
        
        form.render();
        // 当前弹出层，防止ID被覆盖
        
        var parentIndex = layer.index;
        //监听提交
       	form.verify({
       	});
        form.on('submit(saveBtn)', function (data) {
        	
            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'OrderAction?method=insert',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
          			  if(res.code == 0){
          				parent.layer.msg('添加成功',{icon:6,time:2000}); 
          			  }	
          		  }
          	  });
                // 关闭弹出层
                layer.close(index);
                layer.close(parentIndex);
            });
            return false;
        });
    });
</script>
</body>
</html>