<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/14
  Time: 15:54
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
    <title>主持人管理</title>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#dg').datagrid({
                url: 'host/hostInfo',//设置远程加载数据的地址
                pagination:true,//分页工具栏
                rownumbers:true,//行号的列
                pageNumber:1,
                pageSize:4,//设置每页显示的数量
                pageList:[2,4,6],
                title:"查询结果",
                toolbar: '#tb',
                columns:[[
                    {field:"aa",checkbox:true},
                    {title:"权重",field:"strong",width:100},
                    {title:"姓名",field:"hname",width:100},
                    {title:"手机号",field:"hphone",width:100},
                    {title:"开通时间",field:"starttime",
                        formatter: function(value,row,index){
                        return value.year+"-"+value.monthValue+"-"+value.dayOfMonth;
                        },width:100},
                    {title:"价格",field:"hpprice",formatter: function(value,row,index){
                            return row.hostPower.hpprice;
                        },width:100},
                    {title:"订单量",formatter: function(value,row,index){
                            return row.ordernumber;
                        },field:"ordernumber",width:100},
                    {title:"折扣",field:"hpdiscount",formatter: function(value,row,index){
                            return row.hostPower.hpdiscount;
                        },width:100},
                    {title:"是否推荐",field:"hpstar",formatter: function(value,row,index){
                            var flag="推荐"
                        if(row.hostPower.hpstar=="0"){
                                 flag="不推荐"
                            }
                            return flag;
                        },width:100},
                    {title:"帐号状态",field:"status",formatter: function(value,row,index){
                            var flag="正常"
                            if(row.hostPower.hpstar=="0"){
                                flag="禁用"
                            }
                            return flag;
                        },width:100},

                ]]
            });
            $("#select").click(function () {
                $('#dg').datagrid('load',
                    {
                        hname: $("#hname").val(),
                        strong: $("#strong").val(),
                        status: $("#status").val(),
                        hpstar: $("#hpstar").val(),
                        hpdiscount: $("#hpdiscount").val()
                    });
            })
        })

    </script>
</head>
<body>
<div id="p" class="easyui-panel" title="主持人管理"
     style="width:950px;height:500px;padding:10px;background:#fafafa;"
     data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
    <div style="margin: auto;width: 700px" >
        <form method="post" action="host/hostInfo">
            <input id="hname" class="easyui-textbox" prompt="姓名" name="hname" style="width:50px">
            <select id="status" class="easyui-combobox" data-options="editable:false,value:'帐号状态'" name="status" style="width:100px">
                <option value="1">正常</option>
                <option value="0">禁用</option>
            </select>
            <select id="strong" class="easyui-combobox" data-options="editable:false,value:'权重的排序'" name="strong" style="width:150px">
                <option value="ASC">升序</option>
                <option value="DESC">降序</option>
            </select>
            <select id="hpstar" class="easyui-combobox" data-options="editable:false,value:'是否推荐'" name="hpstart" style="width:100px">
                <option value="1">推荐</option>
                <option value="0">不推荐</option>
            </select>
            <select id="hpdiscount" class="easyui-combobox" data-options="editable:false,value:'折扣'" name="hpdiscount" style="width:100px">
                <option value="6">6折</option>
                <option value="7">7折</option>
                <option value="8">8折</option>
                <option value="9">9折</option>
            </select>
            <a id="select" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
            <a id="output" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">导出</a>
        </form>
    </div>
    <table id="dg"></table>
</div>
<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加主持人</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">权限设置</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">账号禁用</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量操作</a>
</div>


</body>
</html>
