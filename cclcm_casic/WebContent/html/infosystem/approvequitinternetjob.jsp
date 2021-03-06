<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="${ctx}/_css/displaytag.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/_css/css200603.css"  media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/_css/print.css"  media="print"/>
 	<script language="javascript" src="${ctx}/_script/casic304_common.js"></script> 
	<script language="javascript" src="${ctx}/_script/casic304_ajax.js"></script>
 	<script type="text/javascript" src="${ctx}/_script/jquery/jquery.min.js"></script>
 	<script language="javascript" src="${ctx}/_script/casic304_common_bm.js"></script>
 	<script language="javascript" src="${ctx}/_script/jquery.jqprint-0.3.js"></script>
<script>
$(document).ready(function(){
	prepareBizApproval("${process.step_dept}","${process.step_role}","${process.step_dept_name}","${process.step_role_name}","${ctx}");
	if($("#next_approver_all").children().size() == 0){
		$("#selApprover1").hide();
		$("#selApprover2").hide();
	}
	$("#submit_btn").attr("disabled",false);
	
	if("${history}" == "Y"){
		viewOpinion_new("");//判断审批到哪一步
	}else{
		viewOpinion_new("read");//判断审批到哪一步
	}
	$("#page_print").click(function(){
		$(".printContent").jqprint();
	})
});
function setOpinionName(){
	var stepx = Number($("#current_step").val());
	if(stepx == 1){
		return "申请部门领导审核";
	}else if(stepx == 2){
		return "部门保密员检查情况";
	}else if(stepx == 3){
		return "信息安全小组审批";
	}else if(stepx == 4){
		return "信息中心领导意见";
	}else if(stepx == 5){
		return "分配任务";
	}else if(stepx == 6){
		return "信息中心处理情况";
	}else if(stepx == 7){
		return "部门专、兼职保密员备案";
	}else if(stepx == 8){
		return "信息中心备案";
	}
}


function chk(){
	var opinion_name = setOpinionName();
	subOpinion_new(opinion_name);//提交时将审批意见复制给opinion
	
	var this_step = Number($("#listSize").val()) +1;
	if(this_step == 6){
	   if($("#key_code").val() == ""){//后台数据根据该字段是否为空进行更新审批添加字段
			alert("请填写KEY号");
			$("#key_code").focus();
			return false;
		}
	}	
	if($("#opinion").val().trim() == ""){
		alert("审批意见不能为空");
		$("#opinion").focus();
		return false;
	}
	if($("#next_approver_all option").size() > 0 && $("#next_approver_sel option").size() == 0 && $("#approved")[0].checked){
		alert("请选择审批人员");
		$("#next_approver_all").focus();
		return false;
	}
	var next_approver = "";
	$("#next_approver_sel option").each(function(){
		next_approver += this.value+",";
	});
	var len = next_approver.length;
	if (next_approver.lastIndexOf(",") == len - 1){
		next_approver = next_approver.substring(0, len - 1);
	}
	$("#next_approver").val(next_approver);
	return true;
}

</script>
</head>
<div class="printContent">
<body oncontextmenu="self.event.returnValue=false">
<form action="${ctx}/infosystem/approvequitinternetjob.action" method="post" >
	<input type="hidden" name="next_approver" id="next_approver"/>
	<input type="hidden" name="job_code" value="${job.job_code}"/>
	<input type="hidden" id="listSize" name="listSize" value="${listSize}"/> 
	<input type="hidden" id="opinion_all" name="opinion_all" value="${opinion_all}"/>
	<input type="hidden" id="opinion" name="opinion"/>  
	<input type="hidden" id="opinion_history" name="opinion_history" value="${opinion_history}"/>
	<input type="hidden" id="current_step" name="current_step" value="${current_step}"/>
