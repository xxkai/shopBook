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
	<!-- ========购物开始========= -->
	<div class="idx-container">
		<div class="container" style="border: 1px red solid; height:0px;">
		<div style="width: 700px; height: 400px; background-color: #fff; margin: 30px auto;">
				<div class="shopImg" style="width: 200px; height: 300px; float: left; margin: 30px 30px">
					<img src="${book.image }" />
				</div>
				<div style="width: 400px; height: 300px; float: left; margin: 30px 0">
					<p style="font-size: 30px; margin: 20px 40px;color: #ff6700">
						图书名：<span>${book.title}</span>
					</p>
					<p style="font-size: 17px; margin: 4px 40px">
						作者:<span style="margin-left: 10px;line-height:30px;">${book.author}</span>
					</p>
					<p style="font-size: 12px; margin: 0px 40px;line-height:30px;">
						出版社:<span style="margin-right: 20px; margin-left: 10px">${publisherName }</span>
						出版时间:<span style="margin-right: 30px; margin-left: 10px">${book.publisherDate}</span>
					</p>
					<p style="font-size: 14px; margin: 4px 40px;line-height:30px;">
						页数:<span style="margin-left: 10px">${book.wordsCount}</span>
					</p>
					<p style="font-size: 17px; margin: 5px 40px">
						单价：<span style="font-size: 23px; color: #ff6700">${book.unitPrice}元</span>
					</p>					
					<p style="font-size: 12px; margin: 0px 40px">
						数量：<span>${book.num}</span>
						<span style="color: #ff6700;margin-left: 20px">销量：${book.clicks}</span>
					</p>
					
					<p style="font-size: 12px; margin: 0px 40px">
						选择数量： <input id="min" name="" style="width: 20px; cursor: pointer;" type="button" value="-" />
						<input id="quantity" name="" onkeydown="return false;" style="width: 30px; text-align: center;" type="number" value="${book.num>0?1:0 }" />
						<input id="add" name="" style="width: 20px; cursor: pointer;" type="button" value="+" />
					</p>
				
					
					<div style="width: 400px; height: 60px; margin: 20px 0">
						<div class="shop_btn" style="border: 1px red solid;">
							<a style="" class="data-add-btn">立即购买</a>
						</div>
						<div class="shop_btn" style="background-color: #ff0036; color: #fff">
							<i><svg t="1577957029576" class="icon"
									viewBox="0 0 1028 1024" version="1.1"
									xmlns="http://www.w3.org/2000/svg" p-id="1850" width="16"
									height="16">
									<path
										d="M332.8 790.528q19.456 0 36.864 7.168t30.208 19.968 20.48 30.208 7.68 36.864-7.68 36.864-20.48 30.208-30.208 20.48-36.864 7.68q-20.48 0-37.888-7.68t-30.208-20.48-20.48-30.208-7.68-36.864 7.68-36.864 20.48-30.208 30.208-19.968 37.888-7.168zM758.784 792.576q19.456 0 37.376 7.168t30.72 19.968 20.48 30.208 7.68 36.864-7.68 36.864-20.48 30.208-30.72 20.48-37.376 7.68-36.864-7.68-30.208-20.48-20.48-30.208-7.68-36.864 7.68-36.864 20.48-30.208 30.208-19.968 36.864-7.168zM930.816 210.944q28.672 0 44.544 7.68t22.528 18.944 6.144 24.064-3.584 22.016-13.312 37.888-22.016 62.976-23.552 68.096-18.944 53.248q-13.312 40.96-33.28 56.832t-49.664 15.872l-35.84 0-65.536 0-86.016 0-96.256 0-253.952 0 14.336 92.16 517.12 0q49.152 0 49.152 41.984 0 20.48-9.728 35.84t-38.4 14.336l-49.152 0-94.208 0-118.784 0-119.808 0-99.328 0-55.296 0q-20.48 0-34.304-9.216t-23.04-24.064-14.848-32.256-8.704-32.768q-1.024-6.144-5.632-29.696t-11.264-58.88-14.848-78.848-16.384-87.552q-19.456-103.424-44.032-230.4l-76.8 0q-15.36 0-25.6-7.68t-16.896-18.432-9.216-23.04-2.56-22.528q0-20.48 13.824-33.792t37.376-12.288l103.424 0q20.48 0 32.768 6.144t19.456 15.36 10.24 18.944 5.12 16.896q2.048 8.192 4.096 23.04t4.096 30.208q3.072 18.432 6.144 38.912l700.416 0zM892.928 302.08l-641.024-2.048 35.84 185.344 535.552 1.024z"
										p-id="1851" fill="#fff"></path>
								</svg> </i> 
							<a style="" class="data-Cart-btn">加入购物车</a>
						</div>
					</div>
				</div>
			</div>
			<div style="width:100%;float:left;">
			<div style="width: 700px;margin: 0 auto;margin-bottom: 20px">
				<p style="font-size:26px">作者介绍：</p>
				<p style="font-size: 16px; line-height:30px">
				<span style="padding-left:2em"></span>
				${book.authorDescription }
				</p>
			</div>
			<div style="width: 700px;margin: 0 auto;margin-bottom: 50px">
				<p style="font-size:26px">图书介绍：</p>
				<p style="font-size: 16px; line-height:30px;">
				<span style="padding-left:2em"></span>
				${book.contentDescription}
				</p>
			</div>
			</div>
			<!-- 
			background-color: #f5f5f5;
			 -->
			
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var t = $("#quantity");
			$("#add").click(function() {
				if (parseInt(t.val()) < ${book.num}) {
					t.val(parseInt(t.val()) + 1);
					$("#min").removeAttr("disabled");
				} else {
					$("#add").attr("disabled", "disabled")
				}
				//当按加1时，解除$("#min")不可读状态
				setTotal();
			})
			$("#min").click(function() {
				if (parseInt(t.val()) > 1) { //判断数量值大于1时才可以减少
					t.val(parseInt(t.val()) - 1);
					$("#add").removeAttr("disabled");
				} else {
					$("#min").attr("disabled", "disabled") //当$("#min")为1时，$("#min")不可读状态
				}
				
			})

		})
	</script>

	<!--=========购物结束======== -->
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
    	if('${sessionScope.user.getUserId()!= 0}'=='true'){
            var index = layer.open({
                title: '添加购买信息',
                type: 2,
                shade: 0.5,
                maxmin:true,
                shadeClose: true,
                area: ['500px','500px'],
                content: 'ShoppingUserAction?method=addShop&bookId=${book.bookId}&num='+num,
            });
           
    	}else{
    		layer.alert('请进行登录', {icon: 5,time:1000});
    	}
        return false;
    });
    $(".data-Cart-btn").on("click", function () {
    	if('${sessionScope.user.getUserId()!= 0}'=='true'){
     		$.ajax({
        		  type:'post',
        		  url:'CartAction?method=insertCart&bookId=${book.bookId}&num='+num,
        		  data:{},
        		  dataType:'json',
        		  success:function (res){
        			  if(res.code==0){
        				parent.layer.msg('购物车添加成功',{icon:6,time:2000});
        			  }
        		  }
     		});
    		//layer.alert("添加成功",{icon:5,time:1000});
    		//window.location.href="${ctx}/ShoppingUserAction?method=insertCart&bookId=${book.bookId}&num="+num;       
    	}else{
    		layer.alert('请进行登录', {icon: 5,time:1000});
    	}
        
        return  false;
    	
    });
});
</script>

</body>

</html>


