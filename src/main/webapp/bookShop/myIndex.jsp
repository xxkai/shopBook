<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!-- 搜索 -->
<title>网上图书商城</title>
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
	<!-- ========内容区========= -->
	<div class="idx-container">
		<div class="container" style="border: 1px red solid; height:700px;">
			<div style="color: #009688;font-size: 26px;text-align: center;margin: 30px 0">欢迎来到用户界面</div>
			<div style="background-color:#009688;width: 600px;height: 600px;margin: 0 auto; ">
			<div style="height: 160px;width: 160px;float:left; margin:40px 220px ;border: 1px red solid;">
				<img alt="用户图" src="${ctx}/bookShop/imge/yohu.jpg" width="100%" height="100%">
			</div>
			<div style="width: 400px; height:200px; float:left;margin: 0 100px;">
			<table style="color:#fff;font-size: 23px;margin: 0 auto; ">
			<tr> 
				<td style="float: right;">用户名：</td><td>${sessionScope.user.getUserName()}</td>
			</tr>
			<tr>
				<td style="float: right;">密    码：</td><td>........</td>
			</tr>
			<tr>
				<td style="float: right;">邮    箱：</td><td>${sessionScope.user.getEmail()}</td>
			</tr>
				
			<tr>
				<td style="float: right;">手机 号 ：</td><td>${sessionScope.user.getPhone()}</td>
			</tr>
				
			
			<tr>
			<td colspan="2" style="height: 60px;">   </td>
			</tr>
			<tr style="text-align: center;">
				<td colspan="2">
					<button class="data-add-btn" style=" background-color="#ff6700" width: 80px;height: 30px;">
					<p style="font-size: 18px">修改信息</p>
					</button>
				</td>
			</tr>
			</table>			
			</div>
			</div>
		
		</div>
	</div>
	<!--=========尾部======== -->
	<%@ include file="include/bottom.jsp" %>
	
<script type="text/javascript" src="${ctx}/manager/js/area.js"></script>
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script type="text/javascript">
layui.use(['element', 'layer', 'layuimini'], function () {
    var $ = layui.jquery,
        element = layui.element,
        layer = layui.layer;
    var num = $("#quantity").val();
    $(".data-add-btn").on("click", function () {
    	//if('${sessionScope.user.getUserId()!= 0}'=='true'){
            var index = layer.open({
                title: '添加修改信息',
                type: 2,
                shade: 0.5,
                maxmin:true,
                shadeClose: true,
                area: ['500px','500px'],
                content: '${ctx}/bookShop/editUser.jsp',
            });
           
    	//}else{
    	//	layer.alert('请进行登录', {icon: 5,time:1000});
    	//}
        return false;
    });
});
</script>

</body>

</html>


