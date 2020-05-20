<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<div class="layuimini-main">
    <div class="layui-form layuimini-form">
        <div class="layui-form-item">
            <label class="layui-form-label required">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" lay-verify="required|userName" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="" class="layui-input">
                <tip>填写自己管理账号的名称。</tip>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">密码</label>
            <div class="layui-input-block">
                <input type="text" name="userPass" lay-verify="required|userPass" lay-reqtext="密码不能为空" placeholder="请输入密码" value="" class="layui-input">
                <tip>填写自己管理账号的密码。</tip>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">是否是管理员</label>
            <div class="layui-input-block">
                <input type="radio" name="noAdmin" value="1" title="是" >
                <input type="radio" name="noAdmin" value="0" title="否" checked="">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">手机</label>
            <div class="layui-input-block">
                <input type="number" name="phone"   lay-verify="required|phone" lay-reqtext="手机不能为空" placeholder="请输入手机" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" placeholder="请输入邮箱"  lay-verify="required|email" lay-reqtext="邮箱不能为空" value="" class="layui-input">
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
        var message = '';
       	form.verify({
       		userName: function(value){	
       		//	var datas={userName: value};
       			$.ajax({
          		  type:'post',
          		  async: false, 
          		  url:'${ctx}/manager/UserAction?method=judgeName',
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