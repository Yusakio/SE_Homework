<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
        	<a href="../../system/index" class="easyui-linkbutton" iconCls="icon-house">Front Page</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">Add</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-bullet-edit" onclick="openEdit()" plain="true">Edit</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="remove()" plain="true">Delete</a>
        </div>
        <div class="wu-toolbar-search">
            <label>Name:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>Status:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">All</option>
            	<option value="0">Full</option>
            	<option value="1">Available</option>
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
                <td width="60" align="right">Photo:</td>
                <td valign="middle">
                	<img id="preview-photo" style="float:left;" src="../../resources/admin/images/photograph.jpg" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-upload" onclick="uploadPhoto()" plain="true">Upload</a>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">Photo Path:</td>
                <td><input type="text" id="add-photo" name="photo" value="/Project/resources/admin/images/photograph.jpg" readonly="readonly" class="wu-text " /></td>
            </tr>
            <tr>
                <td align="right">Name:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
             <tr>
                <td align="right">Price:</td>
                <td><input type="text" id="add-price" name="price" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Max People:</td>
                <td><input type="text" id="add-liveNum" name="liveNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Beds:</td>
                <td><input type="text" id="add-bedNum" name="bedNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Amount:</td>
                <td><input type="text" id="add-roomNum" name="roomNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td>
	                <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<option value="0">Full</option>
		            	<option value="1">Available</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">Remark:</td>
                <td><textarea id="add-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
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
                <td width="60" align="right">Photo:</td>
                <td valign="middle">
                	<img id="edit-preview-photo" style="float:left;" src="/Project/resources/images/photograph.jpg" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-upload" onclick="uploadPhoto()" plain="true">Upload</a>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">Photo Path:</td>
                <td><input type="text" id="edit-photo" name="photo" value="/Project/resources/admin/images/photograph.jpg" readonly="readonly" class="wu-text " /></td>
            </tr>
           <tr>
                <td align="right">Name:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
             <tr>
                <td align="right">Price:</td>
                <td><input type="text" id="edit-price" name="price" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Max People:</td>
                <td><input type="text" id="edit-liveNum" name="liveNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Beds:</td>
                <td><input type="text" id="edit-bedNum" name="bedNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Amount:</td>
                <td><input type="text" id="edit-roomNum" name="roomNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">Available Number:</td>
                <td><input type="text" id="edit-avilableNum" name="avilableNum" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td>
	                <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<option value="0">Full</option>
		            	<option value="1">Available</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">Remark:</td>
                <td><textarea id="edit-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<div id="process-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-upload',title:'Loading'" style="width:450px; padding:10px;">
<div id="p" class="easyui-progressbar" style="width:400px;" data-options="text:'Loading...'"></div>
</div>
<input type="file" id="photo-file" style="display:none;" onchange="upload()">
<%@include file="../common/footer.jsp"%>

<script type="text/javascript">
//上传图片
function start(){
		var value = $('#p').progressbar('getValue');
		if (value < 100){
			value += Math.floor(Math.random() * 10);
			$('#p').progressbar('setValue', value);
		}else{
			$('#p').progressbar('setValue',0)
		}
};
function upload(){
	if($("#photo-file").val() == '')return;
	var formData = new FormData();
	formData.append('photo',document.getElementById('photo-file').files[0]);
	$("#process-dialog").dialog('open');
	var interval = setInterval(start,200);
	$.ajax({
		url:'../user/upload_photo',
		type:'post',
		data:formData,
		contentType:false,
		processData:false,
		success:function(data){
			clearInterval(interval);
			$("#process-dialog").dialog('close');
			if(data.type == 'success'){
				$("#preview-photo").attr('src',data.filepath);
				$("#add-photo").val(data.filepath);
				$("#edit-preview-photo").attr('src',data.filepath);
				$("#edit-photo").val(data.filepath);
			}else{
				$.messager.alert("消息提醒",data.msg,"warning");
			}
		},
		error:function(data){
			clearInterval(interval);
			$("#process-dialog").dialog('close');
			$.messager.alert("消息提醒","Failed!","warning");
		}
	});
}

function uploadPhoto(){
	$("#photo-file").click();
	
}	
	
	
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
	
	
	function remove(){
		$.messager.confirm('信息提示','Sure to delete this record?', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','Please choose the record!','info');
					return;
				}
				
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{id:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','Delete success!','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
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
            	$("#edit-price").val(item.price);
            	$("#edit-liveNum").val(item.liveNum);
            	$("#edit-bedNum").val(item.bedNum);
            	$("#edit-roomNum").val(item.roomNum);
            	$("#edit-avilableNum").val(item.avilableNum);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-remark").val(item.remark);
            	$("#edit-preview-photo").attr('src',item.photo);
            	$("#edit-photo").val(item.photo);
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
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var status = $("#search-status").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
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
			{ field:'price',title:'Price',width:100,sortable:true},
			{ field:'liveNum',title:'Max People',width:100,sortable:true},
			{ field:'bedNum',title:'Beds',width:100,sortable:true},
			{ field:'roomNum',title:'Amount',width:100,sortable:true},
			{ field:'avilableNum',title:'AvailableNumber',width:100,sortable:true},
			{ field:'status',title:'Status',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return 'Full';
					}
					case 1:{
						return 'Available';
					}
				}
				return value;
			}},
			{ field:'remark',title:'Remark',width:200},
		]]
	});
</script>