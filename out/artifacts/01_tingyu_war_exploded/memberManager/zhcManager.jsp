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
        function demo(inp,hid){
            $.ajax({
                url:"host/changestrong",
                type:"post",
                dataType: "json",
                data: {hid:hid,strong:inp.value},
                success:function (data) {
                    if(data.success){
                        $.messager.alert("修改权重信息",data.msg,"info");
                        $('#dg').datagrid('reload');
                    }else {
                        $.messager.alert("修改权重信息",data.msg,"error");
                    }
                }
            })
        }
        $(function () {
            $('#dg').datagrid({
                url: 'host/hostInfo',//设置远程加载数据的地址
                pagination: true,//分页工具栏
                rownumbers: true,//行号的列
                checkOnSelect:false,
                pageNumber: 1,
                pageSize: 4,//设置每页显示的数量
                pageList: [2, 4, 6],
                title: "查询结果",
                toolbar: '#tb',
                columns: [[
                    {field: "aa", checkbox: true},
                    {title: "权重", field: "strong",formatter: function (value, row, index) {
                            return  "<input type='text'value='"+value+"' style='width: 40px' onblur='demo(this,"+row.hid+")'>";
                        }, width: 100},
                    {title: "姓名", field: "hname", width: 100},
                    {title: "手机号", field: "hphone", width: 100},
                    {
                        title: "开通时间", field: "starttime",
                        formatter: function (value, row, index) {
                            return value.year + "-" + value.monthValue + "-" + value.dayOfMonth;
                        }, width: 100
                    },
                    {
                        title: "价格", field: "hpprice", formatter: function (value, row, index) {
                            if(row.hostPower!=null){
                                return row.hostPower.hpprice;
                            }else{
                                return '';
                            }

                        }, width: 100
                    },
                    {
                        title: "订单量", formatter: function (value, row, index) {
                            return row.ordernumber;
                        }, field: "ordernumber", width: 100
                    },
                    {
                        title: "折扣", field: "hpdiscount", formatter: function (value, row, index) {
                            if(row.hostPower!=null){
                                return row.hostPower.hpdiscount;
                            }else{
                                return '';
                            }

                        }, width: 100
                    },
                    {
                        title: "是否推荐", field: "hpstar", formatter: function (value, row, index) {
                            if(row.hostPower!=null){
                                var flag = "推荐"
                                if (row.hostPower.hpstar == "0") {
                                    flag = "不推荐"
                                }
                                return flag;
                            }else {
                                return '';
                            }

                        }, width: 100
                    },
                    {
                        title: "帐号状态", field: "status", formatter: function (value, row, index) {
                            var flag = "正常"
                            if (row.status == "0") {
                                flag = "禁用"
                            }
                            return flag;
                        }, width: 100
                    },

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
            $("#addHost").click(function () {
                $("#dd").dialog('open');
                $("#addH").click(function () {
                    $("#fm").form('submit',{
                        success:function (data) {
                            eval("var data="+data);
                            if(data.success){
                                $.messager.alert("添加主持人信息",data.msg,"info");
                                $("#dd").dialog('close');
                                $('#dg').datagrid('reload');
                                $("#fm").form('clear');
                            }else {
                                $.messager.alert("添加主持人信息",data.msg,"error");
                                $("#dd").dialog('close');
                                $("#fm").form('clear');
                            }
                        }
                    })
                })
            })
            $("#changestatus").click(function () {
                var list=$("#dg").datagrid('getSelections');
                if(list.length==0){
                    $.messager.alert("修改账号状态","请选中需要修改的账号","info");
                }else{
                    var hids="";
                    var statuss="";
                    for(var i=0;i<list.length;i++){
                        hids=hids+list[i].hid+",";
                        statuss=statuss+list[i].status+",";
                    }
                    $.ajax({
                        url:"host/changestatus",
                        data:{hids:hids,statuss:statuss},
                        dataType:"json",
                        type:"post",
                        success:function (msg) {
                            if(msg){
                                $.messager.alert("修改账号状态","修改账号状态成功","info");
                                $('#dg').datagrid('reload');
                            }else{
                                $.messager.alert("修改账号状态","修改账号状态失败","info");
                            }
                        }
                    })
                }
            })
            $("#addHostPower").click(function () {
                var list=$("#dg").datagrid('getSelections');
                if(list.length==1){
                    $("#dd1").dialog('open');
                    var hostpower=list[0].hostPower;
                    if(hostpower!=null){
                        $('#fm1').form('load', {
                            hpprice:6
                        });
                    }else{

                    }
                }else if(list.length>0){
                    $.messager.alert("修改用户权限信息","请选择一个用户","info");
                }else{
                    $.messager.alert("修改用户权限信息","请选择用户","info");
                }
            })


        })

    </script>
</head>
<body>
<div id="p" class="easyui-panel" title="主持人管理"
     style="width:950px;height:500px;padding:10px;background:#fafafa;"
     data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
    <div style="margin: auto;width: 700px">
        <form method="post" action="host/hostInfo">
            <input id="hname" class="easyui-textbox" prompt="姓名" name="hname" style="width:50px">
            <select id="status" class="easyui-combobox" data-options="editable:false,value:'帐号状态'" name="status"
                    style="width:100px">
                <option value="1">正常</option>
                <option value="0">禁用</option>
            </select>
            <select id="strong" class="easyui-combobox" data-options="editable:false,value:'权重的排序'" name="strong"
                    style="width:150px">
                <option value="ASC">升序</option>
                <option value="DESC">降序</option>
            </select>
            <select id="hpstar" class="easyui-combobox" data-options="editable:false,value:'是否推荐'" name="hpstart"
                    style="width:100px">
                <option value="1">推荐</option>
                <option value="0">不推荐</option>
            </select>
            <select id="hpdiscount" class="easyui-combobox" data-options="editable:false,value:'折扣'" name="hpdiscount"
                    style="width:100px">
                <option value="6">6折</option>
                <option value="7">7折</option>
                <option value="8">8折</option>
                <option value="9">9折</option>
            </select>
            <a id="select" href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-search'">查询</a>
            <a id="output" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">导出</a>
        </form>
    </div>
    <table id="dg"></table>
</div>
<div id="tb">
    <a id="addHost" hresf="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加主持人</a>
    <a id="addHostPower" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">权限设置</a>
    <a id="changestatus" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">账号禁用|启用</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量操作</a>
</div>
<%--主持人增加--%>
<div id="dd" class="easyui-dialog" title="增加主持人信息" style="width:400px;height:300px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
    <form id="fm" action="host/addhost" method="post">
        <div style="margin-bottom:20px;text-align: center;margin-top: 20px">
            <input name="hname" class="easyui-textbox" prompt="姓名" iconWidth="28" style="width:50%;height:34px;padding:10px;">
        </div>
        <div style="margin-bottom:20px;text-align: center">
            <input id="pass" name="hpwd" class="easyui-passwordbox" prompt="密码" iconWidth="28" style="width:50%;height:34px;padding:10px">
        </div>
        <div style="margin-bottom:20px;text-align: center">
            <input name="hphone" class="easyui-textbox" prompt="手机号" iconWidth="28" style="width:50%;height:34px;padding:10px;">
        </div>
        <div style="margin:20px;text-align: center">
            <a id="addH" href="javascript:void(0)" id="add" class="easyui-linkbutton c3" style="width:100px">增加</a> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</div>
<%--主持人权限增加--%>
<div id="dd1" class="easyui-dialog" title="增加主持人权限信息" style="width:600px;height:500px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
    <form id="fm1" action="host/addhostpower" method="post">
            <table style="margin: auto;margin-top: 40px;border-collapse:separate; border-spacing:0px 10px;">
                <tr>
                    <td>星推荐</td>
                    <td>
                        <input class="easyui-checkbox" name="hpstar" labelPosition="after"  value="1" label="是:">
                        <input class="easyui-checkbox" name="hpstar" labelPosition="after"  value="0" label="否:">
                    </td>
                </tr>
                <tr>
                    <td>星推日期:</td>
                    <td>
                        <input  type="text" class="easyui-datebox" name="hpstartBegindate" required="required">-
                        <input  type="text" class="easyui-datebox" name="hpstarEnddate" required="required">
                    </td>
                </tr>
                <tr>
                    <td>自填订单:</td>
                    <td>
                        <input class="easyui-checkbox" name="hpOrderPower"  labelPosition="after"  value="1" label="是:">
                        <input class="easyui-checkbox" name="hpOrderPower" labelPosition="after"  value="0" label="否:">
                    </td>
                </tr>
                <tr>
                    <td>星推时间</td>
                    <td>
                        <input  type="text" class="easyui-datebox" name="hpstarBegintime" required="required">-
                        <input  type="text" class="easyui-datebox" name="hpstarEndtime"  required="required">
                    </td>
                </tr>
                <tr>
                    <td>折扣:</td>
                    <td>
                        <input name="hpdiscount" class="easyui-textbox"  iconWidth="28" style="width:50%;height:30px;padding:10px;">
                    </td>
                </tr>
                <tr>
                    <td>折扣时间:</td>
                    <td>
                        <input name="hpDisStarttime"  type="text" class="easyui-datebox" required="required">-
                        <input name="hpDisEndtime" type="text" class="easyui-datebox" required="required">
                    </td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td>
                        <input name="hpprice" class="easyui-textbox"  iconWidth="28" style="width:50%;height:30px;padding:10px;">
                    </td>
                </tr>
                <tr>
                    <td>管理费</td>
                    <td>
                        <input name="hname" class="easyui-textbox"  iconWidth="28" style="width:50%;height:30px;padding:10px;">
                    </td>
                </tr>
                <tr>
                   <td colspan="2">
                       <a href="javascript:void(0)" id="addhostpower1" class="easyui-linkbutton c3" style="width:120px">修改权限信息</a>
                   </td>
                </tr>
            </table>
    </form>
</div>

</div>
</body>
</html>
