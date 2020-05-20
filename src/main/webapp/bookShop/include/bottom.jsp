<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
        <!--  -->
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>网上图书商城</title>
		<!-- 重置样式，处理样式 -->
		<link rel="stylesheet" type="text/css" href="${ctx}/bookShop/css/reset.css" />
		<!-- 公共的css -->
		<link rel="stylesheet" type="text/css" href="${ctx}/bookShop/css/style.css" />
		<!-- 首页的css -->
		<link rel="stylesheet" type="text/css" href="${ctx}/bookShop/css/index.css" />
		<!-- 字体图标样式 -->
		<link rel="stylesheet" href="${ctx}/bookShop/font/iconfont.css" />
		<!-- 引入网页标题图标 -->
		<link rel="shortcut icon" href="${ctx}/bookShop/img/icons/favicon.ico" type="image/x-icon">
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
			background: #fff url(${ctx}/bookShop/imge/sousuo.png) center center no-repeat;
			background-size: 16px 16px;
		
		}

		.page-nav .search .btn:hover {
			background-color: #FF6700;
			background-image: url(${ctx}/bookShop/imge/sousuo1.png);
			border-color: #FF6700;
		}
		</style>
	</head>
	<body>
	<div class="page-foot">
		<div class="container">
			<ul class="ts">
				<li><a href=""><i class="iconfont icon-weixiu"></i>预约维修服务</a></li>
				<li><a href=""><i class="iconfont icon-sevenday-copy"></i>7天无理由退货</a></li>
				<li><a href=""><i class="iconfont icon-tian"></i>15天免费换货</a></li>
				<li><a href=""><i class="iconfont icon-libao"></i>满99元包邮（试运行）</a></li>
				<li><a href=""><i class="iconfont icon-zuobiao"></i>520余家售后网点</a></li>
			</ul>
			<div class="nav">
				<div class="lt">
					<dl>
						<dt><a href="">帮助中心</a></dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt><a href="">服务支持</a></dt>
						<dd>售后政策</dd>
						<dd>自助服务</dd>
						<dd>相关下载</dd>
					</dl>
					<dl>
						<dt>线下门店</dt>
						<dd>小米之家</dd>
						<dd>服务网点</dd>
						<dd>授权体验店</dd>
					</dl>
					<dl>
						<dt>关于小米</dt>
						<dd>了解小米</dd>
						<dd>加入小米</dd>
						<dd>投资者关系</dd>
					</dl>
					<dl>
						<dt>关注我们</dt>
						<dd>新浪微博</dd>
						<dd>官方微信</dd>
						<dd>联系我们</dd>
					</dl>
					<dl>
						<dt>特色服务</dt>
						<dd>F 码通道</dd>
						<dd>礼物码</dd>
						<dd>防伪查询</dd>
					</dl>
				</div>
				<div class="gt">
					<h3>400-100-5678</h3>

					<h4>周一至周日 8:00-18:00</h4>
					<p>（仅收市话费）</p>
					<a href="" class="concat"><i class="iconfont icon-xinxi">联系客服</i></a>
				</div>
			</div>
			<div class="bot">
				<div class="container">
					<a href="" class="logo"></a>
					<div class="txt">
						<h3 class="list">
							<a href="">小米商城</a><span>|</span>
							<a href="">MIUI</a><span>|</span><a href="">米家</a><span>|</span>
							<a href="">米聊</a><span>|</span><a href="">多看</a><span>|</span>
							<a href="">游戏</a><span>|</span><a href="">音乐</a><span>|</span>
							<a href=""> 路由器 </a><span>|</span><a href="">米粉卡</a><span>|</span>
							<a href="">政企服务</a><span>|</span><a href="">小米天猫店</a><span>|</span>
							<a href="">小米集团隐私政策</a><span>|</span><a href="">小米公司儿童信息保护规则</a><span>|</span>
							<a href="">小米商城隐私政策</a><span>|</span><a href="">小米商城用户协议</a><span>|</span>
							<a href="">问题反馈</a><span>|</span><a href="">廉正举报</a><span>|</span>
							<a href="">政企服务</a><span>|</span><a href="">诚信合规</a><span>|</span>
							<a href="">Select Location</a><span>|</span>
						</h3>
						<p><a href="">© mi.com</a><a href="">京ICP证110507号</a> <a href="">京ICP备10046444号 </a> <a href="">京公网安备11010802020134号</a>
							<a href="">京网文[2017]1530-131号</a></p>
						<p><a href="">（京）网械平台备字（2018）第00005号</a> <a href="">互联网药品信息服务资格证 (京)-非经营性-2014-0090</a>
							<a href="">营业执照</a> <a href="">医疗器械质量公告</a></p>
						<p><a href="">增值电信业务许可证</a><a href="">网络食品经营备案（京）【2018】WLSPJYBAHF-12</a><a href="">食品经营许可证</a> </p>
						<p>违法和不良信息举报电话：185-0130-1238 知识产权侵权投诉 本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
						<p>TRUSTe Privacy Certification 诚信网站 可信网站 诚信经营 放心消费</p>
						<P>探索黑科技，小米为发烧而生</P>

					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 固定悬浮导航栏 -->
	<div id="right-gd">
		<div id="">
			<p class="iconfont icon-shouji"></p>
			<p class="p2">手机APP</p>
		</div>
		<div id="">
			<p class="iconfont icon-renwu"></p>
			<p class="p2">个人中心</p>
		</div>
		<div id="">
			<p class="iconfont icon-weixiu"></p>
			<p class="p2">售后服务</p>
		</div>
		<div id="">
			<p class="iconfont icon-rengongfuwu"></p>
			<p class="p2">人工客服</p>
		</div>
		<div id="">
			<p class="iconfont icon-cart-copy"></p>
			<p class="p2">购物车</p>
		</div>
		<div id="Last-top">
			<a href="#" id="hdSy" >
				<p class="iconfont icon-top"></p>
				<p class="p2">回到首页</p>
			</a>
		</div>
	</div>
	</body>

</html>
