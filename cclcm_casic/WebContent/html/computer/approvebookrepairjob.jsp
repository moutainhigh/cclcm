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
 	<script language="javascript" src="${ctx}/_script/My97DatePicker/WdatePicker.js"></script>
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
			viewOpinion("");//判断审批到哪一步
		}else{
			viewOpinion("read");//判断审批到哪一步
		}
		$("#page_print").click(function(){
			$(".printContent").jqprint();
		})
	});
	
	function chk(){
		subOpinion();//提交时将审批意见复制给opinion
		
		var this_step = Number($("#listSize").val()) +1;
		if(this_step == 4){
			/* if($(":checkbox:checked[name='software_type'][value!='']").size()==0){
				alert("请勾选软件安装情况");
				return false;
			} */
			if($("#operation_content").val() == ""){
				alert("请填写办理其他业务");
				$("#operation_content").focus();
				return false;
			}
		}else if(this_step == 5){
			if($("#isrecycle").val() == ""){
				alert("请选择是否回收硬盘");
				$("#isrecycle").focus();
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

	function IsRecycle(){
		if($("#isrecycle").val() == "是"){
			$("#recycle").show();
		}else{
			$("#recycle").hide();
		}
	}
	function IsOpe(value){
		if(value == "是"){
			$("#isope").show();
		}else{
			$("#isope").hide();
		}
	}
</script>
</head>
<div class="printContent">
<body oncontextmenu="self.event.returnValue=false">
<form action="${ctx}/computer/approvebookjob.action" method="post" >
	<input type="hidden" name="next_approver" id="next_approver"/>
	<input type="hidden" name="job_code" value="${job.job_code}"/>
	<input type="hidden" id="listSize" name="listSize" value="${listSize}"/> 
	<input type="hidden" id="opinion_all" name="opinion_all" value="${opinion_all}"/>
	<input type="hidden" id="opinion" name="opinion"/> 
	<input type="hidden" id="current_step" name="current_step" value="${current_step}"/> 
	<input type="hidden" id="opinion_history" name="opinion_history" value="${opinion_history}"/> 
	<input type="hidden" name="event_code" id="event_code" value="${event_code}"/> 
<table width="95%" border="1" cellspacing="0" cellpadding="0" align="center" class="table_box">
	<tr>
	    <td colspan="6" class="title_box">笔记本维修审批表</td>
	</tr>
	<tr> 
		<td width="15%" align="center">申请用户 </td>
    	<td width="23%"><font color="blue"><b>${event.user_name}</b></font></td>
    	<td width="10%" align="center">用户部门 </td>
    	<td width="23%"><font color="blue"><b>${event.dept_name}</b></font></td>
    	<td width="10%" align="center">申请状态 </td>
    	<td width="15%"><font color="red"><b>${job.job_status_name}</b></font></td> 
    </tr>
    <tr>
		<td align="center">业务类型</td>
    	<td><font color="blue"><b>${job.jobType.jobTypeName}</b></font></td>
    	<td align="center">申请人电话</td>
		<td colspan="3"><font color="blue"><b>${event.user_phone}</b></font></td>
	</tr>
     <tr>
     	<td align="center">名称型号</td>
		<td ><font color="blue"><b>&nbsp;${book.book_model}</td>
		<td align="center">统一编号 </td>
   		<td ><font color="blue"><b>&nbsp;${book.book_code}</b></font></td>
   		<td align="center">保密编号</td>
		<td ><font color="blue"><b>&nbsp;${book.conf_code}</td>
     </tr>
     <tr>
		<td align="center">使用单位</td>
		<td ><font color="blue"><b>&nbsp;${book.duty_entp}</td>
		<td align="center">原保密编号 </td>
   		<td ><font color="blue"><b>&nbsp;${book.oldconf_code}</b></font></td>
		<td align="center">设备密级 </td>
   		<td ><font color="blue"><b>&nbsp;${book.seclv_name}</b></font></td>
	</tr>
	<tr>
		<td align="center">硬盘序列号 </td>
   		<td ><font color="blue"><b>&nbsp;${book.hdisk_no}</b></font></td>
		<td align="center">安装地点</td>
   		<td ><font color="blue"><b>&nbsp;${book.storage_location}</b></font></td>
   		<td align="center">笔记本状态</td>
   		<td><font color="blue"><b>&nbsp;${book.book_status_name}</b></font></td>
	</tr>
	<tr>
		<td align="center">备注</td>
		<td colspan="5"><font color="blue"><b>${event.summ}&nbsp;</td>		
    </tr>
    <c:if test="${history eq 'Y'}">
		<tr>
	  		<td align="center">下一步骤审批人</td>
	  		<td colspan="5"><font color="blue"><b>&nbsp;${job.next_approver_name}</b></font></td>
	  	</tr>
  	</c:if>
    <tr>
		<td align="center">申请部门领导意见</td>
		<td colspan="5" id="step1">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion1" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden1"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">维修部门领导意见</td>
		<td colspan="5" id="step2">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion2" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden2"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">任务分配</td>
		<td colspan="5" id="step3">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion3" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden3"></td></tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td align="center">维修人员办理</td>
		<td colspan="5" id="step4">
			<table width="90%" border="0" cellspacing="0" cellpadding="0" align="left">
			<c:if test="${history != 'Y'}">
				<tr>
					<td align="center" width="20%">是否更换硬盘</td>
					<td width="30%"><select id="operation_content" name="operation_content">
							<option value="">--请选择--</option>
							<option value="是">是</option>
							<option value="否">否</option>
			    	 	</select></td>
					<td align="center" width="20%">新硬盘序列号</td>
					<td width="20%"><input type="text" name="operation_content" id="operation_content" /></td>
				</tr>
				<tr>
					<td align="center">是否增加新硬盘</td>
					<td><select id="operation_content" name="operation_content">
							<option value="">--请选择--</option>
							<option value="是">是</option>
							<option value="否">否</option>
			    	 	</select></td>
					<td align="center">新硬盘序列号</td>
					<td><input type="text" name="operation_content" id="operation_content" /></td>
				</tr>
				<tr>
					<td align="center">是否更换其他部件</td>
					<td><select id="operation_content" name="operation_content">
							<option value="">--请选择--</option>
							<option value="是">是</option>
							<option value="否">否</option>
			    	 	</select></td>
					<td align="center">部件名称</td>
					<td><input type="text" name="operation_content" id="operation_content" /></td>
				</tr>
				<tr>
					<td align="center">是否增加内存</td>
					<td><select id="operation_content" name="operation_content">
						<option value="">--请选择--</option>
							<option value="是">是</option>
							<option value="否">否</option>
			    	 	</select></td>
					<td align="center">具体描述</td>
					<td><input type="text" name="operation_content" id="operation_content" /></td>
				</tr>
				<tr>
					<td align="center"><font color="red">*</font>是否重装操作系统</td>
					<td colspan="3"><select id="operation_content" name="operation_content" onchange="IsOpe(this.value)">
							<option value="">--请选择--</option>
							<option value="是">是</option>
							<option value="否">否</option>
			    	 	</select></td>
				</tr>
				<tr id="isope" style="display: none">
					<td align="center">操作系统</td>
					<td><input type="text" name="operation_content" id="operation_content" /></td>
			    	<td align="center">操作系统安装时间</td><td><input type="text" id="start_t" name="start_t" onclick="WdatePicker()" class="Wdate"/></td>					   
			    </tr>
			    <tr>
			    	<td align="center">维修人</td>
			    	<td><input type="text" id="operation_user_id" name="operation_user_id"/></td>
			    	<td align="center">维修时间</td>
			    	<td><input type="text" id="operation_time" name="operation_time" onclick="WdatePicker()" class="Wdate"/></td>	   
			    </tr>
				<tr>
					<td align="center">解决办法</td>
					<td><input type="text" name="operation_content" id="operation_content" /></td>
					<td align="center">维修地点</td>
					<td><input type="text" name="operation_content" id="operation_content" /></td>
				</tr>
<%-- 				<tr>
					<td align="center"><font color="red">*</font>软件已安装情况</td>
					<td>
					<s:iterator value="#request.infoTypeSoft5" var="type">
						<input type="checkbox" id="software_type" name="software_type" value="${type.info_id}"/>${type.info_type}
					</s:iterator>
					</td>
			    	<td align="center">未安装原因</td>	
					<td><input type="text" id="software_summ" name="software_summ"/></td>						   
			    </tr>	 --%>				
			</c:if>				   
			    <tr>
			    	<td colspan="5" id="step4">
						<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
							<tr><td><textarea id="opinion4" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
							<tr><td id="hidden4"></td></tr>
						</table>
					</td>
			    </tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">保密处回收硬盘</td>
		<td colspan="5" id="step5">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
			<c:if test="${history != 'Y'}">
				<tr><td><font color="red">*</font>是/否回收硬盘
					<select id="isrecycle" name="isrecycle" onchange="IsRecycle()">
							<option value="">--请选择--</option>
							<option value="是">是</option>
							<option value="否">否</option>
			    	 </select>
				</td></tr>
				<tr><td id="recycle" style="display: none">
					硬盘序列号<input type="text" id="content" name="content" value="${book.hdisk_no}"/>
				</td></tr>
			</c:if>
				<tr><td><textarea id="opinion5" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden5"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">申请人确认</td>
		<td colspan="5" id="step6">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion6" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden6"></td></tr>
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
</table>
</form>
</body>
</div>
</html>