<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<!-- 实例化编辑器 -->
	<script type="text/javascript"> 
			var ue2 = UE.getEditor('container');
	</script>
	<script type="text/javascript">
		function submitData() {

			var title = $("#title").val();
			var blogTypeId = $("#blogTypeId").val();
			var content = UE.getEditor('container').getContent();
			var keyWord = $("#keyWord").val();

			if (title == null || title == '') {
				$.messager.alert('提示', "请输入标题！");
			} else if (blogTypeId == null || blogTypeId == '') {
				$.messager.alert('提示', "请选择博客类别！");
			} else if (content == null || content == '') {
				$.messager.alert('提示', "请输入内容！");
			} else {
				$
						.post(
								"${pageContext.request.contextPath}/admin/BlogAction!save.action",
								{
									'title' : title,
									'typeId' : blogTypeId,
									'content' : content,
									'contentNoTag' : UE.getEditor('container')
											.getContentTxt(),
									'summary' : UE.getEditor('container')
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
			<td><input type="text" id="title" name="title"
				style="width: 400px;" /></td>
		</tr>
		<tr>
			<td>所属类别：</td>
			<td><input id="blogTypeId" value="-请选择博客类型-"
				class="easyui-combobox" name="blogTypeId"
				data-options="valueField:'id',textField:'typeName',url:'${pageContext.request.contextPath}/admin/BlogTypeAction!listNoPage.action'">
			</td>
		</tr>
		<tr>
			<td valign="top">博客内容：</td>
			<td>
				<!-- 加载编辑器的容器 --> <script id="container" name="container"
					style="width:100%;height:500px;" type="text/plain">
        这里写你的初始化内容
    </script>
			</td>
		</tr>
		<tr>
			<td>关键字：</td>
			<td><input type="text" id="keyWord" name="keyWord"
				style="width: 400px; text-align: center;" />&nbsp;(多个关键字中间用空格隔开)</td>
		</tr>
		<tr>
			<td></td>
			<td><a href="javascript:submitData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok'" >发布博客</a></td>
		</tr>
	</table>

</body>
</html>
