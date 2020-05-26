<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>网上书城</title>
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
		<c:if test="${ empty cartsList}">
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
	<%@ include file="include/bottom.jsp" %>
<%--	这是地区插件  --%>
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


