<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.layui-table-cell{
	height:auto;
	line-height:50px;
}
</style>
<body>
<div class="layuimini-container layui-anim layui-anim-upbit">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">图书名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">作者</label>
                            <div class="layui-input-inline">
                                <input type="text" name="author" autocomplete="off" class="layui-input"><!-- autocomplete允许浏览器自动填充 -->
                            </div>
                        </div>
                        <div class="layui-inline">
                            <a type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</a>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm data-add-btn" data-content-href="page/user-setting.html"> 添加图书</button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
        <script type="text/html" id="selectDictName">
    			<select name="dictName" lay-filter="dictName" data-value="{{d.dictName}}">
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
            url: 'BooksAction?method=booksList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
               // {type: "checkbox", width: 50, fixed: "left"},
                {field: 'bookId', title: '图书号',hide:true},
                {field: 'image',  title: '图片',width:150, sort: true,align:"center", templet:function(d){
                	return "<img src = '"+d.image+"' style = 'height:90px;'>"
                }},
                {field: 'title', title: '书名',align:"center"},
                {field: 'author',title: '作者',align:"center", sort: true},
                {field: 'publisherId',title: '出版社',align:"center", sort: true},
                {field:	'categoryId',title:'类型',align:"center",sort: true},
                {field:	'publisherDate',title:'出版时间',align:"center"},
                {field: 'unitPrice', title: '价格',align:"center"},
              	{field: 'clicks', title: '关注度', align: "center", sort: true},
               	{field: 'num',  title: '数量',align:'center',sort:true},
                {title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
            ]],
            limits: [5, 10, 15, 20, 25, 30],
            limit: 5,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            var title = data.field.title  ;
      	 	 var author  = data.field.author;
            layer.alert(result, {
                title: '最终的搜索信息'
            });

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    //searchParams: result
                    title:title,
                    author:author
                }
            });

            return false;
        });

        // 监听添加操作
        $(".data-add-btn").on("click", function () {
           var content = layuimini.getHrefContent('page/table/bookAdd.jsp');
            var openWH = layuimini.getOpenWidthHeight();
            var index = layer.open({
                title: '添加图书',
                type: 1,
                shade: 0.2,
                maxmin:true,
                shadeClose: true,
                area: [openWH[0] + 'px', openWH[1] + 'px'],
                offset: [openWH[2] + 'px', openWH[3] + 'px'],
                content: content,
            });
            $(window).on("resize", function () {
                layer.full(index);
            });

            return false;
        });

        // 监听删除操作
        $(".data-delete-btn").on("click", function () {
            var checkStatus = table.checkStatus('currentTableId')
                , data = checkStatus.data;
            layer.alert(JSON.stringify(data));
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
             	//var content = layuimini.getHrefContent('');
                var openWH = layuimini.getOpenWidthHeight();
                var index = layer.open({
                    title: '编辑图片',
                    type: 2,
                    shade: 0.5,
                    maxmin:true,
                   shadeClose: true,
                    area: ['50%', '50%'],
                   offset: [openWH[2] + 'px', openWH[3] + 'px'],
                    content: 'BooksAction?method=getOne&bookId='+data.bookId
                });
                $(window).on("resize", function () {
                    layer.full(index);
                }); 
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                	 $.ajax({
                         type: "post",
                         url: "BooksAction?method=delete",
                         dataType:'json',
                         data: "bookId="+data.bookId,
                         dataType: "json",
                         success: function (data) {
                        	 if(data.code == 0)
                                 layer.alert('删除成功',{icon: 1,time:2000});
                                 return;
                         },
                         error: function () {
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
</html>