<table width="95%" border="1" cellspacing="0" cellpadding="0" align="center" class="table_box">
	<tr>
	    <td colspan="6" class="title_box">计算机退网审批表</td>
	</tr>
	<tr > 
    	<td width="14%" align="center">申请用户 </td>
    	<td width="20%"><font color="blue"><b>${event.user_name}</b></font></td>
    	<td width="13%" align="center">用户部门 </td>
    	<td width="20%"><font color="blue"><b>${event.dept_name}</b></font></td>
    	<td width="13%" align="center">当前状态 </td>
    	<td width="20%"><font color="red"><b>&nbsp;${event.job_status_name}</b></font></td> 
    </tr>
    
    <tr>
    	<td width="10%" align="center">申请人电话 </td>
    	<td width="23%"><font color="blue"><b>${event.user_phone}</b></font></td>
    	<td align="center">申请时间</td>
		<td width="20%"><font color="blue"><b>&nbsp;${event.apply_time_str}</b></font></td>
		<td>&nbsp;</td>
    	<td>&nbsp;</td>
	</tr>
	<tr>
	    	<td align="center">计算机名称</td>
	    	<td width="23%"><font color="blue"><b>${computer.computer_name}</b></font></td>
	    	<td align="center">责任人</td>
	    	<td width="23%"><font color="blue"><b>${computer.duty_user_name}</b></font></td>
			<td align="center">责任部门</td>
			<td width="23%"><font color="blue"><b>${computer.duty_dept_name}</b></font></td>
	    </tr>
	    <tr>
	    	<td align="center">资产编号</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.computer_code}</b></font></td>
	    	<td align="center">保密编号</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.conf_code}</b></font></td>
			<td align="center">密级</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.seclv_name}</b></font></td>
	    </tr>
    	 <tr>
	    	<td align="center">IP地址</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.computer_ip}</b></font></td>
	    	<td align="center">MAC地址</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.computer_mac}</b></font></td>
			<td align="center">联网情况</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.internet_type_name}</b></font></td>
	    </tr>
	    <tr>
			<td align="center">安装区域</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.storage_area}</b></font></td>
			<td align="center">安装位置</td>
			<td width="20%"><font color="blue"><b>&nbsp;${computer.storage_location}</b></font></td>
			<td>&nbsp;</td>
    		<td>&nbsp;</td>
    	</tr>
    <tr>
		<td align="center">申请原因</td>
		<td colspan="5"><font color="blue"><b>
			${event.event_reason}&nbsp;
		</td>	
	</tr>
    <tr>
		<td align="center">备注</td>
		<td colspan="5"><font color="blue"><b>
			${event.summ}&nbsp;
		</td>		
    </tr>
    <c:if test="${history eq 'Y'}">
		<tr>
	  		<td align="center">审批人：</td>
	  		<td colspan="5"><font color="blue"><b>&nbsp;${job.next_approver_name}</b></font></td>
	  	</tr>
  	</c:if>
     <tr>
		<td align="center">申请部门领导审核</td>
			<td colspan="5" id="step1">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion1" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden1"></td></tr>
				</table>
			</td>
	</tr>
	<tr>
		<td align="center">部门保密员检查情况</td>
			<td colspan="5" id="step2">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion2" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden2"></td></tr>
				</table>
			</td>
	</tr>
	<%-- yangjl“保密处领导审批”更改为“信息安全小组审批” --%>
	<tr>
		<td align="center">信息安全小组审批</td>
			<td colspan="5" id="step3">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion3" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden3"></td></tr>
				</table>
			</td>
	</tr>
	<tr>
		<td align="center">信息中心领导意见</td>
			<td colspan="5" id="step4">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion4" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden4"></td></tr>
				</table>
			</td>
	</tr>
	<tr>
		<td align="center">任务分配</td>
			<td colspan="5" id="step5">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion5" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden5"></td></tr>
				</table>
			</td>
	</tr>
    <tr>
		<td align="center">信息中心处理情况</td>
			<td colspan="5" id="step6">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left" class="table_box"  readonly="readonly">
				<c:if test="${history != 'Y'}">
					<tr>
						<td align="left"><font color="red">*</font>
						 KEY号<input type="text" name="key_code" id="key_code" value="${key_code}" />
						
						IP地址<input type="text" id="computer_ip" name="computer_ip" value="${computer_ip}"/>
						
						交换机IP<input type="text" id="switch_num" name="switch_num" value="${switch_num}"/>
			         </td>
	             </tr>	
			      <tr>
				     <td align="left">
				             交换机端口<input type="text" id="switch_point" name="switch_point" value="${switch_point}"/>
				       VLAN<input type="text" id="vlan_num" name="vlan_num" value="${vlan_num}"/>
				                掩码 <input type="text" id="mark_code" name="mark_code" value="${mark_code}"/>
				                   网关   <input type="text" id="computer_gateway" name="computer_gateway" value="${computer_gateway}"/>
				      </td>
			       </tr>
			    <tr>
			    	 <td align="left" > 软件已注销情况
			    	<s:iterator value="#request.infoTypeSoft5" var="type">
						<input type="checkbox" name="software_type" value="${type.info_id}"/>${type.info_type}&nbsp;&nbsp;
					</s:iterator>
			    	 备注
			    	 <input type="text" id="software_summ" name="software_summ" value="${software_summ}"/>
			    	 </td>
			     </tr>
			     </c:if>
			  <tr><td><textarea id="opinion6" rows="3" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden6"></td></tr>
				</table>
			</td>
	</tr>
	 <tr>
		<td align="center">部门专、兼职保密员备案</td>
			<td colspan="5" id="step7">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion7" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden7"></td></tr>
				</table>
			</td>
	</tr>
	 <tr>
		<td align="center">信息中心备案</td>
			<td colspan="5" id="step8">
				<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr><td><textarea id="opinion8" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
					<tr><td id="hidden8"></td></tr>
				</table>
			</td>
	</tr>
	<c:if test="${history != 'Y'}">
  	<tr>
  		<td align="center" id="selApprover1">选择审批人</td>
  		<td id="selApprover2" colspan="5">
  			<table width="300" border="0" cellspacing="0" cellpadding="0" align="left" class="table_box_border_empty">
				<tr>
					<td id="allApprovers">
						<SELECT ondblclick="add_True('next_approver_all','next_approver_sel');" style="WIDTH: 100px" multiple="true" size="8" id="next_approver_all">
							<c:forEach var="item" items="${userList}" varStatus="status">
								<option value="${item.user_iidd}">${item.user_name}</option>
							</c:forEach>
						</SELECT>
					</td>
					<td aling="center" valign="middle">
						<INPUT class="button_2003" onclick="add_MoreTrue('next_approver_all','next_approver_sel');" type="button" value="增加-->" /><br/>
						<br/>
						<INPUT class="button_2003" onclick="del_MoreTrue('next_approver_sel');" type="button" value="删除<--"><br/>
						<br/>
						<INPUT class="button_2003" onclick="add_all_True('next_approver_all','next_approver_sel');" type="button" value="全部增加" name="btnAddItem" /><br/>
						<br/>
						<INPUT class="button_2003" onclick="del_all_True('next_approver_sel');" type="button" value="全部删除" name="btnDelItem"><br/>
					</td>
					<td>
						<SELECT size="8" multiple="true" style="WIDTH: 100px" ondblclick="del_True('next_approver_sel');" id="next_approver_sel">
						</SELECT>
					</td>
				</tr>
			</table>
		</td>
  	</tr>
  	</c:if>
  	<tr class="Noprint">
	    <td colspan="6" align="center">
	    <c:if test="${history != 'Y'}">
	     	<input class="button_2003" type="submit" value="提交" onclick="return chk();" id="submit_btn" disabled="disabled">&nbsp;
	     </c:if>
			<input class="button_2003" type="button" value="返回" onClick="javascript:history.go(-1);">&nbsp;
		<c:if test="${history == 'Y'}">
			<input type="button" class="button_2003" value="打印" id="page_print" />
		</c:if>
	    </td>
  	</tr>
  	</form>
</table>
</body>
</div>
</html>