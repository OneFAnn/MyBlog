<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.5.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.5.1/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/ueditor/utf8-jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/ueditor/utf8-jsp/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/ueditor/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>个人博客后台管理</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north' " style="height:80px;background-color:#e0ecff;"></div> 
	<div data-options="region:'south',split:true" style="height: 50px;background-color:#e0ecff;""></div>
	<div data-options="region:'west',split:true" title="导航菜单"
		style="width: 150px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="常用操作" data-options="selected:true,iconCls:'icon-item'"
				style="padding: 10px">
				<a href="javascript:addTab('写博客','writeBlog.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-writeblog'"
					style="width: 150px">写博客</a> 
			</div>
			<div title="博客管理" data-options="iconCls:'icon-bkgl'"
				style="padding: 10px;">
				<a href="javascript:addTab('写博客','writeBlog.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-writeblog'"
					style="width: 150px;">写博客</a> <a
					href="javascript:addTab('博客信息管理','blogManage.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
			</div>
			<div title="博客类别管理" data-options="iconCls:'icon-bklb'"
				style="padding: 10px">
				<a href="javascript:addTab('博客类别信息管理','blogTypeManage.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
			</div>
			<div title="评论管理" data-options="iconCls:'icon-plgl'"
				style="padding: 10px">
 <a
					href="javascript:addTab('评论信息管理','commentManage.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">评论信息管理</a>
			</div>
			<div title="个人信息管理" data-options="iconCls:'icon-grxx'"
				style="padding: 10px">
				<a href="javascript:addTab('修改个人信息','modifyInfo.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-grxxxg'"
					style="width: 150px;">修改个人信息</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-system'"
				style="padding: 10px">

				<a href="javascript:openPasswordModifyDialog()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-modifyPassword'"
					style="width: 150px;">修改密码</a> 
			</div>
		</div>
	</div>
	<div data-options="region:'center',title:'Main',iconCls:'icon-ok'">
		<div id="admin_centerTabs" class="easyui-tabs"
			data-options="border:false,fit:true"></div>
	</div>
	<jsp:include page='/admin/updatePassoword.jsp'></jsp:include>
	</body>
<script type="text/javascript">
	$('#admin_centerTabs').tabs({
		onBeforeClose : function(title) {
			if (title == '写博客') {
				UE.getEditor('container').destroy();
			}
			if (title == '修改博客') {
				UE.getEditor('updatecontainer').destroy();
			}
			if (title == '修改个人信息') {
				UE.getEditor('proFile').destroy();
			}
		}
	});
	function addTab(opts, url) {
		var t = $('#admin_centerTabs');
		if (t.tabs('exists', opts)) {
			if (opts == '修改博客') {
				t.tabs('close', '修改博客');
				t.tabs('add', {
					title : opts,
					href : url,
					closable : true
				});
			}
			t.tabs('select', opts);
		} else {
			t.tabs('add', {
				title : opts,
				href : url,
				closable : true
			});

		}
	}
</script>
</html>
