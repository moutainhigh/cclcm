<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<title>科研工作手册台账列表</title>
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
		addSelectAllCheckbox();
		preCalendar();
		optionSelect();
		if("${secError}" == "Y"){
			alert("勾选的载体密级不一致");
		}
	});
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
		LedgerQueryCondForm.paper_barcode.value = "";
		LedgerQueryCondForm.file_title.value = "";
		//$("#seclv_code").val("");
		$(":checkbox[name='seclv_code1']").attr("checked",false);
		$("#paper_state").val("");
		$("#scope_dept_id").val("");
		LedgerQueryCondForm.startTime.value = "";
		LedgerQueryCondForm.endTime.value = "";
		LedgerQueryCondForm.user_name.value = "";
		LedgerQueryCondForm.dept_name.value = "";
	}	
	function optionSelect(){
		//$("#seclv_code").val("${seclv_code}");
		var codes='${seclv_code1}';
		if($(":checkbox[name='seclv_code1']").size()>0){
			$(":checkbox[name='seclv_code1']").each(function(){
				var code=codes.split(",");
		    	for(var i=0;i<code.length;i++){
		    		if(code[i].trim()==this.value){
		       		$(":checkbox[name='seclv_code1'][value='"+this.value+"']").attr("checked",true);
		      		}
		    	} 
		  	})
		}
		$("#paper_state").val("${paper_state}");
		$("#scope_dept_id").val("${scope_dept_id}");
	}
	function exportLedger(formId,url,url1){
		document.getElementById(formId).action = url;
		document.getElementById(formId).submit();
		document.getElementById(formId).action = url1;
	}
	function chkSubmit(){
		//提交之前把查询语句里的密级多选checkbox清空。解决载体提交的checkbox出现404错误。
		$.each($("input[name=seclv_code]"),function(i){
			$(this).removeAttr("checked");
		});
		
		var seclv_code = -1;
		var submitable = true;
		if($(":checkbox:checked[value!='']").size()>0){
			$(":checkbox:checked[value!='']").each(function (){
				if(seclv_code == -1 || seclv_code == this.id){					
					seclv_code = this.id;
				}else{
					alert("勾选的申请密级不一致，请确认");
					submitable =  false;
					return false;
				}
			});
			if(submitable){
					if($(":radio:checked").size() == 0){
					alert("请勾选闭环方式");
					$("radio:first").focus();
					return false;
				}else{
					$("#LedgerQueryCondForm").attr("action","${ctx}/basic/handlepaperjob.action");
					$("#LedgerQueryCondForm").submit();
				}
				return true;
			}else{
				return false;
			}
		}else{
			alert("请先勾选文件任务");
			return false;
		}
	}	
	</script>
