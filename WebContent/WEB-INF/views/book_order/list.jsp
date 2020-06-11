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
            <label>Name:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>IDCard:</label><input id="search-idCard" class="wu-text" style="width:100px">
            <label>Mobile:</label><input id="search-mobile" class="wu-text" style="width:100px">
            <label>Account:</label>
            <select id="search-account" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">All</option>
            	<c:forEach items="${accountList}" var="account">
            	<option value="${account.id }">${account.name }</option>
            	</c:forEach>
            </select>
            <label>RoomType:</label>
            <select id="search-roomType" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">All</option>
            	<c:forEach items="${roomTypeList}" var="roomType">
            	<option value="${roomType.id }" price="${roomType.price }">${roomType.name }</option>
            	</c:forEach>
            </select>
            <label>Status:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">All</option>
            	<option value="0">Pending</option>
            	<option value="1">Approved</option>
            	<option value="2">Disapproved</option>
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
                <td align="right">Account:</td>
                <td>
	                <select id="add-accountId" name="accountId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<c:forEach items="${accountList}" var="account">
		            	<option value="${account.id }" real-name="${account.realName }" id-card="${account.idCard }" mobile="${account.mobile }">${account.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">RoomType:</td>
                <td>
	                <select id="add-roomTypeId" name="roomTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<c:forEach items="${roomTypeList}" var="roomType">
		            	<option value="${roomType.id }">${roomType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">Name:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">IDCard:</td>
                <td><input type="text" id="add-idCard" name="idCard" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''"  /></td>
            </tr>
            <tr>
                <td align="right">Mobile:</td>
                <td><input type="text" id="add-mobile" name="mobile" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">ArriveDate:</td>
                <td><input type="text" id="add-arriveDate" name="arriveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">LeaveDate:</td>
                <td><input type="text" id="add-leaveDate" name="leaveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td>
	                <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<option value="0">Pending</option>
		            	<option value="1">Approved</option>
		            	<option value="2">Disapproved</option>
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
                <td align="right">Account:</td>
                <td>
	                <select id="edit-accountId" name="accountId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<c:forEach items="${accountList}" var="account">
		            	<option value="${account.id }" real-name="${account.realName }" id-card="${account.idCard }" mobile="${account.mobile }">${account.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">RoomType:</td>
                <td>
	                <select id="edit-roomTypeId" name="roomTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<c:forEach items="${roomTypeList}" var="roomType">
		            	<option value="${roomType.id }">${roomType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">Name:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">IDCard:</td>
                <td><input type="text" id="edit-idCard" name="idCard" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''"  /></td>
            </tr>
            <tr>
                <td align="right">Mobile:</td>
                <td><input type="text" id="edit-mobile" name="mobile" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:''" /></td>
            </tr>
            <tr>
                <td align="right">ArriveDate:</td>
                <td><input type="text" id="edit-arriveDate" name="arriveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">LeaveDate:</td>
                <td><input type="text" id="edit-leaveDate" name="leaveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td>
	                <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:''">
		            	<option value="0">Pending</option>
		            	<option value="1">Approved</option>
		            	<option value="2">Disapproved</option>
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
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","Please check your data!","warning");
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
			$.messager.alert("消息提醒","Please check your data!","warning");
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
				}
				else if(data.type == 'contract') {
					$.messager.alert('信息提示','Contract generated!','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}
				else {
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	function openEdit(){
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','You have not chosen one.','info');
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
            	$("#edit-arriveDate").datebox('setValue',item.arriveDate);
            	$("#edit-leaveDate").datebox('setValue',item.leaveDate);
            	$("#edit-idCard").val(item.idCard);
            	$("#edit-mobile").val(item.mobile);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-accountId").combobox('setValue',item.accountId);
            	$("#edit-roomTypeId").combobox('setValue',item.roomTypeId);
            	$("#edit-remark").val(item.remark);
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
		var account = $("#search-account").combobox('getValue');
		var roomType = $("#search-roomType").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		if(account != -1){
			option.accountId = account;
		}
		if(roomType != -1){
			option.roomTypeId = roomType;
		}
		option.idCard = $("#search-idCard").val();
		option.mobile = $("#search-mobile").val();
		$('#data-datagrid').datagrid('reload',option);
	});
	
	
	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
	
	$("#add-accountId").combobox({
		onSelect:function(data){
			var option = $("#add-accountId option[value='"+data.value+"']");
			$("#add-name").val(option.attr('real-name'));
			$("#add-idCard").val(option.attr('id-card'));
			$("#add-mobile").val(option.attr('mobile'));
		}
	});
	
	$("#edit-accountId").combobox({
		onSelect:function(data){
			var option = $("#add-accountId option[value='"+data.value+"']");
			$("#edit-name").val(option.attr('real-name'));
			$("#edit-idCard").val(option.attr('id-card'));
			$("#edit-mobile").val(option.attr('mobile'));
		}
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
			{ field:'accountId',title:'Account',width:100,formatter:function(value,row,index){
				var accountList = $("#search-account").combobox('getData');
				for(var i=0;i<accountList.length;i++){
					if(accountList[i].value == value)return accountList[i].text;
				}
				return value;
			}},
			{ field:'roomTypeId',title:'RoomType',width:150,formatter:function(value,row,index){
				var roomTypeList = $("#search-roomType").combobox('getData');
				for(var i=0;i<roomTypeList.length;i++){
					if(roomTypeList[i].value == value){
						return roomTypeList[i].text + '(￥:' + $("#search-roomType option[value='"+value+"']").attr('price') + ')';
					}
				}
				return value;
			}},
			{ field:'name',title:'Name',width:60,sortable:true},
			{ field:'idCard',title:'IDCard',width:100,sortable:true},
			{ field:'mobile',title:'Mobile',width:100,sortable:true},
			{ field:'arriveDate',title:'ArriveDate',width:100,sortable:true},
			{ field:'leaveDate',title:'LeaveDate',width:100,sortable:true},
			{ field:'status',title:'Status',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return 'Pending';
					}
					case 1:{
						return 'Approved';
					}
					case 2:{
						return 'Disapproved';
					}
				}
				return value;
			}},
			{ field:'createTime',title:'CreateTime',width:150,formatter:function(value,row,index){
				return format(value);
			}},
			{ field:'remark',title:'Remark',width:120,sortable:true},
			{ field:'contract',title:'Contract',width:100,formatter:function(value,row,index){
				switch(value){
				case 0: {
					return 'No Contract';
				}
				case 1: {
					return 'Have Contract';
				}
				}
			}}
		]]
	});
	
</script>