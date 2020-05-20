<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!-- 搜索 -->
<!-- 	<meta name="description" content="小米商城直营小米公司旗下所有产品，包括小米手机系列小米CC9 美图手机定制版、小米9、小米MIX Alpha，Redmi 红米系列Redmi K30、Redmi Note 8，小米电视、笔记本、米家智能家居等，同时提供小米客户服务及售后支持" />
		<meta name= "keywords" content="小米,RedmiNote8Pro,小米cc9,Redmi K30,美图手机,小米MIX Alpha,小米商城" />-->
<title>小米商城</title>
<!-- 重置样式，处理样式 -->
<link rel="icon" href="${ctx}/manager/images/favicon.ico">
    <link rel="stylesheet" href="${ctx}/manager/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/layuimini.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/css/public.css" media="all">
    <link rel="stylesheet" href="${ctx}/manager/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
   
<link rel="stylesheet" type="text/css"
	href="${ctx}/bookShop/css/reset.css" />
<!-- 公共的css -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/bookShop/css/style.css" />
<!-- 首页的css -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/bookShop/css/index.css" />
<!-- 字体图标样式 -->
<link rel="stylesheet" href="${ctx}/bookShop/font/iconfont.css" />
<!-- 引入网页标题图标 -->
<link rel="shortcut icon" href="${ctx}/bookShop/img/icons/favicon.ico"
	type="image/x-icon">
 
<script type="text/javascript" src="${ctx}/bookShop/js/index.js">
	
</script>
<script src="${ctx}/bookShop/js/jquery.min.js"></script>
<style type="text/css">
.page-nav .search .btn {
	width: 50px;
	height: 50px;
	border: 1px solid #E0E0E0;
	float: left;
	cursor: pointer;
	/**变成手**/
	background: #fff url(${ctx}/bookShop/imge/sousuo.png) center center
		no-repeat;
	background-size: 16px 16px;
}

.page-nav .search .btn:hover {
	background-color: #FF6700;
	background-image: url(${ctx}/bookShop/imge/sousuo1.png);
	border-color: #FF6700;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none !important;
	margin: 0;
}

.shop_btn {
	width: 157px;
	float: left;
	height: 36px;
	background-color: #ffeded;
	color: #FF0036;
	border: 1px solid #FF0036;
	line-height: 38px;
	text-align: center;
	font-size: 16px;
	margin: 10px 20px;
	cursor: pointer;
}

.shopImg img {
	width: 100%;
	height: 100%;
	float: left;
	margin-right: 16px;
}
.slider-nav{
	display: none;
}
</style>
</head>
<body>
	<!-- 顶部S -->
	<%@ include file="include/top.jsp" %>
	<!-- ========购物开始========= -->
	<div class="idx-container">
		<div class="container" style="border: 1px red solid;width:830px; margin: 0 auto;">
		<fieldset class="table-search-fieldset">
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
						    <label class="layui-form-label">订单分类</label>
						    <div class="layui-input-block">
						      <input type="radio" name="transport" title="发货中" value="0">
						      <input type="radio" name="transport" title="已签收" value="1">
						      <input type="radio" name="transport" title="已完成" value="2">
						    </div>
						  </div>
                        <div class="layui-inline">
                            <a type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</a>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
		<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>  
		<script type="text/html" id="orderDate">  
  			{{ dateFormat(d.orderDate) }} 
		</script>
		<script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
		
		
		</div>
	</div>
	<%--尾部--%>
	<%@ include file="include/bottom.jsp" %>
	<!--订单表  -->
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script type="text/javascript">
	layui.use(['form', 'table','layuimini','element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layuimini = layui.layuimini;
        table.render({
        //	http://localhost:8080/shopBook/manager/OrderAction
            elem: '#currentTableId',
            url: 'manager/OrderAction?method=getList&userId=${sessionScope.user.getUserId()}',
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
                //{field: 'userId',  title: '用户Id', sort: true},
                {field: 'bookId',  title: '图书Id', sort: true},
                {field: 'orderNum', title: '数量'},
                {field:'orderName',title:'收件人'},
                {field: 'orderAddr',title: '运货地址', sort: true},
                {field: 'orderDate',title:'订单时间',align:"center",templet: '#orderDate'}, 
               	{field: 'totalPrice',  title: '价格',align:'center',totalRow: true},
               	{field:	'transport', title:'货物状态',align:'center', sort: true,templet:function(d){
               			if(d.transport == 0){
               				return '发货中';
               			}else if (d.transport ==1){
               				return '<a href="javascript:;" class="layui-btn layui-btn-xs data-count-edit" lay-event="deliver">收货</a>';
               			}else{
               				return '订单结束';
               			}
               		}
               	},
                {title: '操作', minWidth: 50, templet: '#currentTableBar',fixed: "right", align: "center"}
            ]],
            limits: [5, 10, 15, 20, 25, 30],
            limit: 5,
            page: true
        });// 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
        	 var transport = data.field.transport;
            layer.alert(transport, {
                title: '最终的搜索信息'
            });
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                	transport:transport,
                }
            });
            //return false;
        });
        // 监听添加操作
        //监听表格复选框选择
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'delete') {
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
            	layer.confirm('真的接受货物吗？', function (index) {
            		$.ajax({
          		  		type:'post',
          		  		async:false,
          		  		url:'${ctx}/manager/OrderAction?method=deliver',
          		  		data:{orderId:data.orderId,transport:data.transport},
          		  		dataType:'json',
          		  		success:function (res){
          			  		if(res.code == 0){
          						parent.layer.msg('货物成功接收',{icon:6,time:2000});
          						obj.update({'transport':2});
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