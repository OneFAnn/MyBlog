<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论管理</title>
</head>
<body>
	<script type="text/javascript">

	function reloadBlogComment(){
		$('#commentDatagrid').datagrid('load');
	}
		function deleteBlogComment(){
			
				var rows = $('#commentDatagrid').datagrid('getChecked');
				var ids = [];
				if (rows.length > 0) {
					$.messager.confirm('确认', '您是否要删除当前选中的评论？', function(r) {
						if (r) {
							for ( var i = 0; i < rows.length; i++) {
								ids.push(rows[i].id);
							}
							$.ajax({
								url : '${pageContext.request.contextPath}/admin/BlogCommentAction!remove.action',
								data : {
									ids : ids.join(',')
								},
								dataType : 'json',
								success : function(result) {
									$('#commentDatagrid').datagrid('load');
									$('#commentDatagrid').datagrid('unselectAll');
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
						msg : '请勾选要删除的评论！'
					});
				}
		}
		$('#commentDatagrid').datagrid(
						{
							border : false,
							url : '${pageContext.request.contextPath}/admin/BlogCommentAction!list.action',
							rownumbers : true,
							fitColumns : true,
							sortName : 'commentDate',
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
								field : 'blogTitle',
								title : '博客标题',
								width : 100,
								align : 'center'
							}, {
								field : 'commentDate',
								title : '评论时间',
								width : 100,
								sortable : true,
								align : 'center'
							}, {
								field : 'userIp',
								title : '评论人',
								width : 100,
								align : 'center'
							}, {
								field : 'content',
								title : '评论内容',
								width : 100,
								align : 'center'
							} ] ],
							fit : true,
							pagination : true,
							toolbar : [ {
								text : '删除',
								iconCls : 'icon-remove',
								handler : function() {
									deleteBlogComment()
								}
							} , '-', {
								text : '更新数据',
								iconCls : 'icon-reload',
								handler : function() {
									reloadBlogComment()
								}
							} ]

						});
	</script>
	<table id="commentDatagrid"></table>
</body>
</html>