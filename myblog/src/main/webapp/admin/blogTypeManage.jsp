<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客类型管理</title>
</head>
<body>
<script type="text/javascript">
$(function() {
	$('#addTypeForm').form({
		url : '${pageContext.request.contextPath}/admin/BlogTypeAction!add.action',
		success : function(r) {
			var obj = jQuery.parseJSON(r);
			if (obj.success) {
				reloadBlogType();
				$('#blogTypeDialog').dialog('close');
			}
			$.messager.show({
				title : '提示',
				msg : obj.msg
			});
		}
	});
});
$(function() {
$('#updateTypeForm').form({
	url : '${pageContext.request.contextPath}/admin/BlogTypeAction!modifyBlogType.action',
	success : function(r) {
		var obj = jQuery.parseJSON(r);
		if (obj.success) {
			$('#updateTypeDialog').dialog('close');
			reloadBlogType();
		}
		$.messager.show({
			title : '提示',
			msg : obj.msg
		});
	}
});
});
</script>
	<script type="text/javascript">
	function reloadBlogType(){
		$('#blogTypeDatagrid').datagrid('load');
	}
	function updateBlogType(){
		var rows = $('#blogTypeDatagrid').datagrid('getChecked');
		if (rows.length == 0){
			$.messager.show({
				title : '提示',
				msg : '请勾选要修改的博客！'
			});
		}else if(rows.length>1){
			$.messager.show({
				title : '提示',
				msg : '只能勾选一个选项！'
			});
		}else{
			$('#blogTypeDatagrid').datagrid('clearChecked');
			$('#updateTypeDialog').dialog('open');
			$('#updateTypeForm input[name="typeName"]').val(rows[0].typeName);
			$('#updateTypeForm input[name="orderNo"]').val(rows[0].orderNo);
			$('#updateTypeForm input[name="id"]').val(rows[0].id);
			
		}
	}

		function deleteBlogType(){
				var rows = $('#blogTypeDatagrid').datagrid('getChecked');
				var ids = [];
				if (rows.length > 0) {
					$.messager.confirm('确认', '您是否要删除当前选中的博客？', function(r) {
						if (r) {
							for ( var i = 0; i < rows.length; i++) {
								ids.push(rows[i].id);
							}
							$.ajax({
								url : '${pageContext.request.contextPath}/admin/BlogTypeAction!remove.action',
								data : {
									ids : ids.join(',')
								},
								dataType : 'json',
								success : function(result) {
									$('#blogTypeDatagrid').datagrid('load');
									$('#blogTypeDatagrid').datagrid('unselectAll');
									$.messager.show({
										title : '提示',
										msg : result.msg
									});
								}
							});
						}
					});
				} else {
					$.messager.show({
						title : '提示',
						msg : '请勾选要删除的记录！'
					});
				}
		}
		$('#blogTypeDatagrid')
				.datagrid(
						{
							border : false,
							url : '${pageContext.request.contextPath}/admin/BlogTypeAction!list.action',
							rownumbers : true,
							fitColumns : true,
							columns : [ [ {
								field : 'cd',
								title : 'cd',
								width : 100,
								checkbox : true
							}, {
								field : 'id',
								title : '编号',
								width : 100,
								align : 'center'
							}, {
								field : 'typeName',
								title : '博客类型',
								width : 100,
								align : 'center'
							}, {
								field : 'orderNo',
								title : '排序',
								width : 100,
								align : 'center'
							} ] ],
							fit : true,
							pagination : true,
							toolbar : [ {
								text : '新增',
								iconCls : 'icon-edit',
								handler : function() {
									$('#blogTypeDialog').dialog('open');
								}
							}, '-',{
								text : '修改',
								iconCls : 'icon-edit',
								handler : function() {
									updateBlogType()
								}
							}, '-', {
								text : '删除',
								iconCls : 'icon-remove',
								handler : function() {
									deleteBlogType()
								}
							} , '-', {
								text : '更新数据',
								iconCls : 'icon-reload',
								handler : function() {
									reloadBlogType()
								}
							} ]

						});
	</script>
	<table id="blogTypeDatagrid"></table>
	<div id="blogTypeDialog" class="easyui-dialog"
		data-options="title:'新增类型',closed:true,buttons:[{
										text:'添加',
										iconCls:'icon-add',
										handler:function(){
											$('#addTypeForm').submit();
										}
									}]">
		<form id="addTypeForm" method="post">
			<table>
				<tr>
					<th>类型名</th>
					<td><input name="typeName" class="easyui-validatebox"
						data-options="required:true,missingMessage:'类型名'" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="updateTypeDialog" class="easyui-dialog"
		data-options="title:'类型修改',closed:true,buttons:[{
										text:'修改',
										iconCls:'icon-add',
										handler:function(){
											$('#updateTypeForm').submit()
										}
									}]">
		<form id="updateTypeForm" method="post">
			<table>
				<tr><td><input name="id" type="hidden" ></td></tr>
				<tr>
					<th>类型名</th>
					<td><input name="typeName" class="easyui-validatebox"
						data-options="required:true,missingMessage:'类型名'" /></td>
				</tr>
				<tr>
					<th>排序</th>
					<td><input name="orderNo" class="easyui-validatebox"
						data-options="missingMessage:'排序'" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>