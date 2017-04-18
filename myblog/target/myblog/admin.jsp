<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.5.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.5.1/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north'" style="height: 80px"></div>
	<div data-options="region:'south',split:true" style="height: 50px;"></div>
	<div data-options="region:'east',split:true" title="East"
		style="width: 100px;"></div>
	<div data-options="region:'west',split:true" title="导航菜单"
		style="width: 150px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="常用操作" data-options="selected:true,iconCls:'icon-item'"
				style="padding: 10px">
				<a href="javascript:addTab('写博客','writeBlog.jsp')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-writeblog'"
					style="width: 150px">写博客</a> <a
					href="javascript:openTab('评论审核','commentReview.jsp','icon-review')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-review'"
					style="width: 150px">评论审核</a>
			</div>
			<div title="博客管理" data-options="iconCls:'icon-bkgl'"
				style="padding: 10px;">
				<a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-writeblog'"
					style="width: 150px;">写博客</a> <a
					href="javascript:openTab('博客信息管理','blogManage.jsp','icon-bkgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
			</div>
			<div title="博客类别管理" data-options="iconCls:'icon-bklb'"
				style="padding: 10px">
				<a
					href="javascript:openTab('博客类别信息管理','blogTypeManage.jsp','icon-bklb')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
			</div>
			<div title="评论管理" data-options="iconCls:'icon-plgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('评论审核','commentReview.jsp','icon-review')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-review'"
					style="width: 150px">评论审核</a> <a
					href="javascript:openTab('评论信息管理','commentManage.jsp','icon-plgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">评论信息管理</a>
			</div>
			<div title="个人信息管理" data-options="iconCls:'icon-grxx'"
				style="padding: 10px">
				<a
					href="javascript:openTab('修改个人信息','modifyInfo.jsp','icon-grxxxg')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-grxxxg'"
					style="width: 150px;">修改个人信息</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-system'"
				style="padding: 10px">
				<a href="javascript:openTab('友情链接管理','linkManage.jsp','icon-link')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-link'" style="width: 150px">友情链接管理</a>
				<a href="javascript:openPasswordModifyDialog()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-modifyPassword'"
					style="width: 150px;">修改密码</a> <a href="javascript:refreshSystem()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-refresh'"
					style="width: 150px;">刷新系统缓存</a> <a href="javascript:logout()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			</div>
		</div>
	</div>
	<div data-options="region:'center',title:'Main',iconCls:'icon-ok'">
		<div id="index_centerTabs" class="easyui-tabs" data-options="border:false,fit:true">
		</div>
	</div>

</body>
<script type="text/javascript">
	function addTab(opts,url) {
		var t = $('#index_centerTabs');
		if (t.tabs('exists', opts)) {
			t.tabs('select', opts);
		} else {
			t.tabs('add', {
				title:opts,
				href:url,
				closable:true
			});
			
		}
	}
</script>
</html>
