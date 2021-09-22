<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/22
  Time: 15:34
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
    <title>角色管理</title>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#dg").datagrid({
                url: 'role/roleInfo',//设置远程加载数据的地址
                pagination: true,//分页工具栏
                rownumbers: true,//行号的列
                checkOnSelect: false,
                pageNumber: 1,
                pageSize: 4,//设置每页显示的数量
                pageList: [2, 4, 6],
                toolbar: '#tb',
                title: "查询结果",
                columns: [[
                    {field: "aa", checkbox: true},
                    {field: 'rid', title: '角色编号', width: 100},
                    {field: 'rname', title: '角色名称', width: 100},
                    {field: 'rdesc', title: '角色描述', width: 200},
                ]]
            });
            $("#addrole").click(function () {
                $("#dd").dialog('open');
                $('#tt').tree({
                    url:'menu/menuAllInfo2',
                    checkbox:'true'
                });
                $("#addRole2").click(function () {
                   var nodes=$("#tt").tree('getChecked', ['checked','indeterminate']);
                   var mids="";
                   for(var i=0;i<nodes.length;i++){
                       mids=mids+nodes[i].id+",";
                   }
                   $("#mids").textbox('setValue',mids);
                   $("#fm2").form('submit',{
                       success:function (data) {
                           eval("var data="+data);
                           if(data.success){
                               $.messager.alert("添加角色",data.msg,"info");
                               $("#dd").dialog('close');
                               $('#dg').datagrid('reload');
                               $("#fm2").form('reset');
                           }else{
                               $.messager.alert("添加角色",data.msg,"error");
                               $("#dd").dialog('close');
                               $("#fm2").form('reset');
                           }
                       }
                   })
                })

            })
            $('#tt1').tree({
                url:'menu/menuAllInfo2',
                checkbox:'true'
            });
            //更新角色信息
            $("#changerole").click(
                function () {
                    var data= $("#dg").datagrid('getSelected');
                    $("#dd1").dialog('open')
                    $("#rname").textbox('setValue',data.rname);
                    $("#rdesc").textbox('setValue',data.rdesc);
                    $("#rid").textbox('setValue',data.rid);
                    console.log(data)
                    var arry=data.list;
                    for(var i=0;i<arry.length;i++){
                        var node = $('#tt1').tree('find', arry[i]);
                        $('#tt1').tree('check', node.target);
                    }
                }
            )
            $("#updateRole").click(function () {
                var nodes=$("#tt1").tree('getChecked', ['checked','indeterminate']);
                var mids="";
                for(var i=0;i<nodes.length;i++){
                    mids=mids+nodes[i].id+",";
                }
                $("#mids2").textbox('setValue',mids);
                $("#fm3").form('submit',{
                    success:function (data) {
                        eval("var data="+data);
                        if(data.success){
                            $.messager.alert("更新角色",data.msg,"info");
                            $("#dd").dialog('close');
                            $('#dg').datagrid('reload');
                            $("#fm2").form('reset');
                        }else{
                            $.messager.alert("更新角色",data.msg,"error");
                            $("#dd").dialog('close');
                            $("#fm2").form('reset');
                        }
                    }
                })

            })
            //删除角色
            $("#deleterole").click(function () {
                var data= $("#dg").datagrid('getSelected');
                $.ajax({
                    url:"role/deleteRole",
                    dataType:"json",
                    data:{rid:data.rid},
                    type:"post",
                    success:function (data) {
                        if(data.success){
                            $.messager.alert("删除角色",data.msg,"info");
                            $('#dg').datagrid('reload');
                        }else{
                            $.messager.alert("删除角色",data.msg,"error");
                        }
                    }
                })
            })

        })
    </script>
</head>
<body>
<div id="p" class="easyui-panel" title="角色管理"
     style="width:950px;height:500px;padding:10px;background:#fafafa;"
     data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
    <table id="dg"></table>
</div>
<div id="tb">
    <a id="addrole" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加角色</a>
    <a id="changerole" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">更新角色</a>
    <a id="deleterole" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除角色</a>
</div>
<div id="dd" class="easyui-dialog" title="增加角色" style="width:700px;height:600px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true,split:false">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false" title="请输入要增加的角色信息" style="width:400px;padding:10px">
            <form id="fm2" action="role/addRole" method="post">
                <table style="margin: auto;margin-top: 35px;border-collapse:separate; border-spacing:0px 10px;">
                    <td><input id="mids" name="mids" class="easyui-textbox" type="hidden"></td>
                    <tr>
                        <td>角色名称:</td>
                        <td><input name="rname" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
                    </tr>
                    <tr>
                        <td>角色描述:</td>
                        <td><input name="rdesc" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <a href="javascript:void(0)" id="addRole2" class="easyui-linkbutton c3" style="width:120px">完成添加</a></td>
                    </tr>
                </table>
            </form>
        </div>
        <div data-options="region:'center',split:false" title="选择角色菜单" style="padding:10px">
            <ul id="tt"></ul>
        </div>
    </div>
</div>

<div id="dd1" class="easyui-dialog" title="增加角色" style="width:700px;height:600px;"
     data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true,split:false">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false" title="请输入要增加的角色信息" style="width:400px;padding:10px">
            <form id="fm3" action="role/updateRole" method="post">
                <table style="margin: auto;margin-top: 35px;border-collapse:separate; border-spacing:0px 10px;">
                    <td><input id="mids2" name="mids" class="easyui-textbox" type="hidden"></td>
                    <td><input id="rid" name="rid" class="easyui-textbox" type="hidden"></td>
                    <tr>
                        <td>角色名称:</td>
                        <td><input id="rname" name="rname" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
                    </tr>
                    <tr>
                        <td>角色描述:</td>
                        <td><input id="rdesc" name="rdesc" class="easyui-textbox"  iconWidth="28" style="width:200px;height:30px;padding:10px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <a href="javascript:void(0)" id="updateRole" class="easyui-linkbutton c3" style="width:120px">完成添加</a></td>
                    </tr>
                </table>
            </form>
        </div>
        <div data-options="region:'center',split:false" title="选择角色菜单" style="padding:10px">
            <ul id="tt1"></ul>
        </div>
    </div>
</div>
</body>
</html>
