<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<fieldset class="solid">
	<legend>创建活动</legend>
	<input type="hidden" name="activity.id" value="${activity.id}" />
	<div>
		<label>标题</label>
		<input type="text" name="activity.title" value="${activity.title}" />${titleMsg}
	</div>
	<div>
		<label>内容</label>
		<textarea name="activity.content" cols="80" rows="10">${activity.content}</textarea>${contentMsg}
	</div>
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset>