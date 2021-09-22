<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/18
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath %>"/>
    <title>新人管理</title>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#dg").datagrid({
                url: 'marriedPerson/marriedPersonInfo',//设置远程加载数据的地址
                pagination: true,//分页工具栏
                rownumbers: true,//行号的列
                checkOnSelect: false,
                pageNumber: 1,
                pageSize: 4,//设置每页显示的数量
                pageList: [2, 4, 6],
                title: "查询结果",
                columns: [[
                    {field: 'pid', title: '编号', width: 100},
                    {field: 'pname', title: '名称', width: 150},
                    {field: 'pmail', title: '邮箱', width: 100},
                    {field: 'phone', title: '手机号', width: 100},
                    {field: 'regdate', title: '注册时间', formatter:
                            function (value, row, index) {
                                return value.year+"/"+value.monthValue+"/"+value.dayOfMonth+" "+value.hour+":"+value.minute+":"+value.second;
                            }, width: 180
                    },
                    {field: 'status', title: '账号状态', formatter:
                            function (value, row, index) {
                                if(value=="1"){
                                    return "正常";
                                }else {
                                    return "禁用";
                                }

                            }, width: 100},
                ]]
            });
            $("#select").click(function () {
                $('#dg').datagrid('load',
                    {
                        pname: $("#pname").val(),
                        phone: $("#phone").val(),
                    });
            })
        })
    </script>
</head>
<body>
<div id="p" class="easyui-panel" title="新人管理"
     style="width:950px;height:500px;padding:10px;background:#fafafa;"
     data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
    <div style="width: 500px;margin:auto">
        <form id="fm" method="post" action="company/companyInfo">
            <input id="pname" class="easyui-textbox" prompt="新人名称" name="pname" style="width:100px">
            <input id="phone" class="easyui-textbox" prompt="新人手机号" name="phone" style="width:100px">
            <a id="select" href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-search'">查询</a>
        </form>
    </div>
    <table id="dg"></table>
</div>
</body>
</html>
