<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<title>可分发空白盘列表</title>
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
		preCalendar();
		addSelectAllCheckbox();
	/* 	$("#spacecd_state").val("${spacecd_state}");
		$("#scope_dept_id").val("${scope_dept_id}"); */
		QueryCondForm.seclv_code.value = "${seclv_code}";
	});
	
	function addassignJob(ids, event_code){
	
	if(confirm("确定要分发？")){
	
		var spacecd_ids = "";
		var check_result=true;
		if($(":checkbox:checked[value!=''][name='spacecd_id']").size() == 0){
			alert("请选择要分发的空白盘");
			return false;
		}else{
			$(":checkbox:checked[value!=''][name='spacecd_id']").each(function (){
				spacecd_ids += this.value+":";
			});
			if(check_result){
				$("#ids").val(spacecd_ids);
		        $("#event_code").val(event_code);
		        $("#retrieveForm").submit();
			
			}
		}
	}

	function selectRecvUserCR(word){
	    var url = "${ctx}/basic/getfuzzyuser.action?source=CR";
	    if(word != ""){
		   callServer3(url,"fuzzy="+word);
	    }else{
		   document.getElementById("allOptionsCR").innerHTML="";
	         }
	} 
	function updateResult1(){
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				if(xmlHttp.responseText.toString().length > 154){
					document.getElementById("allOptionsCR").innerHTML=xmlHttp.responseText;
				}else{
					document.getElementById("allOptionsCR").innerHTML="";
				}
			}else{
				document.getElementById("allOptionsCR").innerHTML="";
			}
	}
	function add_TrueCR(){
		var user_id=$("#allOptionCR").val();
		var user_name=$("#allOptionCR option[value='"+user_id+"']").text();
		user_name=user_name.substring(0,user_name.indexOf("/"));
		if(user_id != ""){
	    	$("#user_id").val(user_id);
			$("#user_name").val(user_name);
			document.getElementById("allOptionsCR").innerHTML="";
		}
	}
	function clearFindForm(){
		LedgerQueryCondForm.barcode.value = "";
		LedgerQueryCondForm.seclv_code.value = "";
		$("#user_name").val("");
		 $("#scope_dept_id").val("");
		$("#spacecd_state").val(""); 
		$("#dept_name").val("");
		QueryCondForm.startTime.value = "";
		QueryCondForm.endTime.value = "";
	}
	function exportLedger(formId,url,url1){
		document.getElementById(formId).action = url;
		document.getElementById(formId).submit();
		document.getElementById(formId).action = url1;
	}
	function spacecd_use(id){
		$("#id").val(id);
		var url = "${ctx}/disc/spacecdchangeuse.action?id="+id;
		var rValue = window.showModalDialog(url,'', 'dialogHeight:480px;dialogWidth:680px;center:yes;status:no;scroll:no;help:no;unadorned:no;resizable:no');
		if(rValue!=null &&　rValue!=undefined){
			$("#file_list").val(rValue.file_list);
			$("#seclv_code").val(rValue.seclv_code);
			$("#comment").val(rValue.comment);
			$("#retrieveForm").submit();
		}
	}
	}
	</script>
