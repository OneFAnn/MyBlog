<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules,{
	eqPwd : {
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '密码不一致！'
	}
});
function openPasswordModifyDialog(){
	$('#updatePasswordDialog').dialog('open');
}

</script>
<script type="text/javascript">
$(function() {
	$('#updatePasswordForm').form({
		url : '${pageContext.request.contextPath}/admin/BloggerAction!updatePwd.action',
		success : function(r) {
			var obj = jQuery.parseJSON(r);
			if (obj.success) {
				$('#updatePasswordDialog').dialog('close');
			}
			$.messager.show({
				title : '提示',
				msg : obj.msg
			});
		}
	});
});
</script>
<div id="updatePasswordDialog" class="easyui-dialog"
		data-options="title:'密码修改',closed:true,buttons:[{
										text:'修改',
										iconCls:'icon-add',
										handler:function(){
											$('#updatePasswordForm').submit()
										}
									}]">
		<form id="updatePasswordForm" method="post">
			<table>
				<tr><td><input name="id" type="hidden" ></td></tr>
				<tr>
					<th>密码</th>
					<td><input id="password" type="password" name="password" class="easyui-validatebox"
						data-options="required:true,missingMessage:'密码'" /></td>
				</tr>
				<tr>
					<th>重复密码</th>
					<td><input  type="password" name="pwd2" class="easyui-validatebox"
						data-options="missingMessage:'重复密码'" validType="eqPwd['#password']"></td>
				</tr>
			</table>
		</form>
	</div>