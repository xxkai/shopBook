<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="layuimini-main">
    <div class="layui-form layuimini-form">
        <div class="layui-form-item">
            <label class="layui-form-label required">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName"  lay-verify="userName" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="${sessionScope.user.getUserName()}" class="layui-input" readonly=''true">
                <tip>填写自己管理账号的名称。</tip>
            </div>
        </div>
        <div class="layui-form-item layui-inline ">
    		 <label class="layui-form-label required">图书</label>
     		 <div class="layui-input-inline">
     		 	<select name="bookId" id="bookId" lay-verify="required" lay-filter="bookIdFilter">
					<option value=""></option>
				</select>
				<tip>选择要添加的书名</tip>
			</div>
   		</div>
        <div class="layui-form-item">
            <label class="layui-form-label required">数量</label>
            <div class="layui-input-block">
                <input type="number" name="storeoutNum"   lay-verify="required|storeinNum" lay-reqtext="数量不能为空" placeholder="请添加数量" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'table','layedit','laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            table = layui.table,
       		 $ = layui.jquery,
       		 layedit = layui.layedit,
        	 laydate = layui.laydate;
        var message = '';
        $.ajax({
      	   url: 'BooksAction?method=books',
      	   dataType:'json',
      	   type: 'get',
      	   success: function (data) {
      	   	$.each(data, function (index, item) {
      	   		$('#bookId').append(new Option(item.title,item.bookId));// 下拉菜单里添加元素
      	   	});
      	   	layui.form.render("select");
      	   }
         });
        form.render();

        // 当前弹出层，防止ID被覆盖
        var parentIndex = layer.index;
        //监听提交
       	form.verify({
       		storeinNum:[/^[0-9]*$/, '必须输入大于0']
       	});
        form.on('submit(saveBtn)', function (data) {
            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'StoreoutAction?method=insert',
          		  data:data.field,
          		  dataType:'json',
          		success:function (res){
         			 if(res.data.xxk =='yes'){
         				parent.layer.msg('出库成功',{icon:6,time:2000});
         			 }else{
         				parent.layer.msg('出库失败，库存不足',{icon:5,time:2000}); 
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