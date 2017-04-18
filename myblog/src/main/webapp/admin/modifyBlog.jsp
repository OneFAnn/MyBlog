<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<script type="text/javascript">
			var ue2 = UE.getEditor('updatecontainer');
	</script>
	<script type="text/javascript">
		ue2
				.addListener(
						"ready",
						function() {
							//通过ajax请求数据
							UE.ajax
									.request(
											"${pageContext.request.contextPath}/admin/BlogAction!BlogUpdateData.action",
											{
												method : "post",
												async : false,
												data : {
													"id" : '${id}'
												},
												onsuccess : function(result) {
													result = eval("("
															+ result.responseText
															+ ")");
													$("#update_title").val(
															result.title);
													$("#update_keyWord").val(
															result.keyWord);
													$("#update_blogTypeId")
															.combobox(
																	"setValue",
																	result.typeId);
													UE
															.getEditor(
																	'updatecontainer')
															.setContent(
																	result.content);
												}
											});
						});
	</script>
	<script type="text/javascript">

		  function updateData() {

			var title = $("#update_title").val();
			var blogTypeId = $("#update_blogTypeId").val();
			var content = UE.getEditor('updatecontainer').getContent();
			var keyWord = $("#update_keyWord").val();

			if (title == null || title == '') {
				$.messager.alert('提示', "请输入标题！");
			} else if (blogTypeId == null || blogTypeId == '') {
				$.messager.alert('提示', "请选择博客类别！");
			} else if (content == null || content == '') {
				$.messager.alert('提示', "请输入内容！");
			} else {
				$
						.post(
								"${pageContext.request.contextPath}/admin/BlogAction!updateBlog.action",
								{	'id':'${id}',
									'title' : title,
									'typeId' : blogTypeId,
									'content' : content,
									'contentNoTag' : UE.getEditor(
											'updatecontainer').getContentTxt(),
									'summary' : UE.getEditor('updatecontainer')
											.getContentTxt().substr(0, 155),
									'keyWord' : keyWord
								}, function(result) {
									$.messager.alert('提示', result.msg);
								}, "json");
			}

		}
	</script>
	<table cellspacing="20px">
		<tr>
			<td width="80px">博客标题：</td>
			<td><input type="text" id="update_title" name="title"
				style="width: 400px;" /></td>
		</tr>
		<tr>
			<td>所属类别：</td>
			<td><input id="update_blogTypeId" value="-请选择博客类型-"
				class="easyui-combobox" name="blogTypeId"
				data-options="valueField:'id',textField:'typeName',url:'${pageContext.request.contextPath}/admin/BlogTypeAction!listNoPage.action'">
			</td>
		</tr>
		<tr>
			<td valign="top">博客内容：</td>
			<td>
				<!-- 加载编辑器的容器 --> <script id="updatecontainer" name="updatecontainer"
					style="width:100%;height:500px;" type="text/plain">
    </script>
			</td>
		</tr>
		<tr>
			<td>关键字：</td>
			<td><input type="text" id="update_keyWord" name="keyWord"
				style="width: 400px; text-align: center;" />&nbsp;(多个关键字中间用空格隔开)</td>
		</tr>
		<tr>
			<td></td>
			<td><a href="javascript:updateData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok'">修改博客</a></td>
		</tr>
	</table>

</body>
</html>
