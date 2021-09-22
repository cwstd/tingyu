<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/22
  Time: 9:48
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
    <title>菜单操作</title>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <script>
        $(function () {
            $('#tt').tree({
                url:'menu/menuAllInfo'
            });
            $("#reload").click(function () {
                $("#tt").tree('reload');
            });
            //新增节点
            $("#addMenu").click(function () {
                var node=$("#tt").tree('getSelected');
                $("#mid").textbox('setValue',node.id)
                $("#dd").dialog('open');
                $("#addmenu2").click(function () {
                    $("#fm2").form('submit',{
                        success:function (data) {
                            eval("var data="+data);
                            if(data.success){
                                $.messager.alert("增加菜单",data.msg,"info");
                                $("#dd").dialog('close');
                                $("#fm2").form('clear');
                            }else {
                                $.messager.alert("增加菜单",data.msg,"error");
                                $("#dd").dialog('close');
                                $("#fm2").form('clear');
                            }
                        }
                    })
                })
            })
            //修改菜单
            $("#changeMenu").click(function () {

                var node=$("#tt").tree('getSelected');
                // 数据回显
                $("#pid").textbox('setValue',node.id);
                $("#mname").textbox('setValue',node.text);
                $("#url").textbox('setValue',node.map.url);
                $("#mdesc").textbox('setValue',node.map.mdesc);
                $("#dd2").dialog('open');
                $("#changemenu2").click(function () {
                    // 提交表单
                    $("#fm3").form('submit',{
                        success:function (data) {
                            eval("var data="+data);
                            if(data.success){
                                $.messager.alert("修改菜单",data.msg,"info");
                                $("#dd2").dialog('close');
                                $("#fm3").form('reset');
                            }else{
                                $.messager.alert("修改菜单",data.msg,"error");
                                $("#dd2").dialog('close');
                                $("#fm3").form('reset');
                            }
                        }
                    })
                })
            })
            $("#remove").click(function () {
                var node=$("#tt").tree('getSelected');
                if(node.map.isparent=="0"){
                    $.ajax({
                        url:"menu/deleMenu" ,
                        data:{mid:node.id},
                        dataType:"json",
                        type:"post",
                        success:function (data) {
                            if(data.success){
                                $.messager.alert("清除菜单",data.msg,"info");
                            }else{
                                $.messager.alert("清除菜单",data.msg,"error");
                            }
                        }
                    })
                }else{
                    $.messager.alert("删除菜单","此菜单有子菜单无法删除！","error");
                }
            })
        })

    </script>
</head>
<body>
<div style="margin:20px 0 10px 0;"></div>
<div class="easyui-panel" title="菜单管理" style="width:850px;height:500px;padding:10px;">
    <div class="easyui-layout" data-options="fit:true,doSize:false,split:false">
        <div data-options="region:'west',split:true,doSize:false,split:false" style="width:150px;padding:10px">
            <table style="margin: auto;margin-top: 20px;border-collapse:separate; border-spacing:0px 30px;">
                <tr>
                    <td> <a id="addMenu" href="javascript:void(0)" class="easyui-linkbutton" data-options="">增加菜单</a></td>
                </tr>
                <tr>
                    <td><a id="changeMenu" href="javascript:void(0)" class="easyui-linkbutton" data-options="">编辑菜单</a></td>
                </tr>
                <tr>
                    <td><a id="remove" href="javascript:void(0)" class="easyui-linkbutton" data-options="">清除菜单</a></td>
                </tr>
                <tr>
                    <td><a id="reload" href="javascript:void(0)" class="easyui-linkbutton" data-options="">刷新菜单</a></td>
                </tr>
            </table>
        </div>
        <div data-options="region:'center',doSize:false,split:false" style="padding:10px">
            <ul id="tt"></ul>
        </div>
    </div>
</div>
<div id="dd" class="easyui-dialog" title="增加公司" style="width:450px;height:300px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
    <form id="fm2" action="menu/addMenu" method="post">
        <table style="margin: auto;margin-top: 35px;border-collapse:separate; border-spacing:0px 10px;">
            <td><input id="mid" name="pid" class="easyui-textbox" type="hidden"></td>
            <tr>
                <td>菜单名称:</td>
                <td><input name="mname" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>菜单URL:</td>
                <td><input name="url" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>菜单描述:</td>
                <td><input name="mdesc" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td colspan="2"> <a href="javascript:void(0)" id="addmenu2" class="easyui-linkbutton c3" style="width:120px">完成添加</a></td>
            </tr>
        </table>
    </form>
</div>
<div id="dd2" class="easyui-dialog" title="增加公司" style="width:450px;height:300px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true">
    <form id="fm3" action="menu/changeMenu" method="post">
        <table style="margin: auto;margin-top: 35px;border-collapse:separate; border-spacing:0px 10px;">
            <td><input id="pid" name="mid" class="easyui-textbox" type="hidden"></td>
            <tr>
                <td>菜单名称:</td>
                <td><input id="mname" name="mname" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>菜单URL:</td>
                <td><input id="url" name="url" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td>菜单描述:</td>
                <td><input id="mdesc" name="mdesc" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
            </tr>
            <tr>
                <td colspan="2"> <a href="javascript:void(0)" id="changemenu2" class="easyui-linkbutton c3" style="width:120px">完成修改</a></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
