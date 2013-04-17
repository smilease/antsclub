<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
 <head>
  <title>AntsClub 开源社团管理系统</title>
 </head>
 <body>
 	<table id='dg'></table>
 	<script type="text/javascript">
		$(function() {
			$('#dg').datagrid({  
			    url:'/activity/datagrid',  
			    columns:[[  
			        {field:'title',title:'活动名称',width:100},
			        {field:'address',title:'活动地点',width:100},
			        {field:'startTime',title:'开始时间',width:100},  
			        {field:'endTime',title:'结束时间',width:100}  
			    ]]  
			}); 
		});
	</script>
 </body>
</html>