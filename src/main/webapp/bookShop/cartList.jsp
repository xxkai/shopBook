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
 <link rel="icon" href="${ctx}/manager/images/favicon.ico">
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
	table td,th {
		width:160px;
		height: 100px;
		text-align: center;
		border-bottom: 1px red solid;

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
		<div class="container" style=" height:0px;">
		<div style="width: 700px;   margin: 30px auto;">
		<h3 style="text-align: center;font-size: 30px;color: #fd9;line-height:70px;">欢迎来到购物车</h3>
		<c:if test="${ empty cartsListsss}">
		
			<div style="color: #ff3478 ;width:100% ;height:40px;text-align: center;font-size: 20px;cursor:pointer;" ><a href="${ctx}/ShoppingUserAction?method=firstBooks1">购物车中没有商品,请点击回到主界面进行添加</a></div> 
		 
		 
		 </c:if>
		<div style="float:left;background-color: #fff;">
		
		<c:if test="${not empty cartsList}">		
		<table style="border: 1px red solid;">
			<tr>
				<th><input name="checkall" id="checkall"  type="checkbox" onclick="checkAll(checkall)">全选</th>
				<th>图片</th>
				<th>商品名</th>
				<th>数量</th>
				<th>价格</th>
				<th>删除</th>
			</tr>
			<c:forEach var="cart" items="${cartsList}">
			<tr>
				<td><input class="check" name="check" type="checkbox" value="${cart.cartId}"></td>
				<td><img alt="图片" src="${cart.dataMap.image}" style="width: 80px;height: 100px"></td>
				<td>${cart.dataMap.title}</td>
				<td>			
					<input class="min"  name="" style="width: 20px; cursor: pointer;" type="button" value="-"/>
					<%-- <input class="bookId" type="hidden" value="${book.num}"/>  --%>
					<input class="quantity"  name=""  style="width: 30px; text-align: center;" type="number" value="${cart.num}" />
					<input class="add" name="" style="width: 20px; cursor: pointer;" type="button" value="+"/>
				</td>
				<td><p class="cartMoney">${cart.num*cart.dataMap.unitPrice}</p></td>
				<td><a class="delete"  style="text-align: center; font-size: 39px;cursor:pointer ">X</a></td>
			</tr>
			</c:forEach>
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><p style="color: #ff6700;font-size: 30px" ></p>合计</td>
			<td>
				<p class="total" style="color: #ff6700;font-size: 30px" >0</p>
				<span style="color: #ff6700;font-size: 20px">￥</span>
			</td>
			<td> <button class="button"  style="background-color: #ff6700;width: 100px;height:50px;color: #fff;font-size: 14px ">立即结算</button></td>
			</tr>
		</table>	
		</c:if>
		</div>
		</div>
	</div>
	</div>
	<!--=========购物结束======== -->
	
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
						<dt>
							<a href="">帮助中心</a>
						</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt>
							<a href="">服务支持</a>
						</dt>
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
							<a href="">小米商城</a><span>|</span> <a href="">MIUI</a><span>|</span><a
								href="">米家</a><span>|</span> <a href="">米聊</a><span>|</span><a
								href="">多看</a><span>|</span> <a href="">游戏</a><span>|</span><a
								href="">音乐</a><span>|</span> <a href=""> 路由器 </a><span>|</span><a
								href="">米粉卡</a><span>|</span> <a href="">政企服务</a><span>|</span><a
								href="">小米天猫店</a><span>|</span> <a href="">小米集团隐私政策</a><span>|</span><a
								href="">小米公司儿童信息保护规则</a><span>|</span> <a href="">小米商城隐私政策</a><span>|</span><a
								href="">小米商城用户协议</a><span>|</span> <a href="">问题反馈</a><span>|</span><a
								href="">廉正举报</a><span>|</span> <a href="">政企服务</a><span>|</span><a
								href="">诚信合规</a><span>|</span> <a href="">Select Location</a><span>|</span>
						</h3>
						<p>
							<a href="">© mi.com</a><a href="">京ICP证110507号</a> <a href="">京ICP备10046444号
							</a> <a href="">京公网安备11010802020134号</a> <a href="">京网文[2017]1530-131号</a>
						</p>
						<p>
							<a href="">（京）网械平台备字（2018）第00005号</a> <a href="">互联网药品信息服务资格证
								(京)-非经营性-2014-0090</a> <a href="">营业执照</a> <a href="">医疗器械质量公告</a>
						</p>
						<p>
							<a href="">增值电信业务许可证</a><a href="">网络食品经营备案（京）【2018】WLSPJYBAHF-12</a><a
								href="">食品经营许可证</a>
						</p>
						<p>违法和不良信息举报电话：185-0130-1238 知识产权侵权投诉
							本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
						<p>TRUSTe Privacy Certification 诚信网站 可信网站 诚信经营 放心消费</p>
						<P>探索黑科技，小米为发烧而生</P>
						<ul>
							<li><a href=""><img src="imgs/truste.png"></a></li>
							<li><a href=""><img src="imgs/v-logo-2.png"></a></li>
							<li><a href=""><img src="imgs/v-logo-1.png"></a></li>
							<li><a href=""><img src="imgs/v-logo-3.png"></a></li>
							<li></li>
							<li></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="${ctx}/manager/js/area.js"></script>
<script src="${ctx}/manager/lib/layui-v2.5.5/layui.js?v=1.0.4" charset="utf-8"></script>
<script src="${ctx}/manager/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script type="text/javascript">
layui.use(['element', 'layer', 'layuimini','form'], function () {
    var $ = layui.jquery,
        element = layui.element,
        layer = layui.layer;
    var form = layui.form;
   // var num = $("#quantity").val();
    
    	
    $(".button").on("click", function () {
    	var total = $(".total")[0].innerHTML;
    	//layer.alert(total,{icon: 5,time:1000});
         var arr = '';
         $("input:checkbox[name='check']:checked").each(function(i){
               arr =arr+","+ $(this).val();
         });
        // layer.alert(arr);
    	if(arr!=null){

           var index = layer.open({
                title: '添加购买信息',
                type: 2,
                shade: 0.5,
                maxmin:true,
                shadeClose: true,
                area: ['500px','400px'],
                content: 'CartAction?method=payCart&arr='+arr+'&total='+total,
            });
    		//layer.alert('购买的商品！', {icon: 5,time:1000});
           
    	}else{
    		layer.alert('请选择购物车中要购买的商品！', {icon: 5,time:1000});
    	}
        return false;
    });
})

</script>
<script type="text/javascript">
function checkAll(checkall) { 
 	arr = document.getElementsByName('check' );
    if (checkall.checked == true) {   
        for(i=0;i<arr.length;i++){                 
            arr[i].checked = true;   
        }  
    }else{  
        for(i=0;i<arr.length;i++){   
            if((arr[i]).checked==false){  
                arr[i].checked = true;  
            }else {
            	arr[i].checked = false; 
            }  
        }  
    }  
    tep = 0;
    if(checkall.checked == true){tep=1;}
    $.ajax({
		type: "GET",
     	url: "CartAction?method=closeTotal",
     	data: {
			tep:tep
     	},                
     	success: function(data){
     		$(".total")[0].innerHTML = data;
     	}
	}) ;
    
}
$(".min").click(function(){ 
	var temp=document.getElementsByClassName("quantity");
	//var priceTotals=document.getElementsByClassName("priceTotal");	
	var index=$(".min").index($(this));
	var count=temp[index].value;
	if(count>0){
		count--;
		temp[index].value=count;
	 	$.ajax({            
         	type: "GET",
         	url: "CartAction?method=updateNum",
         	data: {
        	 	index: index,
        	 	count:count
         	},                
         	success: function(data){
         		$(".cartMoney")[index].innerHTML=data;
         	}
    	});
	}
});
$(".add").click(function(){ 
	var temp=document.getElementsByClassName("quantity");
//	var priceTotals=document.getElementsByClassName("priceTotal");	
	var index=$(".add").index($(this));
	//alert(index);
	var count=temp[index].value;
	count++;
	temp[index].value=count;
	$.ajax({            
     	type: "GET",
     	url: "CartAction?method=updateNum",
     	data: {
    	 	index: index,
    	 	count:count
     	},                
     	success: function(data){
     		$(".cartMoney")[index].innerHTML=data;
    	 	//location.reload() ;
     	}
	});
});
$(".delete").click(function(){ 
	var del = document.getElementsByClassName("delete");
	var index = $(".delete").index($(this));
	$.ajax({            
     	type: "GET",
     	url: "CartAction?method=deleteCart",
     	data: {
    	 	index: index
     	},                
     	success: function(data){
    	 	location.reload() ;
     	}
	});
});
//显示总数。不能刷新
$(".check").click(function(){
	arr = document.getElementsByName('check');
	var index=$(".check").index($(this));
	var total = $(".total")[0].innerHTML;
	var tep =0;
	alert("total");
	if((arr[index]).checked){tep=1;}
	//var tep = (arr[index]).checked?1:0;
	$.ajax({
		type: "GET",
     	url: "CartAction?method=closeTotal",
     	data: {
    	 	index: index,
			total: total,
			tep:tep
     	},                
     	success: function(data){
     		$(".total")[0].innerHTML = data;
     	}
	}) ;
})
</script>
</body>

</html>


