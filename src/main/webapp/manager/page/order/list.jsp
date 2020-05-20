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
<div class="layuimini-container layui-anim layui-anim-upbit">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">用户id</label>
                            <div class="layui-input-inline">
                                <input type="number" name="userId" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">图书id</label>
                            <div class="layui-input-inline">
                                <input type="number" name="bookId" autocomplete="off" class="layui-input"><!-- autocomplete允许浏览器自动填充 -->
                            </div>
                        </div>
                        <div class="layui-inline">
                            <a type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</a>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm data-add-btn"> 添加用户 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>  
		<script type="text/html" id="orderDate">  
  			{{ dateFormat(d.orderDate) }} 
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
            url: 'OrderAction?method=getList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            totalRow: true,
            cols: [[
               // {type: "checkbox", width: 50, fixed: "left"},
                {field: 'orderId',  title: '订单编号', sort: true ,totalRowText: '合计'},
                {field: 'userId',  title: '用户Id', sort: true},
                {field: 'bookId',  title: '图书Id', sort: true},
                {field: 'orderNum', title: '数量'},
                {field:'orderName',title:'收件人'},
                {field: 'orderAddr',title: '运货地址', sort: true},
                {field: 'orderDate',title:'订单时间',align:"center",templet: '#orderDate'}, 
               	{field: 'totalPrice',  title: '价格',align:'center',totalRow: true},
               	{field:	'transport', title:'是否发货',align:'center', sort: true,templet:function(d){
	               		if(d.transport ==0 ){
	               			return '<a href="javascript:;" class="layui-btn layui-btn-xs data-count-edit" lay-event="deliver">发货</a>';
	               		}else if(d.transport ==1){
	               			return '已发货';
	               		}else{
	               			return '订单结束';
	               		}
               		}
               	},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            limits: [5, 10, 15, 20, 25, 30],
            limit: 5,
            page: true
        });
        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
        	 var bookId = data.field.bookId ;
        	  var userId  = data.field.userId;
            //var result = JSON.stringify(data.field);
            layer.alert(userName, {
                title: '最终的搜索信息'
            });
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    bookId:bookId,
                	userId:userId
                }
            });
            //return false;
        });
        // 监听添加操作
        $(".data-add-btn").on("click", function () {

            var content = layuimini.getHrefContent('page/table/orderAdd.jsp');
            var openWH = layuimini.getOpenWidthHeight();

            var index = layer.open({
                title: '添加定单表',
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
                //var content = layuimini.getHrefContent('');
                var openWH = layuimini.getOpenWidthHeight();
                var index = layer.open({
                    title: '编辑点单表',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: [openWH[0] + 'px', openWH[1] + 'px'],
                    offset: [openWH[2] + 'px', openWH[3] + 'px'],
                    content:'OrderAction?method=getOne&orderId='+data.orderId
                });
                form.val('edit-form',{
                	userId:data.userId,
                	userName:data.userName
                });
              //  return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                	 $.ajax({
                         type: "post",
                         url: "${ctx}/manager/OrderAction?method=delete",
                         dataType:'json',
                         data: "orderId="+data.orderId,
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
            }else if(obj.event = 'deliver'){
            	//layer.alert('这是发货按钮',{icon:1,time:200});
            	layer.confirm('真的发货吗？', function (index) {
            		$.ajax({
          		  		type:'post',
          		  		async:false,
          		  		url:'OrderAction?method=deliver',
          		  		data:{orderId:data.orderId,transport:data.transport},
          		  		dataType:'json',
          		  		success:function (res){
          			  		if(res.code == 0){
          						parent.layer.msg('发货成功',{icon:6,time:2000});
          						obj.update({'transport':1});
          			  		}	
          		  		}
          	 		});
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
    	        if (arguments.length == 1 && typeof (args) == "orderDate") {  
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