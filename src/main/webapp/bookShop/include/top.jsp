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
		<!-- 顶部S -->
		<div class="page-top">
			<div class="container">
				<div class="top-lt">
					<a href="#">小凯网上书城</a><span>|</span>
				</div>
				<div class="top-gt">
					<div class="car-box">
						<a href="${ctx}/CartAction?method=getCartList" class="tit">
							<i><svg t="1577957029576" class="icon" viewBox="0 0 1028 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
								 p-id="1850" width="16" height="16">
									<path d="M332.8 790.528q19.456 0 36.864 7.168t30.208 19.968 20.48 30.208 7.68 36.864-7.68 36.864-20.48 30.208-30.208 20.48-36.864 7.68q-20.48 0-37.888-7.68t-30.208-20.48-20.48-30.208-7.68-36.864 7.68-36.864 20.48-30.208 30.208-19.968 37.888-7.168zM758.784 792.576q19.456 0 37.376 7.168t30.72 19.968 20.48 30.208 7.68 36.864-7.68 36.864-20.48 30.208-30.72 20.48-37.376 7.68-36.864-7.68-30.208-20.48-20.48-30.208-7.68-36.864 7.68-36.864 20.48-30.208 30.208-19.968 36.864-7.168zM930.816 210.944q28.672 0 44.544 7.68t22.528 18.944 6.144 24.064-3.584 22.016-13.312 37.888-22.016 62.976-23.552 68.096-18.944 53.248q-13.312 40.96-33.28 56.832t-49.664 15.872l-35.84 0-65.536 0-86.016 0-96.256 0-253.952 0 14.336 92.16 517.12 0q49.152 0 49.152 41.984 0 20.48-9.728 35.84t-38.4 14.336l-49.152 0-94.208 0-118.784 0-119.808 0-99.328 0-55.296 0q-20.48 0-34.304-9.216t-23.04-24.064-14.848-32.256-8.704-32.768q-1.024-6.144-5.632-29.696t-11.264-58.88-14.848-78.848-16.384-87.552q-19.456-103.424-44.032-230.4l-76.8 0q-15.36 0-25.6-7.68t-16.896-18.432-9.216-23.04-2.56-22.528q0-20.48 13.824-33.792t37.376-12.288l103.424 0q20.48 0 32.768 6.144t19.456 15.36 10.24 18.944 5.12 16.896q2.048 8.192 4.096 23.04t4.096 30.208q3.072 18.432 6.144 38.912l700.416 0zM892.928 302.08l-641.024-2.048 35.84 185.344 535.552 1.024z"
									 p-id="1851" fill="#a2a2a2"></path>
								</svg>
							</i>
							购物车
						</a>
					</div>
						
					<c:if test="${ empty sessionScope.user.getUserName()}">
						<div class="login">
							<a href="${ctx}/manager/login.jsp">登录</a><span>|</span>
							<a href="${ctx}/manager/register.jsp">注册</a><span>|</span>
							<a href="#">消息通知</a>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.user.getUserName()}">
						<div class="login">
							
							<a  href="${ctx}/manager/login.jsp">${sessionScope.user.getUserName()}</a><span>|</span>
							<a 	href="${ctx}/ShoppingUserAction?method=myIndex">个人中心</a><span>|</span>
							<a 	href="${ctx}/ShoppingUserAction?method=orderUser">订单详情</a><span>|</span>
							<a 	href="${ctx}/manager/LogoutAction">退出登录</a><span>|</span>
							<a	href="#">消息通知</a>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
		<!-- 顶部 E -->
		<!-- 导航S -->
		<div class="page-nav">
			<div class="container">
				<!-- logo -->
				<a href="" class="logo"></a>
				<!-- 导航 -->
				<ul class="nav">
					<li class="nav-item" id="pag-all-nav">
						<a href="" class="tit">全部商品分类</a>
						<!-- 全部商品分类 -->
						<div class="slider-nav">
							<ul class="slider-ul">
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(0).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(0).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book1}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(1).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(1).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book2}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(2).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(2).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book3}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(3).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(3).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book4}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(4).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(4).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book5}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(5).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(5).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book6}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(6).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(6).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book7}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
								<li class="slider-li">
									<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(7).categoryId}" class="name">
										<i class="iconfont icon-xiangyou"></i>
										<span>${sessionScope.categoryList.get(7).categoryName}</span>
										<div class="slider-pop" style="width: 730px;">
											<c:forEach var="book" items="${book8}">
												<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pop-li">
													<img src="${book.image}"/>
													<p>${book.title}</p>
												</a>
											</c:forEach>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<c:forEach var="categorys" items="${sessionScope.categoryList}">
						<li class="nav-item">
							<a href="ShoppingUserAction?method=soSo&categoryId=${categorys.categoryId}" class="tit">${categorys.categoryName}</a>
						</li>
					</c:forEach>
				</ul>
				<!-- 搜索框 -->
				<!-- <div class="search active"> -->
				<div class="search " id="Search" >
					<form action="ShoppingUserAction?method=soSo1" method="post">
						<input type="text" class="q" id="q" name="title"/>
						<input type="submit" class="btn"  value="" />						
					</form>
				</div>
			</div>
		</div>		
		<!-- 导航E -->

	</body>

</html>