</head>
<body oncontextmenu="self.event.returnValue=true">
<form id="retrieveForm" method="POST" action="${ctx}/disc/managedeptspacecdledger.action">
  		<input type="hidden" name="update" id="update" value="Y"/>
	 	<input type="hidden" name="seclv_code" id="seclv_code"/>
	 	<input type="hidden" name="ids" id="ids"/>
	 	<input type="hidden" name="event_code" id="event_code">
	 	<input type="hidden" name="url_type" id="url_type" value="Y"/>
	</form>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" class="table_only_border">
	<tr>
		<td class="title_box">可分发空白盘列表</td>
	</tr>
	<form id="QueryCondForm" method="POST" action="${ctx}/disc/managedeptspacecdledger.action">
	<tr>
		<td align="right">
			<table  table border=0 class="table_box" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td align="center">光盘条码：</td>
					<td>
						<input type="text" id="barcode" name="barcode" value="${barcode}"/>
					</td>
					<td align="center">制作人：</td>
					<td>
						<input type="text" id="user_name" name="user_name" value="${user_name}" onkeyup="selectRecvUserCR(this.value);"/><br>
    		            <div id="allOptionsCR" class="containDiv" style="position:absolute;border:0px solid black;padding:0px">
    		            </div>
					</td>
					<td align="center">归属部门：</td>
					<td>
						<select id="scope_dept_id" name="scope_dept_id">
							<option value="">--不限--</option>
							<s:iterator value="secAdminDeptList" var="dept">
								<option value="${dept.dept_id}">${dept.dept_name}</option>	
							</s:iterator>
						</select>
					</td>
					
				</tr>
				<tr>	
					<td align="center">密级：</td>
					<td>
						<select name="seclv_code" id="seclv_code">
							<option value="">--所有--</option>
							<s:iterator value="#request.seclvList" var="seclv">
								<option value="${seclv.seclv_code}">${seclv.seclv_name}</option>
							</s:iterator>
						</select>
					</td>
					<td align="center">光盘类型：</td>
					<td>
						<select name="cd_type" id="cd_type">
							<option value="">--请选择--</option>
							<option value="CD-R"<c:if test="${cd_type eq 'CD-R'}">selected</c:if>>CD-R</option>
					        <option value="DVD-R" <c:if test="${cd_type eq 'DVD-R'}">selected</c:if>>DVD-R</option>
						</select>
					</td>
					<td align="center">空白盘状态：</td>
					<td>
						<select name="spacecd_state" id="spacecd_state">
							<option value="">--请选择--</option>
							<option value="0" <c:if test="${spacecd_state ==0}">selected</c:if>>未使用</option>
					        <option value="1" <c:if test="${spacecd_state ==1}">selected</c:if>>已分发</option>
						</select>
					</td>	
			<%-- 		<td align="center">空白盘类型：</td>
					<td>
						<select name="spacecd_type" id="spacecd_type">
							<option value="">--请选择--</option>
							<option value="0"<c:if test="${spacecd_type eq '0'}">selected</c:if>>空白盘</option>
					        <option value="1"<c:if test="${spacecd_type eq '1'}">selected</c:if>>中转盘</option>
						</select>
					</td> --%>					
				</tr>
				<tr>
					
					<td align="center">产生时间：</td>
					<td>
						<input type="text" name="startTime" readonly="readonly" style="cursor:hand;" value="${startTime}"/>
        				<img src="${ctx}/_image/time2.jpg" id="startTime_trigger">
					</td>
					<td align="center">至：</td>
					<td>
						<input type="text" name="endTime" readonly="readonly" style="cursor:hand;" value="${endTime}"/>
        				<img src="${ctx}/_image/time2.jpg" id="endTime_trigger">
					</td>
					<td align="center" colspan="2"> 
						<input name="button" type="submit" class="button_2003" value="查询" onclick="return checkTime();">&nbsp;&nbsp;
						<input name="button" type="button" class="button_2003" value="清空" onclick="clearFindForm();">
						<input type="button" class="button_2003" style="display: none;" disabled="disabled" value="导出EXCEL" onclick="exportLedger('LedgerQueryCondForm','${ctx}/ledger/exportdeptcdledger.action','${ctx}/ledger/viewdeptspacecdledger.action');"/>
						</td>
					<!-- <td colspan="4">&nbsp;</td>		 -->			
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table class="displaytable-outter" cellspacing=0 cellpadding=0 border=0 width="100%">
	 			<tr>
	   				<td>
	   					<display:table requestURI="${ctx}/disc/managedeptspacecdledger.action" uid="item" class="displaytable" name="items"
	   							pagesize="15" sort="page" form="LedgerQueryCondForm" excludedParams="*">
							<display:column title="选择">
								<input type="checkbox" value="${item.id}" name="spacecd_id"/>
							</display:column>	
							<display:column title="序号">
								<c:out value="${item_rowNum}"/>
							</display:column>
							<display:column property="barcode" title="光盘条码"/>
							<display:column property="cd_type" title="光盘类型"/>
							<display:column property="seclv_name" title="密级"/>
							<display:column property="scope_dept_name" title="归属部门"/>
							<display:column property="spacecd_state_name" title="状态"/>
							<display:column property="leadin_timename" title="录入时间"/>
							<display:column title="操作" style="width:150px">
								<input type="button" class="button_2003" value="详细" onclick="go('${ctx}/disc/viewspacecdinfo.action?id=${item.id }');"/>&nbsp;&nbsp;
								<input type="button" class="button_2003" value="分发" onclick="addassignJob('${item.id}','${event_code}');"/>	
						<!-- 		<input type="button" class="button_2003" value="一键退回" onclick="addreturnJob();"/> -->						
							</display:column>
						</display:table>
					</td>
				</tr>
			</table>
         </td>
	</tr>
</table>
<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" align="center" class="table_only_border">
	<tr height="40">
		<td align="left">
			<input type="button" value="批量分发" class="button_2003" style="margin-left: 30px" onclick="addassignJob('${item.id}','${event_code}');"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>
