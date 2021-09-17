<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/17
  Time: 10:11
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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <script>
        $(function () {
            // 添加工具窗口
            $("#tb").datagrid({toolbar: "#tb"});
            $('#dg').datagrid({
                url: 'company/companyInfo',//设置远程加载数据的地址
                pagination: true,//分页工具栏
                rownumbers: true,//行号的列
                checkOnSelect: false,
                pageNumber: 1,
                pageSize: 4,//设置每页显示的数量
                pageList: [2, 4, 6],
                title: "查询结果",
                toolbar: '#tb',
                columns: [[
                    {field: 'cid', title: '编号', width: 100},
                    {field: 'cname', title: '公司名称', width: 150},
                    {field: 'ceo', title: '公司法人', width: 100},
                    {field: 'cphone', title: '手机号', width: 100},
                    {field: 'starttime', title: '开通时间', formatter:
                            function (value, row, index) {
                            return value.year+"/"+value.monthValue+"/"+value.dayOfMonth+" "+value.hour+":"+value.minute+":"+value.second;
                        }, width: 180
                    },
                    {field: 'ordernumber', title: '订单量', width: 100},
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
                        cname: $("#cname").val(),
                        ordernumber: $("#ordernumber").val(),
                        status: $("#status").val(),
                    });
            })
            // 增加公司
            $("#addCompany").click(function () {
                $("#dd").dialog('open');
                $("#addCompany2").click(function () {
                    $("#fm2").form('submit',{
                        success:function (data) {
                            eval("var data="+data);
                            if(data.success){
                                $.messager.alert("增加公司",data.msg,"info");
                                $("#dd").dialog('close');
                                $('#dg').datagrid('reload');
                                $("#fm2").form('clear');
                            }else{
                                $.messager.alert("增加公司",data.msg,"error");
                                $("#dd").dialog('close');
                                $("#fm2").form('clear');
                            }
                        }
                    })
                })
            })
            $("#changestatus").click(function () {
                ;
                var a=$("#dg").datagrid('getSelections');
                console.log(a)
                if(a.length>0){
                    $("#dd1").dialog('open')
                    $("#changecstatus").click(function () {
                        var cids="";
                        for(var i=0;i<a.length;i++){
                            cids=cids+a[i].cid+",";
                        }
                        $("#cids").textbox('setValue',cids)
                        $("#fm3").form('submit',{
                            success:function (data) {
                                eval("var data="+data);
                                if(data.success){
                                    $.messager.alert("修改公司状态",data.msg,"info");
                                    $("#dd1").dialog('close');
                                    $('#dg').datagrid('reload');
                                    $("#fm3").form('clear');
                                }else{
                                    $.messager.alert("修改公司状态",data.msg,"error");
                                    $("#dd1").dialog('close');
                                    $("#fm3").form('clear');
                                }
                            }
                        })
                    })
                }else{
                    $.messager.alert("修改公司状态","请至少选择一个公司","error");
                }
            })
            $("#plannerlist").click(function () {
                $("#dd2").dialog('open');
                $('#dg2').datagrid({
                    url: 'planner/plannerInfo',//设置远程加载数据的地址
                    pagination: true,//分页工具栏
                    rownumbers: true,//行号的列
                    checkOnSelect: false,
                    pageNumber: 1,
                    pageSize: 4,//设置每页显示的数量
                    pageList: [2, 4, 6],
                    title: "查询结果",
                    columns: [[
                        {field: 'nid', title: '编号', width: 100},
                        {field: 'nname', title: '策划师姓名', width: 150},
                        {field: 'nphone', title: '手机号', width: 100},
                        {field: 'addtime', title: '入职时间', formatter:
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
                        {field: 'ordernumber', title: '订单量', width: 100},
                    ]]
                });
            })
        })
    </script>
</head>
<body>
<div id="p" class="easyui-panel" title="婚庆公司管理"
     style="width:950px;height:500px;padding:10px;background:#fafafa;"
     data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
    <div style="width: 500px;margin:auto">
        <form id="fm" method="post" action="company/companyInfo">
            <input id="cname" class="easyui-textbox" prompt="公司名称" name="cname" style="width:100px">
            <select id="status" class="easyui-combobox" data-options="editable:false,value:'帐号状态'" name="status"
                    style="width:100px">
                <option value="1">正常</option>
                <option value="0">禁用</option>
            </select>
            <select id="ordernumber" class="easyui-combobox" data-options="editable:false,value:'订单量排序'" name="ordernumber"
                    style="width:150px">
                <option value="ASC">升序</option>
                <option value="DESC">降序</option>
            </select>
            <a id="select" href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-search'">查询</a>
        </form>
    </div>
    <table id="dg"></table>
</div>
<div id="tb">
    <a id="addCompany" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加公司</a>
    <a id="addHostPower" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">编辑公司</a>
    <a id="plannerlist" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">策划师列表</a>
    <a id="changestatus" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">账号状态</a>
</div>

<div id="dd" class="easyui-dialog" title="增加公司" style="width:450px;height:400px;"
data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
    <form id="fm2" action="company/addCompany" method="post">
        <table style="margin: auto;margin-top: 35px;border-collapse:separate; border-spacing:0px 10px;">
            <tr>
                <td>公司名称:</td>
                <td><input name="cname" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>账号密码:</td>
                <td><input name="cpwd" class="easyui-passwordbox "  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>公司法人</td>
                <td><input name="ceo" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>公司座机</td>
                <td><input name="cphone" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>公司邮箱</td>
                <td><input name="cmail" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td colspan="2"> <a href="javascript:void(0)" id="addCompany2" class="easyui-linkbutton c3" style="width:120px">添加公司</a></td>
            </tr>
        </table>
    </form>
</div>
<div id="dd1" class="easyui-dialog" title="修改公司状态" style="width:250px;height:250px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
        <form id="fm3" action="company/changeStatus" method="post">
            <table style="margin: auto;margin-top: 35px;border-collapse:separate; border-spacing:0px 10px;">
                <input id="cids" name="cids" class="easyui-textbox" type="hidden">
                <tr>
                    <td>
                        <input id="cstatus_yes" class="easyui-radiobutton" name="status" labelPosition="before"  value="1" label="正常:">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="cstatus_no" class="easyui-radiobutton" name="status" labelPosition="before"  value="0" label="禁用:">
                    </td>
                </tr>
                <tr>
                    <td><a href="javascript:void(0)" id="changecstatus" class="easyui-linkbutton c3" style="width:120px">修改公司状态</a></td>
                </tr>
            </table>
        </form>
</div>
<div id="dd2" class="easyui-dialog" title="策划师列表" style="width:600px;height:350px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
    <table id="dg2"></table>
</div>

</body>
</html>
