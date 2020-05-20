<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="layuimini-container layui-anim layui-anim-upbit">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">用户姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">用户邮箱</label>
                            <div class="layui-input-inline">
                                <input type="email" name="email" autocomplete="off" class="layui-input"><!-- autocomplete允许浏览器自动填充 -->
                            </div>
                        </div>
                        <div class="layui-inline">
                            <a type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</a>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        
		<form id="editForm" method="post" hidden = "hidden">
  			  <div style="margin:15px 5px 10px 5px"> 姓名：<input type="text" id="edit_category"></div>
  			  <div style="margin:15px 5px 10px 5px"> ：<input type="text" height="30px" id="edit_annotation" maxlength="100"></div>
		</form>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm data-add-btn"> 添加用户 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>  
        <script type="text/html" id="validTpl">
			<input type="checkbox" name="valid" lay-skin = "switch" data-id ="{{d.userName}}" lay-filter = "switchTest" lay-text = "是|否" {{d.noDel =="1"?"checked":""}}>
		</script>
		<script type="text/html" id="last_time">  
  			{{ dateFormat(d.last_time) }} 
		</script>
		<script type="text/html" id="frist_time">  
  			{{ dateFormat(d.frist_time) }} 
		</script>
		<script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
    </div>
</div>
<script>
    layui.use(['form', 'table','layuimini','element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layuimini = layui.layuimini;

        table.render({
            elem: '#currentTableId',
            url: 'UserAction?method=userList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
               // {type: "checkbox", width: 50, fixed: "left"},
                {field: 'userId',  title: '用户数据库编号', sort: true},
                {field: 'userName',  title: '用户名', sort: true},
                {field: 'userPass', title: '用户密码'},
                {field: 'phone',title: '用户电话', sort: true},
                {field: 'email',title: '邮箱', sort: true},
                {field:	'frist_time',title:'注册时间',align:"center",templet: '#frist_time'},
                {field: 'last_time', title: '最后登入时间',align:"center",templet: '#last_time'},
              	{field: 'noAdmin', title: '级别', align: "center", sort: true, templet: function(d){if(d.noAdmin == 1){return '管理员'}else{return '会员'}}},
               	{field: 'noDel',  title: '是否锁定用户',align:'center',templet:'#validTpl'},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            limits: [5, 10, 15, 20, 25, 30],
            limit: 5,
            page: true
        });
        form.on('switch(switchTest)', function(data){
        		var userName= $(this).attr('data-id');
        	  var noDel = this.checked?'1':'0';
        	$.ajax({
        		  type:'post',
        		  url:'UserAction?method=userDel',
        		  data:{userName:userName,noDel:noDel},
        		  dataType:'json',
        		  success:function (res){
        			parent.layer.msg('修改成功',{icon:6,time:2000});
        		  },
        		  error:function(res){
        			  parent.layer.msg('修改成功',{icon:6,time:2000});
        			  console.log(res);
        		  }
        	  
        	  });
        	//  console.log(data.value); //开关value值，也可以通过data.elem.value得到
        }); 
        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
        	 var userName = data.field.userName ;
        	  var email  = data.field.email;
            layer.alert(userName, {
                title: '最终的搜索信息'
            });
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    userName:userName,
                	email:email
                }
            });
        });
        // 监听添加操作
        $(".data-add-btn").on("click", function () {

            var content = layuimini.getHrefContent('page/user/input.jsp');
            var openWH = layuimini.getOpenWidthHeight();

            var index = layer.open({
                title: '添加用户',
                type: 1,
                shade: 0.2,
                maxmin:true,
                shadeClose: true,
                area: [openWH[0] + 'px', openWH[1] + 'px'],
                offset: [openWH[2] + 'px', openWH[3] + 'px'],
                content: content,
            });
            $(window).on("resize", function () {
                layer.full(index);
            });
            return false;
        });
        //监听表格复选框选择
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                var openWH = layuimini.getOpenWidthHeight();
                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: [openWH[0] + 'px', openWH[1] + 'px'],
                    offset: [openWH[2] + 'px', openWH[3] + 'px'],
                    content:'UserAction?method=getOne&userId='+data.userId
                });
                $(window).on("resize", function () {
                    layer.full(index);
                }); 
                return false;
              //  return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                	 $.ajax({
                         type: "post",
                         url: "UserAction?method=delete",
                         dataType:'json',
                         data: "userId="+data.userId,
                         dataType: "json",
                         success: function (data) {
                             var message = data.msg;
                             var code = data.code;
                                 layer.alert(message,{icon: 1,time:2000});
                                 return;
                         },
                         error: function () {
                         }

                     })
                        obj.del();
                        layer.close(index);
                });
            }
        });

    });
</script>
<!-- 时间转换 -->
<script type="text/javascript">
Date.prototype.format = function (fmt) { //author: meizz  
    	    var o = {  
    	        "M+": this.getMonth() + 1, //月份  
    	        "d+": this.getDate(), //日  
    	        "h+": this.getHours(), //小时  
    	        "m+": this.getMinutes(), //分  
    	        "s+": this.getSeconds(), //秒   
    	        "q+": Math.floor((this.getMonth()+3)/3), 
    	        "S": this.getMilliseconds() //毫秒  
    	    };  
    	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
    	    for (var k in o)  
    	        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
    	    return fmt;  
    	}  
    	String.prototype.format = function (args) {  
    	    var result = this;  
    	    if (arguments.length > 0) {  
    	        if (arguments.length == 1 && typeof (args) == "last_time") {  
    	            for (var key in args) {  
    	                if (args[key] != undefined) {  
    	                    var reg = new RegExp("({" + key + "})", "g");  
    	                    result = result.replace(reg, args[key]);  
    	                }  
    	            }  
    	        }  
    	        else {  
    	            for (var i = 0; i < arguments.length; i++) {  
    	                if (arguments[i] != undefined) {  
    	                    //var reg = new RegExp("({[" + i + "]})", "g");//这个在索引大于9时会有问题  
    	                    var reg = new RegExp("({)" + i + "(})", "g");  
    	                    result = result.replace(reg, arguments[i]);  
    	                }  
    	            }  
    	        }  
    	    }  
    	    return result;  
    	}
    	function dateFormat(value) {
    	    return value ? new Date(value).format("yyyy-MM-dd hh:mm:ss") : "";  
    	}

</script>
</body>
</html>