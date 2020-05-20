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
    	<input type="hidden" name="bookId" value="${book.bookId}" class="layui-input">    
        <div class="layui-form-item">
            <label class="layui-form-label required">书名</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="required|title" lay-reqtext="书名不能为空" placeholder="请输入书名" value="${book.title}" class="layui-input">
                <tip>填写要添加的书名</tip>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label required">作者</label>
            <div class="layui-input-block">
                <input type="text" name="author" lay-verify="required|author" lay-reqtext="作者不能为空" placeholder="请输入作者" value="${book.author}" class="layui-input">
                <tip>图书作者。</tip>
            </div>
        </div>
        <div class="layui-form-item layui-inline ">
    		 <label class="layui-form-label required">出版社</label>
     		 <div class="layui-input-inline">
     		 	<select name="publisherId" id="publisherId" value="${book.publisherId}" lay-verify="required" lay-filter="publisherIdFilter">
					<option value=""></option>
				</select>
			</div>
   		</div>
	    <div class="layui-form-item layui-inline ">
	     		 <label class="layui-form-label required">出版日期</label>
	      		 <div class="layui-input-inline">
	        	 	<input type="text" name="publisherDate" id="date" value="${book.publisherDate}" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
	      		</div>
	    	</div>
	   	<div class="layui-form-item layui-inline">
	    <label class="layui-form-label required">类型</label>
	    <div class="layui-input-inline">
	      		 <select name="categoryId" id="categoryId" value="" lay-verify="required" lay-filter="categoryIdFilter">
					<option value=""></option>
				</select>
	    	</div>
	    </div>
    	<div class="layui-form-item layui-form-text ">
   				 <label class="layui-form-label required">作者简介</label>
   	 			<div class="layui-input-block">
     	 			<textarea placeholder="请输入内容" name="authorDescription" class="layui-textarea">${book.authorDescription}</textarea>
    			</div>
    	</div>
    	<div class="layui-form-item">
            <label class="layui-form-label required">图书简介</label>
            <div class="layui-input-block">
               <textarea placeholder="请输入内容" name="contentDescription" class="layui-textarea" >${book.contentDescription}</textarea>
            </div>
        </div>
        	<div class="layui-form-item layui-inline">
		 	<label class="layui-form-label required">页数</label>
			 <div class="layui-input-inline">
	  	 		<input type="number" name="wordsCount" value="${book.wordsCount}" lay-verify="required" placeholder="请输入页数"  autocomplete="off" class="layui-input">
			 </div>
		</div>
	   	<div class="layui-form-item layui-inline">
		 	<label class="layui-form-label required">数量</label>
			 <div class="layui-input-inline">
	  	 		<input type="number" name="num"  lay-verify="required" placeholder="请输入数目" value="${book.num}"  autocomplete="off" class="layui-input">
			 </div>
		</div>
	    <div class="layui-form-item layui-inline">
	 		 <label class="layui-form-label required">价格</label>
	      		<div class="layui-input-inline" style="width: 100px;"> 
	        	<input type="text" name="unitPrice" placeholder="￥" autocomplete="off" value="${book.unitPrice}" class="layui-input">
	      	</div>	
		</div>
		<div class="layui-form-item">
        <label class="layui-form-label">照片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="upload1">改变图片</button>
            <input type="hidden" id="img_url" name="image" value="${book.image}"/>
            <div class="layui-upload-list">
                <img  src="${book.image}" class="layui-upload-img" width="100px" height="80px" id="demo1"/>
                <p id="demoText"></p>
            </div>
        </div>
    </div>
     	<div class="layui-form-item ">
        	<div class="layui-input-block">
            	<button class="layui-btn" lay-submit lay-filter="saveBtn">确认修改</button>
        	</div>
  		</div>
  	</div>
  </div>
<script type="text/javascript" src="${ctx}/manager/js/area.js"></script>
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','layedit','laydate','upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            table = layui.table,
            layedit = layui.layedit,
            laydate = layui.laydate,
            upload = layui.upload,
       		 $ = layui.jquery;
        
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#upload1' //绑定元素
            ,url:'${ctx}/manager/BooksAction?method=insert' //上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                alert("上传成功"+res.data.contextName);
                document.getElementById("img_url").value = res.data.contextName;

            }
        });      
       laydate.render({
    	   elem:'#date'
       });
       
     $.ajax({
    	   url: '${ctx}/manager/PublishersAction?method=list',
    	   dataType: 'json',
    	   type: 'get',
    	   success: function (data) {
    	   		$.each(data, function (index, item) {
    	   			$('#publisherId').append(new Option(item.publisherName,item.publisherId));// 下拉菜单里添加元素
    	   			$('#publisherId').val('${book.publisherId}');
    	   		});
    	   	layui.form.render("select");
    	   }
       });
       $.ajax({
    	   url: '${ctx}/manager/CategorsAction',
    	   dataType: 'json',
    	   type: 'get',
    	   success: function (data) {
    	   	$.each(data, function (index, item) {
    	   		$('#categoryId').append(new Option(item.categoryName,item.categoryId));// 下拉菜单里添加元素
    	   		$('#categoryId').val('${book.categoryId}');
    	   	});
    	   	layui.form.render("select");
    	   }
       });
        var message = '';
        form.render();

        // 当前弹出层，防止ID被覆盖
        var parentIndex = layer.index;
        //监听提交
       	form.verify({
       		userName: function(value){
       		//	var datas={userName: value};
       		},
		});
        form.on('submit(saveBtn)', function (data) {
            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
            	$.ajax({
          		  type:'post',
          		  url:'${ctx}/manager/BooksAction?method=insertimg',
          		  data:data.field,
          		  dataType:'json',
          		  success:function (res){
          			 alert(res.msg);
          			parent.layer.msg('添加成功',{icon:6,time:2000});
          		  },
          		  error:function(res){
          			  parent.layer.msg('修改成功',{icon:6,time:2000});
          			  console.log(res);
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