<%@ page import="gushici.domain.PushRecord" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/24
  Time: 15:49

  TODO:这个页面能使用的信息：
  (List<PushRecord>)request.getAttribute("pushRecordList")：推送历史记录
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- BootStrap CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/BootStrap/css/bootstrap.min.css"/>
	<!--DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/css/jquery.dataTables.css"/>
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.dataTables.js"></script>

	<title>推送历史</title>
	<script type="text/javascript" class="init">
		$(document).ready(function() {
			$('#data_table').DataTable({
				language: {
					"sProcessing": "处理中...",
					"sLengthMenu": "显示 _MENU_ 项结果",
					"sZeroRecords": "没有匹配结果",
					"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
					"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
					"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix": "",
					"sSearch": "搜索:",
					"sUrl": "",
					"sEmptyTable": "表中数据为空",
					"sLoadingRecords": "载入中...",
					"sInfoThousands": ",",
					"oPaginate": {
						"sFirst": "首页",
						"sPrevious": "上页",
						"sNext": "下页",
						"sLast": "末页"
					},
					"oAria": {
						"sSortAscending": ": 以升序排列此列",
						"sSortDescending": ": 以降序排列此列"
					}
				}
			});
		});
	</script>
</head>
<body>
<div class="page-header">
	<h1 class="text-center">推送历史</h1>
</div>
<%
	List<PushRecord> pushRecordList = (List<PushRecord> )request.getAttribute("pushRecordList");
%>
<table id="data_table" class="display">
	<thead>
	<tr>
		<th>期号</th>
		<th>题目</th>
		<th>作者</th>
		<th width="50%">内容</th>
		<th>日期</th>
	</tr>
	</thead>

	<tbody>
<%
	for(PushRecord pushRecord : pushRecordList){

%>
	<tr>
		<td><%=pushRecord.get期号()%></td>
		<td><%=pushRecord.get诗词()%></td>
		<td><%=pushRecord.get作者()%></td>
		<td><%=pushRecord.get内容()%></td>
		<td><%=pushRecord.get日期()%></td>
	</tr>
<%
	}
%>
	</tbody>
</table>
</body>
</html>
