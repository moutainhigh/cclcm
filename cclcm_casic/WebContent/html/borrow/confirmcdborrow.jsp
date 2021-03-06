<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<title>管理部门借用光盘台账</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${ctx}/_css/css200603.css" type="text/css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${ctx}/_css/displaytag.css" media="screen"/>
	<link href="${ctx}/_script/calendar2/calendar-blue.css" type="text/css" rel="stylesheet"/>
	<script language="javascript" src="${ctx}/_script/calendar2/calendar.js"></script>
	<script language="javascript" src="${ctx}/_script/jquery/jquery.min.js"></script>
	<script language="javascript" src="${ctx}/_script/casic304_common.js"></script>
	<script language="javascript" src="${ctx}/_script/casic304_ajax.js"></script>
	<script>
	$(document).ready(function(){
		onHoverInfinite();
	});
	function clearFindForm(){
		LedgerQueryCondForm.cd_barcode.value = "";
		$("#seclv_code").val("");
	}
	function chkBorrow(cd_id){
		if(confirm("确定将此光盘借出？")){
			var url = "${ctx}/borrow/confirmcdborrow.action?type=ajax&cd_id="+escape(cd_id)+"&confirm_type=READ_BR&update=Y";
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = updatePage;
			xmlHttp.send(null);
		}
	}
	function chkReturn(cd_id){
		if(confirm("确定归还此光盘？")){
			var url = "${ctx}/borrow/confirmcdborrow.action?type=ajax&cd_id="+escape(cd_id)+"&confirm_type=READ_RT&update=Y";
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = updatePage;
			xmlHttp.send(null);
		}
	}
	function updatePage() {
		if (xmlHttp.readyState == 4) {
			  var response = xmlHttp.responseText;
			  LedgerQueryCondForm.submit();
		}
	}	
	</script>
</head>
<body oncontextmenu="self.event.returnValue=false">
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" class="table_only_border">
	<tr>
		<td class="title_box">管理部门借用光盘台账</td>
	</tr>
	<form id="LedgerQueryCondForm" method="GET" action="${ctx}/borrow/confirmcdborrow.action" name="LedgerQueryCondForm">
	<tr>
		<td align="right">
			<table  table border=0 class="table_box" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td width="10%" align="center">光盘编号：</td>
					<td width="18%">
						<input type="text" id="cd_barcode" name="cd_barcode" value="${cd_barcode}"/>&nbsp;
					</td>
					<td width="10%" align="center">文件列表：</td>
					<td width="18%">
						<input type="text" id="file_list" name="file_list" value="${file_list}"/>&nbsp;
					</td>
					<td width="10%" align="center">密级：</td>
					<td width="18%">
						<select name="seclv_code" id="seclv_code">
							<option value="">--所有--</option>
								<s:iterator value="#request.seclvList" var="seclv">
							<option value="${seclv.seclv_code}">${seclv.seclv_name}</option>
								</s:iterator>
						</select>
					</td>
					<td align="center"> 
						<input name="button" type="submit" class="button_2003" value="查询">&nbsp;
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
	   					<display:table requestURI="${ctx}/borrow/confirmcdborrow.action" uid="item" class="displaytable" name="cdLedgerList"
	   							pagesize="${pageSize}" sort="page" partialList="true" size="${totalSize}" form="LedgerQueryCondForm" excludedParams="*">
							<display:column title="序号">
								<c:out value="${item_rowNum}"/>
							</display:column>	
							<display:column property="applyusername" title="借用人"/>
							<display:column property="applydeptname" title="借用部门" maxLength="15"/>						
							<display:column property="cd_barcode" title="光盘编号" maxLength="30"/>
							<display:column property="file_list" title="文件列表" maxLength="30"/>
							<display:column property="seclv_name" title="密级"/>
							<display:column property="burn_time" sortable="true" title="产生时间"/>
							<display:column title="操作" style="width:200px">
								<input type="button" class="button_2003" value=" 查看 " onclick="go('${ctx}/ledger/viewpersonalledgerinfo.action?cd_id=${item.cd_id}&seclv_code=${item.seclv_code}');"/>&nbsp;								
								<c:choose>
									<c:when test="${item.borrow_status eq '0' and item.cd_state eq '6'}">
										<input type="button" class="button_2003" value=" 借出 " onclick="chkBorrow('${item.cd_id}');"/>&nbsp;
										<input type="button" class="button_2003" value=" 归还 " disabled="disabled"/>
									</c:when>
									<c:when test="${item.borrow_status eq '0' and item.cd_state eq '10'}">
										<input type="button" class="button_2003" value="待交接" disabled="disabled"/>&nbsp;
										<input type="button" class="button_2003" value=" 归还 " disabled="disabled"/>
									</c:when>
									<c:when test="${item.borrow_status eq '1' and item.cd_state eq '6'}">
										<input type="button" class="button_2003" value="已借出" disabled="disabled"/>&nbsp;
										<input type="button" class="button_2003" value=" 归还 " onclick="chkReturn('${item.cd_id}');"/>
									</c:when>
									<c:otherwise>
										<input type="button" class="button_2003" value="已借出" disabled="disabled"/>&nbsp;
										<input type="button" class="button_2003" value="待交接" disabled="disabled"/>
									</c:otherwise>
								</c:choose>
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
