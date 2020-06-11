<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
        	<a href="../../system/index" class="easyui-linkbutton" iconCls="icon-house">Front Page</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-bullet-edit" onclick="openEdit()" plain="true">Edit</a>
        </div>
        <div class="wu-toolbar-search">
            <label>ID:</label><input id="search-id" class="wu-text" style="width:100px">
            <label>Text:</label><input id="search-text" class="wu-text" style="width:100px">
            <label>Type:</label>
            <select id="search-feedType" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">All</option>
            	<option value="0">Complaint</option>
            	<option value="1">Repairs</option>
            	<option value="2">Praise</option>
            </select>
            <label>Status:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">All</option>
            	<option value="0">No Reply</option>
            	<option value="1">Have Solved</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">Search</a>
        </div>
    </div>
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
            <tr>
                <td align="right">Name:</td>
                <td>
	                <select id="edit-createId" name="createId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<c:forEach items="${accountList}" var="account">
		            	<option value="${account.id }" real-name="${account.realName }" id-card="${account.idCard }" mobile="${account.mobile }">${account.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">Type:</td>
                <td>
	                <select id="edit-type" name="feedType" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'Please choose status'">
		            	<option value="0">Complaint</option>
		            	<option value="1">Repairs</option>
		            	<option value="2">Praise</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td width="60" align="right">Photo:</td>
                <td valign="middle">
                	<img id="edit-preview-photo" style="float:left;" src="/Project/resources/admin/images/photograph.jpg" width="100px">
                </td>
            </tr>
            <tr>
             	<td align="right">Source:</td>
                <td><input type="text" id="edit-photo" name="photo" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td align="right">Content:</td>
                <td><textarea id="edit-content" name="text" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
            <tr>
                <td align="right">Reply:</td>
                <td><textarea id="edit-reply" name="feedback" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
	
	
	
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","Please check your input!","warning");
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
            	$("#edit-createId").combobox('setValue',item.createId);
            	$("#edit-content").val(item.text);
            	$("#edit-photo").val(item.photo);
            	$("#edit-preview-photo").attr('src',item.photo);
            	$("#edit-reply").val(item.feedback);
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {createId:$("#search-id").val()};
		var status = $("#search-status").combobox('getValue');
		var feedType = $("#search-feedType").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		if(feedType != -1){
			option.feedType = feedType;
		}
		option.text = $("#search-text").val();
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
			{ field:'createId',title:'AccountId',width:100,sortable:true},
			{ field:'text',title:'Content',width:100,sortable:true},
			{ field:'photo',title:'Photo',width:100,sortable:true},
			{ field:'feedType',title:'Type',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return 'Complaint';
					}
					case 1:{
						return 'Repairs';
					}
					case 2:{
						return 'Praise';
					}
				}
				return value;
			}},
			{ field:'createTime',title:'CreateTime',width:100,sortable:true},
			{ field:'handleTime',title:'HandleTime',width:100,sortable:true},
			{ field:'status',title:'Status',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return 'No Reply.';
					}
					case 1:{
						return 'Have Solved.';
					}
				}
				return value;
			}},
			{ field:'feedback',title:'Reply',width:100,sortable:true},
		]]
	});
	
</script>