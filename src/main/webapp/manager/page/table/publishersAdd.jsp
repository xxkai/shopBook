<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="layuimini-main">
    <div class="layui-form layuimini-form">
        <div class="layui-form-item">
            <label class="layui-form-label required">出版社姓名</label>
            <div class="layui-input-block">
                <input type="text" name="publisherName" required lay-verify="required|userName" style="width: 249px" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="" class="layui-input">
                <tip>填写出版社姓名。</tip>
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
            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'PublishersAction?method=insert',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
          			  if(res.code==0){
          				parent.layer.msg('添加成功',{icon:6,time:2000});
          			  }
          		  }/* ,
          		  error:function(res){
          			  parent.layer.msg('修改失败',{icon:6,time:2000});
          			  console.log(res);
          		  }  */     	  
          	  });
                // 关闭弹出层
                layer.close(index);
                layer.close(parentIndex);

            });
            return false;
        });

    });
</script>