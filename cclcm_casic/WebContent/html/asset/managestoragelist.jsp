<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<title>资产入账作业管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${ctx}/_css/displaytag.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/_css/css200603.css"  media="screen"/>
    <link href="${ctx}/_script/calendar2/calendar-blue.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="${ctx}/_script/jquery/jquery.min.js"></script>
    <script language="javascript" src="${ctx}/_script/calendar2/calendar.js"></script>
    <script language="javascript" src="${ctx}/_script/casic304_common.js"></script>
    <script language="javascript" src="${ctx}/_script/casic304_ajax.js"></script>
<script>
<!--
	$(document).ready(function(){
		onHover();
		preCalendar();
	});
	function clearFindForm(){
		$("#QueryCondForm :text").val("");
		$("#QueryCondForm select").val("");
	}
	function chkCancel(event_code){
		if(confirm("确定要撤销该申请？")){
			var url = "${ctx}/asset/delpurchaseevent.action?type=ajax&eventtype=STORE&event_code="+escape(event_code);
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = updatePage;
			xmlHttp.send(null);
		}
	}
	//20150627,gxm,暂时只入账，后续可扩展打印条码，
	function chkChange(event_code){
		if(confirm("确定要入账？")){
			var url="${ctx}/asset/updatestoragestatus.action?event_code="+escape(event_code);
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = updatePage;
			xmlHttp.send(null);
		}
	}
	function updatePage() {
		if (xmlHttp.readyState == 4) {
			  var response = xmlHttp.responseText;
			  QueryCondForm.submit();
		}
	}
//-->
</script>
</head>

<body oncontextmenu="self.event.returnValue=false">
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" class="table_only_border">
	<tr>
		<td class="title_box">已添加的资产入账作业列表</td>
	</tr>
	<tr>
		<td align="right">
		<form id="QueryCondForm" method="GET" action="${ctx}/asset/managestoragelist.action" name="QueryCondForm">
			<table border=0 class="table_box" cellspacing="0" cellpadding="0" width="100%">
					<tr>
						<td width="8%" align="center">作业密级 ：</td>
				 		<td width="20%">
				 			<c:set var="seclv1" value="${seclv_code}" scope="request"/>
        					<select name="seclv_code">
        						<option value="">--全部--</option>
    							<s:iterator value="#request.seclvList" var="seclv">
									<option value="${seclv.seclv_code}" <s:if test="#request.seclv1==#seclv.seclv_code">selected="selected"</s:if>>${seclv.seclv_name}</option>
								</s:iterator>
    						</select>
				 		</td>
				 		<td width="8%" align="center">申请状态：</td>
				 		<td width="20%">
				        	<select name="job_status">
    							<option value="">--全部--</option>
    							<option value="none" <c:if test="${job_status eq 'none'}">selected</c:if>>待审批</option>
    							<option value="under" <c:if test="${job_status eq 'under'}">selected</c:if>>审批中</option>
    							<option value="false" <c:if test="${job_status eq 'false'}">selected</c:if>>已驳回</option>
    							<option value="true" <c:if test="${job_status eq 'true'}">selected</c:if>>已通过</option>
    							<option value="done" <c:if test="${job_status eq 'done'}">selected</c:if>>已关闭</option>
    						</select>
			    		</td>
				 		<td width="8%" align="center">入账状态：</td>
				 		<td width="15%">
				        	<select name="store_status">
    							<option value="">--全部--</option>
    							<option value="1" <c:if test="${store_status == '1'}">selected</c:if>>已入账</option>
    							<option value="0" <c:if test="${store_status == '0'}">selected</c:if>>未入账</option>
    						</select>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td align="center">申请时间：</td>
				 		<td >
				 			<input type="text" name="startTime" readonly="readonly" style="cursor:hand;" value="${startTime_str}"/>
        					<img src="${ctx}/_image/time2.jpg" id="startTime_trigger">
				 		</td>
				 		<td align="center">至：</td>
				 		<td >
				        	<input type="text" name="endTime" readonly="readonly" style="cursor:hand;" value="${endTime_str}"/>
        					<img src="${ctx}/_image/time2.jpg" id="endTime_trigger">
			    		</td>  
				        <td align="center" colspan="6">
							<input name="button" type="submit" class="button_2003" value="查询" onclick="return checkTime();">&nbsp;
							<input name="button" type="button" class="button_2003" value="清空" onclick="clearFindForm();">
						</td>
					</tr>
				</table>			
		</td>
	</tr>
	<tr>
		<td>
			<table class="displaytable-outter" cellspacing=0 cellpadding=0 border=0 width="100%">
	 			<tr>
	   				<td>
					<display:table requestURI="${ctx}/asset/managestoragelist.action" uid="item" class="displaytable" name="eventList" 
					pagesize="15" sort="list"  excludedParams="*" form="QueryCondForm">
						<display:column title="序号">
							<c:out value="${item_rowNum}"/>
						</display:column>					
						<display:column title="作业密级" property="seclv_name"/>
						<display:column title="资产种类" property="property_kind" maxLength="20"/>
						<display:column title="设备名称" property="property_name" maxLength="20"/>
						<display:column title="数量" property="amount"/>	
						<display:column title="申请状态" property="job_status_name"/>
						<display:column title="申请时间" property="apply_time_str" sortable="true"/>
						<display:column title="入账状态" property="store_status_str"/>					
						<display:column title="操作" style="width:150px">
							<div>
								<input type="button" class="button_2003" value="查看" onclick="go('${ctx}/asset/viewstorageeventdetail.action?event_code=${item.event_code}');"/>
								<c:choose>
									<c:when test="${item.store_status == 0}">
										&nbsp;<input type="button" class="button_2003" value="撤销" onclick="chkCancel('${item.event_code}');"/>
									</c:when>
									<c:otherwise>
										&nbsp;<input type="button" class="button_2003" value="撤销" disabled="disabled"/>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${item.job_status eq 'true' and item.store_status ==0}">
										&nbsp;<input type="button" class="button_2003" value="入账" onclick="chkChange('${item.event_code}');"/>
									</c:when>
									<c:otherwise>
										&nbsp;<input type="button" class="button_2003" value="入账" disabled="disabled"/>
									</c:otherwise>
								</c:choose>
							</div>
						</display:column>
					</display:table>
					</td>
				</tr>
			</table>
         </td>
	</tr>
</table>
</form>
</body>
</html>
