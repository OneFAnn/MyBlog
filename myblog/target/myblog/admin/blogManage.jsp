<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	function searchUser() {
		$('#blogDatagrid').datagrid('load', {
			title : $('input[name="blogTitle"]').val(),
		});
	}
	function clearInput() {
		$('input[name = "blogTitle"]').val('');
		$('#blogDatagrid').datagrid('load', {
			title : $('input[name="blogTitle"]').val(),
		});
	}
	function reloadBlog(){
		$('#blogDatagrid').datagrid('load', {
			title : ''
		});
	}
	function updateBlog(){
		var rows = $('#blogDatagrid').datagrid('getChecked');
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
			$('#blogDatagrid').datagrid('clearChecked');
			addTab("修改博客",'${pageContext.request.contextPath}/admin/BlogAction!modifyBlog.action?id='+rows[0].id);
		}
	}

		function deleteBlog(){
			
				var rows = $('#blogDatagrid').datagrid('getChecked');
				var ids = [];
				if (rows.length > 0) {
					$.messager.confirm('确认', '您是否要删除当前选中的博客？', function(r) {
						if (r) {
							for ( var i = 0; i < rows.length; i++) {
								ids.push(rows[i].id);
							}
							$.ajax({
								url : '${pageContext.request.contextPath}/admin/BlogAction!remove.action',
								data : {
									ids : ids.join(',')
								},
								dataType : 'json',
								success : function(result) {
									$('#blogDatagrid').datagrid('load');
									$('#blogDatagrid').datagrid('unselectAll');
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
		$('#blogDatagrid')
				.datagrid(
						{
							border : false,
							url : '${pageContext.request.contextPath}/admin/BlogAction!list.action',
							rownumbers : true,
							fitColumns : true,
							sortName : 'releaseDate',
							sortOrder : 'desc',
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
								field : 'title',
								title : '标题',
								width : 100,
								align : 'center'
							}, {
								field : 'releaseDate',
								title : '发布时间',
								width : 100,
								sortable : true,
								align : 'center'
							}, {
								field : 'typeName',
								title : '博客类别',
								width : 100,
								align : 'center'
							} ] ],
							fit : true,
							pagination : true,
							toolbar : [ {
								text : '博客标题关键字查询：<input name = "blogTitle">',
							}, {
								text : '查找',
								iconCls : 'icon-search',
								handler : function() {
									searchUser()
								}
							}, '-', {
								text : '清空',
								iconCls : 'icon-ok',
								handler : function() {
									clearInput()
								}
							}, '-', {
								text : '修改',
								iconCls : 'icon-edit',
								handler : function() {
									updateBlog()
								}
							}, '-', {
								text : '删除',
								iconCls : 'icon-remove',
								handler : function() {
									deleteBlog()
								}
							} , '-', {
								text : '更新数据',
								iconCls : 'icon-reload',
								handler : function() {
									reloadBlog()
								}
							} ]

						});
	</script>
	<table id="blogDatagrid"></table>
</body>
</html>