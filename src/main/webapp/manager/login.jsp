<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>网上图书销售商城-登陆</title>
    <link rel="stylesheet" href="lib/layui-v2.5.5/css/layui.css" media="all">
    <style>
        body {background-image:url("images/bg.jpg");height:100%;width:100%;}
        #container{height:100%;width:100%;}
        input:-webkit-autofill {-webkit-box-shadow:inset 0 0 0 1000px #fff;background-color:transparent;}
        .admin-login-background {width:300px;height:300px;position:absolute;left:50%;top:40%;margin-left:-150px;margin-top:-100px;}
        .admin-header {text-align:center;margin-bottom:20px;color:#ffffff;font-weight:bold;font-size:40px}
        .admin-input {border-top-style:none;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;height:50px;width:300px;padding-bottom:0px;}
        .admin-input::-webkit-input-placeholder {color:#a78369}
        .layui-icon-username {color:#a78369 !important;}
        .layui-icon-username:hover {color:#9dadce !important;}
        .layui-icon-password {color:#a78369 !important;}
        .layui-icon-password:hover {color:#9dadce !important;}
        .admin-input-username {border-top-style:solid;border-radius:10px 10px 0 0;}
        .admin-input-verify {border-radius:0 0 10px 10px;}
        .admin-button {margin-top:20px;font-weight:bold;font-size:18px;width:300px;height:50px;border-radius:5px;background-color:#a78369;border:1px solid #d8b29f}
        .admin-icon {margin-left:260px;margin-top:10px;font-size:30px;}
        i {position:absolute;}
        .admin-captcha {position:absolute;margin-left:205px;margin-top:-40px;}
    </style>
</head>
<body>
<div id="container layui-anim layui-anim-upbit">
    <div></div>
    <div class="admin-login-background">
        <div class="admin-header">
            <span>图书商城登录</span>
        </div>
        <form class="layui-form" action="">
            <div>
                <i class="layui-icon layui-icon-username admin-icon"></i>
                <input type="text" name="userName" placeholder="请输入用户名" autocomplete="off" class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon"></i>
                <input type="password" name="userPass" placeholder="请输入密码" autocomplete="off" class="layui-input admin-input">
            </div>
            <div>
                <input type="text" name="captcha" placeholder="请输入验证码" autocomplete="off" class="layui-input admin-input admin-input-verify input-val" value="">
                <canvas class="admin-captcha" id="canvas"  width="90" height="30"></canvas>
            </div>
            <p><a href="register.jsp" class="fl">立即注册</a>&nbsp&nbsp|&nbsp&nbsp<a href="retrieve.jsp" class="fr">忘记密码？</a></p>
            <button class="layui-btn admin-button" lay-submit="" lay-filter="login">登 陆</button>
        	
        </form>
    </div>
</div>
<script src="lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
	
    layui.use(['form'], function () {
        var form = layui.form,
       		 $ = layui.jquery,
            layer = layui.layer;
        if(''!='${msg}'){
        	layer.msg('${msg}');
        }
        var show_num=[];
        $(function(){
        	draw(show_num);
        	$("#canvas").on('click',function(){
        		draw(show_num);
        		})
        	})

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;
        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            var val = $(".input-val").val().toLowerCase();
            var num = show_num.join("");
            if (data.userName=='') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.userPass =='') {
                layer.msg('密码不能为空');
                return false;
            }
            if(val ==''){
            	layer.msg('请输入验证码',{icon:7,time:2000},function(){	})
            	return false;
            }else if(val !=num){
            	layer.msg('验证码输入错误,请重新再输',{icon:5,time:2000},function(){});
            	$(".input-val").val('');
            	draw(show_num);
            	return false;
            }
            layer.msg('登录中', function () {
                window.location = "LoginAction?userName="+data.userName+"&userPass="+data.userPass;
            });
            return false;
        });
        function draw(show_num) {
            var canvas_width = $('#canvas').width();
            var canvas_height = $('#canvas').height();
            var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
            var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
            canvas.width = canvas_width;
            canvas.height = canvas_height;
            var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
            var aCode = sCode.split(",");
            var aLength = aCode.length;//获取到数组的长度

            for (var i = 0; i <= 3; i++) {
                var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
                var deg = Math.random() * 30 * Math.PI /180;
                var txt = aCode[j];//得到随机的一个内容
                show_num[i] = txt.toLowerCase();
                var x = 10 + i * 20;//文字在canvas上的x坐标
                var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
                context.font = "bold 23px 微软雅黑";

                context.translate(x, y);
                context.rotate(deg);

                context.fillStyle = randomColor();
                context.fillText(txt, 0, 0);

                context.rotate(-deg);
                context.translate(-x, -y);
            }
            for (var i = 0; i <= 5; i++) { //验证码上显示线条
                context.strokeStyle = randomColor();
                context.beginPath();
                context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
                context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
                context.stroke();
            }
            for (var i = 0; i <= 30; i++) { //验证码上显示小点
                context.strokeStyle = randomColor();
                context.beginPath();
                var x = Math.random() * canvas_width;
                var y = Math.random() * canvas_height;
                context.moveTo(x, y);
                context.lineTo(x + 1, y + 1);
                context.stroke();
            }
        }

        function randomColor() {//得到随机的颜色值
            var r = Math.floor(Math.random() * 256);
            var g = Math.floor(Math.random() * 256);
            var b = Math.floor(Math.random() * 256);
            return "rgb(" + r + "," + g + "," + b + ")";
        }
    });
</script>
</body>
</html>