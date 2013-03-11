<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<fieldset class="solid">
	<input type="hidden" name="user.id" value="${user.id}" />
	<div>
		<label>用户名</label>
		<input type="text" name="user.name" value="${user.name}" width="40px"/>${user.name}
	</div>
	<div>
		<label>密码</label>
		<input type="text" name="user.password" value="${user.password}"/>${contentMsg}
	</div>
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset>