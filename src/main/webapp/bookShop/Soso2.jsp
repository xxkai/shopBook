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
		<div class="container" style="height:0px;">
			<div class="idx-phone idx-box" style="margin: 30px 0">
			<div style="width: 100%; font-size: 25px;margin: 30px 0">${title}搜索........</div>
				<div class="good-box" id="rm">
					<c:forEach var="book" items="${bookList}" end="10">
						<div class="col-5 good-item">
							<a href="${ctx }/GotoShopAction?bookId=${book.bookId}" class="pic"><img src="${book.image}"></a>
							<h3 class="name"><a href="">${book.title}</a></h3>
							<h4 class="desc">${book.contentDescription}</h4>
							<p class="price "><span>${book.unitPrice}元</span><i>1900元</i></p>
						</div>
					</c:forEach>
				</div>
				<div style="width: 100%;height: 50px;float: left;text-align: center;">
					<form id="pageForm" action="ShoppingUserAction?method=soSo1&title=${title}" method="post">
					<table>
						<tr>
							<td align="center" style="font-size: 17px">
								共${num}条记录
								<a href="ShoppingUserAction?method=soSo1&title=${title}&page=${page}">首页</a>
								<c:if test="${page eq 1}" >
									<span style="color:#808A87">上一页</span>
								</c:if>
								<c:if test="${page ne 1}" >
									<a href="ShoppingUserAction?method=soSo1&title=${title}&page=${page-1}">上一页</a>
								</c:if>
								
								<c:if test="${page eq allPage+1}" >
									<span style="color:#808A87">下一页</span>
								</c:if>
								<c:if test="${page ne allPage+1}" >
									<a href="ShoppingUserAction?method=soSo1&title=${title}&page=${page+1}">下一页</a>
								</c:if>
								<a href="ShoppingUserAction?method=soSo1&title=${title}&page=${allPage+1}">尾页</a>	
								每页${num}条
								当前${page}页/共${allPage+1}页			
								第<input type="text" style="text-align:center" name="page" value="${page}" size="1" />页
								<input type="submit" value="跳转" />
					 		</td>
						</tr>
					</table>
					</form>
				</div>
			</div>	
		</div>
	</div>
	

	<!--=========购物结束======== -->
	<%@ include file="include/bottom.jsp" %>
	

<script type="text/javascript">

</script>

</body>

</html>


