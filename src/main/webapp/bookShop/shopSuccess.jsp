<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
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
	<!-- ========购物开始========= -->
	<div class="idx-container">
		<div class="container" style="border: 1px red solid; height:0px;">
		<div style="width: 700px; height: 400px; background-color: #fff; margin: 30px auto;">
		购物车加入成功，正在返回首页
		</div>	
		</div>
	</div>
<!--=========购物结束======== -->
	<%@ include file="include/bottom.jsp" %>
</body>

</html>


