<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
        	<a href="../../system/index" class="easyui-linkbutton" iconCls="icon-house">Front Page</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">Add</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-bullet-edit" onclick="openEdit()" plain="true">Edit</a>
        </div>
        <div class="wu-toolbar-search">
            <label>UserName:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>Real Name:</label><input id="search-realName" class="wu-text" style="width:100px">
            <label>ID:</label><input id="search-idCard" class="wu-text" style="width:100px">
            <label>Mobile:</label><input id="search-mobile" class="wu-text" style="width:100px">
            <label>Status:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-2">All</option>
            	<option value="0">Normal</option>
            	<option value="-1">Frozen</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">Search</a>
        </div>
    </div>
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 添加弹框 -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td align="right">UserName:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
             <tr>
                <td align="right">Password:</td>
                <td><input type="password" id="add-password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Real Name:</td>
                <td><input type="text" id="add-realName" name="realName" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td align="right">ID Number:</td>
                <td><input type="text" id="add-idCard" name="idCard" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Telephone:</td>
                <td><input type="text" id="add-mobile" name="mobile" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Email:</td>
                <td><input type="email" id="add-address" name="address" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td>
	                <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<option value="0">Normal</option>
		            	<option value="-1">Frozen</option>
	            	</select>	
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
           <tr>
                <td align="right">UserName:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
             <tr>
                <td align="right">Password:</td>
                <td><input type="password" id="edit-password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Real Name:</td>
                <td><input type="text" id="edit-realName" name="realName" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td align="right">ID Number:</td>
                <td><input type="text" id="edit-idCard" name="idCard" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Telephone:</td>
                <td><input type="text" id="edit-mobile" name="mobile" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Email:</td>
                <td><input type="email" id="edit-address" name="address" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td>
	                <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<option value="0">Normal</option>
		            	<option value="-1">Frozen</option>
	            	</select>	
                </td>
            </tr>
        </table>
    </form>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
	
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","Please check your input!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','Add success!','info');
					$("#add-name").val('');
					$("#add-remark").val('');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","Please chck your input!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','Edit success!','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	function openEdit(){
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','Please choose the record!','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "Edit",
            buttons: [{
                text: 'OK',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: 'Cancel',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#edit-id").val(item.id);
            	$("#edit-name").val(item.name);
            	$("#edit-password").val(item.password);
            	$("#edit-realName").val(item.realName);
            	$("#edit-idCard").val(item.idCard);
            	$("#edit-mobile").val(item.mobile);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-address").val(item.address);
            }
        });
	}
	function openAdd(){
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "Add",
            buttons: [{
                text: 'OK',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: 'Cancel',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#add-form input").val('');
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var status = $("#search-status").combobox('getValue');
		if(status != -2){
			option.status = status;
		}
		option.realName = $("#search-realName").val();
		option.idCard = $("#search-idCard").val();
		option.mobile = $("#search-mobile").val();
		$('#data-datagrid').datagrid('reload',option);
	});
	
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'name',title:'Name',width:100,sortable:true},
			{ field:'password',title:'Password',width:100,sortable:true},
			{ field:'realName',title:'Real Name',width:100,sortable:true},
			{ field:'idCard',title:'ID',width:100,sortable:true},
			{ field:'mobile',title:'Mobile',width:100,sortable:true},
			{ field:'address',title:'Email',width:100,sortable:true},
			{ field:'status',title:'Status',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return 'Normal';
					}
					case -1:{
						return 'Frozen';
					}
				}
				return value;
			}}
		]]
	});
</script>