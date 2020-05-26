<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<%@ include file="include/top.jsp" %>
		<div class="box">
			<div class="box-1">
				<ul>
					<li><img src="${ctx }/bookShop/imge/lubo.jpg" alt="这里是第一场图片"></img></li>
					<li><img src="${ctx }/bookShop/imge/lubo1.jpg" alt="这里是第二张图片"></img></li>
					<li><img src="${ctx }/bookShop/imge/lubo2.jpg" alt="这里是第三张图片"></img></li>
					<li><img src="${ctx }/bookShop/imge/lubo3.jpg" alt="这里是第一场图片"></img></li>
					<li><img src="${ctx }/bookShop/imge/lubo4.jpg" alt="这里是第一场图片"></img></li>
				</ul>
			</div>
			<div class="box-2">
				<ul></ul>
			</div>
			<div class="box-3">
				<span class="prev"> &lt; </span>
				<span class="next"> &gt; </span>
			</div>
		</div>

		<!-- 大内容区S -->
		<div class="idx-container">
			<div class="container">
				<!-- 1 -->
				<div class="idx-title" id="right-zuobiao">
					<span class="tit" >${categoryList.get(0).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(0).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book1}" end="${fn:length(book1)<10?fn:length(book1):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
										<div class="good-top">
											<div class="txt">
												<h3>${book.title}</h3>
												<p>${book.unitPrice}元</p>
											</div>
											<a class="sm-img">
												<img src="${book.image}">
											</a>
										</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(1).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(1).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book2}" end="${fn:length(book2)<10?fn:length(book2):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(2).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(2).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book3}" end="${fn:length(book3)<10?fn:length(book3):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(3).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(3).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book4}" end="${fn:length(book4)<10?fn:length(book4):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(4).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(4).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book5}" end="${fn:length(book5)<10?fn:length(book5):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(5).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(5).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book6}" end="${fn:length(book6)<10?fn:length(book6):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(6).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(6).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book7}" end="${fn:length(book7)<10?fn:length(book7):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="idx-title">
					<span class="tit">${categoryList.get(7).categoryName}</span>
					<a href="${ctx}/ShoppingUserAction?method=soSo&categoryId=${sessionScope.categoryList.get(7).categoryId}" class="see-all">查看全部<i class="iconfont icon-xiangyou1"></i></a>
				</div>
				<div class="idx-phone idx-box">
					<div class="good-box" >
						<c:forEach var="book" items="${book8}" end="${fn:length(book8)<10?fn:length(book8):10}" varStatus="status">
							<c:if test="${status.last==false}">
								<div class="col-5 good-item">
									<a href="${ctx}/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
									<h3 class="name"><a href="">${book.title}</a></h3>
									<h4 class="desc">${book.contentDescription}</h4>
									<p class="price "><span>${book.unitPrice}元</span><i>${book.unitPrice+30}</i></p>
								</div>
							</c:if>
							<c:if test="${status.last==true}">
								<div class="col-5 good-item last-more">
									<div class="good-top">
										<div class="txt">
											<h3>${book.title}</h3>
											<p>${book.unitPrice}元</p>
										</div>
										<a class="sm-img">
											<img src="${book.image}">
										</a>
									</div>
									<div class="good-more">
										<div class="txt">
											<h3><a href="">浏览更多</a></h3>
											<p>热门</p>
										</div>
										<i class="iconfont icon-youjiantou"></i>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 大内容区E -->
		<!-- 页脚s -->
		<%@ include file="include/bottom.jsp" %>
		<!-- js -->
		<!-- 倒计时 -->
		<script type="text/javascript">
			// 这是右边导航栏的回到顶点的设置
			var tit = document.getElementById("right-zuobiao");
			var last = document.getElementById("Last-top");
			//获取距离页面顶端的距离
			var titleTop = tit.offsetTop;
			//滚动事件
			document.onscroll = function() {
				//获取当前滚动的距离
				var btop = document.body.scrollTop || document.documentElement.scrollTop;
				// 也可以写成document.body.scrollTop＋document.documentElement.scrollTop;因为这两个属性在同一浏览器不会同时有效。
				//如果滚动距离大于导航条据顶部的距离
				if (btop > titleTop) {
					//为导航条设置fix
					last.style.display="block";
				} else {
					//移除fixed
					last.style.display="none";
				}
			}
		</script>
	</body>

</html>
