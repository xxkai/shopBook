<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="layuimini-container layui-anim layui-anim-upbit">
    <div class="layuimini-main">      
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-btn data-add-btn"> 添加用户 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>  
		<script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
    </div>
</div>
<script>
    layui.use(['form', 'table','layuimini','element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layuimini = layui.layuimini;

        table.render({
            elem: '#currentTableId',
            url: 'PublishersAction?method=getList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
               // {type: "checkbox", width: 50, fixed: "left"},
                {field: 'publisherId',  title: '出版社编号', sort: true},
                {field: 'publisherName',  title: '出版社名', sort: true},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            page: false
        });
        // 监听搜索操作
        // 监听添加操作
        $(".data-add-btn").on("click", function () {

            var content = layuimini.getHrefContent('page/table/publishersAdd.jsp');
            var openWH = layuimini.getOpenWidthHeight();

            var index = layer.open({
                title: '添加出版社',
                type: 1,
                shade: 0.2,
                maxmin:true,
                shadeClose: true,
                area: ['500px','200px'],
                offset: [openWH[2] + 'px', openWH[3] + 'px'],
                content: content,
            });
            $(window).on("resize", function () {
                layer.full(index);
            });

            return false;
        });
        //监听表格复选框选择
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
           if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                	 $.ajax({
                         type: "post",
                         url: "PublishersAction?method=delete",
                         dataType:'json',
                         data: "publisherId="+data.publisherId,
                         dataType: "json",
                         success: function (data) {
								if(data.code = 0){
									layer.alert(data.msg,{icon: 1,time:2000});	
								}
                         }
                     })
                        obj.del();
                        layer.close(index);
                });
            }
        });

    });
</script>
</body>
</body>
</html>