</head>
<body oncontextmenu="self.event.returnValue=false">
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" class="table_only_border">
	<tr>
		<td class="title_box">科研工作手册台账</td>
	</tr>
	<form id="LedgerQueryCondForm" method="post" action="${ctx}/ledger/viewdeptsecretpaperledger.action">
	<input type="hidden" name="isDept" value="Y"/>
	<input type="hidden" name="is_book" value="Y"/>
	<input type="hidden" name="dept_ids" id="dept_ids" value="${dept_ids}" />
	<input type="hidden" name="file_kind" id="file_kind" value="BOOK"/>
	<tr>
		<td align="right">
			<table  table border=0 class="table_box" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td width="8%" align="center">文件条码：</td>
					<td width="25%">
						<input type="text" id="paper_barcode" name="paper_barcode" value="${paper_barcode}"/>&nbsp;
					</td>
					<td width="8%" align="center">文件名：</td>
					<td width="15%">
						<input type="text" id="file_title" name="file_title" value="${file_title}"/>&nbsp;
					</td>
					<td width="8%" align="center">归属部门：</td>
					<!-- 
					<td width="21%">
						<input type="text" id="scope_dept_name" name="scope_dept_name" value="${scope_dept_name}"/>&nbsp;
					</td>
					 -->
					<td width="15%">
						<select id="scope_dept_id" name="scope_dept_id">
							<option value="">--不限--</option>
							<s:iterator value="secAdminDeptList" var="dept">
								<option value="${dept.dept_id}">${dept.dept_name}</option>	
							</s:iterator>
						</select>
					</td>	
					<td width="8%" align="center" rowspan="3"> 
						<input name="button" type="submit" class="button_2003" value="查询" onclick="return checkTime();">&nbsp;
						<input name="button" type="button" class="button_2003" value="清空" onclick="clearFindForm();">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="button_2003" value="导出EXCEL" onclick="exportLedger('LedgerQueryCondForm','${ctx}/ledger/exportdeptpaperledger.action','${ctx}/ledger/viewdeptsecretpaperledger.action','${dept_ids}');"/>
					</td>	
				</tr>
				<tr>
				    <td width="7%" align="center">状态：</td>
					<td width="12%">
						<select name="paper_state" id="paper_state">
							<option value="">--所有--</option>
							<s:iterator value="#request.stateList" var="state">
							<option value="${state.key}">${state.name}</option>
							</s:iterator>				
						</select>
					</td>								
				    <td align="center">制作人：</td>
					<td>
						<input type="text" id="user_name" name="user_name" value="${user_name}" onkeyup="selectRecvUserCR(this.value);"/><br>
    		            <div id="allOptionsCR" class="containDiv" style="position:absolute;border:0px solid black;padding:0px">
    		            </div>
					</td>
						<td align="center">制作部门：
					</td>
					<td>
						<input type="text" id="dept_name" name="dept_name" value="${dept_name}" size="15"/>&nbsp;
					</td>
				</tr>
				<tr>
					<td align="center">密级：</td>
					<td>
						<%-- <select name="seclv_code" id="seclv_code">
							<option value="">--所有--</option>
							<s:iterator value="#request.seclvList" var="seclv">
								<option value="${seclv.seclv_code}">${seclv.seclv_name}</option>
							</s:iterator>
						</select> --%>
						<s:iterator value="#request.seclvList" var="seclv">
							<input type="checkbox" value="${seclv.seclv_code}" name="seclv_code1" id="seclv_code1"/>${seclv.seclv_name}
						</s:iterator>
					</td>
					<td align="center">启用时间：</td>
					<td>
						<input type="text" name="startTime" readonly="readonly" style="cursor:hand;" value="${startTime}"/>
        				<img src="${ctx}/_image/time2.jpg" id="startTime_trigger">
					</td>
					<td align="center">至：</td>
					<td>
						<input type="text" name="endTime" readonly="readonly" style="cursor:hand;" value="${endTime}"/>
        				<img src="${ctx}/_image/time2.jpg" id="endTime_trigger">
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
	   					<display:table requestURI="${ctx}/ledger/viewdeptsecretpaperledger.action" uid="item" class="displaytable" name="paperLedgerList"
	   							pagesize="${pageSize}" sort="page" partialList="true" size="${totalSize}" form="LedgerQueryCondForm" excludedParams="*">		   							   					
						<%-- 	<display:column title="选择">							
			   					<c:choose>
									<c:when test="${item.paper_state == 0}">
										<input type="checkbox" name="_chk" value="${item.paper_barcode}" id="${item.seclv_code}"/>
									</c:when>
									<c:otherwise>
										${item.paper_state_name}
									</c:otherwise>
								</c:choose>
							</display:column> --%>
							<display:column title="序号">
								<c:out value="${item_rowNum}"/>
							</display:column>
							<display:column property="user_name" title="制作人"/>
							<display:column property="dept_name" title="制作部门"/>
							<display:column property="paper_barcode" title="文件条码" maxLength="25"/>
							<display:column property="file_title" title="文件名" maxLength="30"/>
							<display:column property="seclv_name" title="文件密级"/>
							<display:column property="scope_dept_name" title="归属部门" maxLength="20"/>
							<display:column property="print_time" sortable="true" title="启用时间"/>
							<display:column property="paper_state_name" title="状态"/>
							<display:column title="操作" style="width:50px">
								<!-- <input type="button" class="button_2003" value="查看" onclick="go('${ctx}/ledger/viewpaperledgerinfo.action?paper_id=${item.paper_id}');"/>&nbsp; -->
								<input type="button" class="button_2003" value="详细" onclick="go('${ctx}/ledger/viewcycledetail.action?type=PAPER&barcode=${item.paper_barcode}');"/>							
							</display:column>
						</display:table>
					</td>
				</tr>
			</table>
         </td>
	</tr>
	

</table>
<!-- <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" align="center" class="table_only_border">	
	<tr height="40">
		<td align="center">
			<label style="width: 80">
				<input type="radio" name="jobType" value="SEND_PAPER"/>外发
			</label>
			<label style="width: 80">
				<input type="radio" name="jobType" value="FILE_PAPER"/>归档
			</label>
			<label style="width: 80">
				<input type="radio" name="jobType" value="DESTROY_PAPER"/>销毁
			</label>
			<label style="width: 80">
				<input type="radio" name="jobType" value="DELAY_PAPER"/>延期留用
			</label>
			<input type="button" value="批量提交" class="button_2003" style="margin-left: 30px" onclick="return chkSubmit();"/>
		</td>
	</tr>
</table> -->	
</form>
</body>
</html>
