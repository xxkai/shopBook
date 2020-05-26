<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>网上图书商城</title>
		<!-- 首页的css -->
		<link rel="stylesheet" type="text/css" href="${ctx}/bookShop/css/index.css" />
		<!-- 字体图标样式 -->
		<link rel="stylesheet" href="${ctx}/bookShop/font/iconfont.css" />
	</head>
	<body>
    <div class="page-foot">
        <div class="container">
            <ul class="ts">
                <li><a href=""><i class="iconfont icon-weixiu"></i>书山有路勤为径</a></li>
                <li><a href=""><i class="iconfont icon-sevenday-copy"></i>学海无涯苦作舟</a></li>
                <li><a href=""><i class="iconfont icon-tian"></i>立身以立学为先</a></li>
                <li><a href=""><i class="iconfont icon-libao"></i>立学以读书为本</a></li>
                <li><a href=""><i class="iconfont icon-zuobiao"></i>小凯书城</a></li>
            </ul>
            <div class="bot">
                <div class="container">
                    <div class="txt">
                        <h3 class="list">
                            <a href="">小凯书城</a><span>|</span>
                        </h3>
                        <p>TRUSTe Privacy Certification 诚信网站 可信网站 诚信经营 放心消费</p>
                        <P>探索知识，畅游知识海洋</P>
                        <P style="height: 30px"></P>

                    </div>

                </div>
            </div>
        </div>
    </div>

	<!-- 固定悬浮导航栏 -->
	<div id="right-gd">
		<div id="Last-top">
			<a href="#" id="hdSy" >
				<p class="iconfont icon-top"></p>
				<p class="p2">回到首页</p>
			</a>
		</div>
	</div>
	</body>

</html>
