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
    <script language="javascript" src="${ctx}/_script/My97DatePicker/WdatePicker.js"></script>
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

	function changeApproved(value){
		if(value == "true"){
			$("#opinion").val("同意");
		}else if(value == "false"){
			$("#opinion").val("不同意");
		}
	}
	
	function chk(){
		subOpinion();//提交时将审批意见复制给opinion
		if($("#opinion").val().trim() == ""){
			alert("审批意见不能为空");
			$("#opinion").focus();
			return false;
		}

		var this_step = Number($("#listSize").val()) +1;
		
		if(this_step == 4){
				if($("#isrecycle").val() == ""){
					alert("请选择是否回收硬盘");
					$("#isrecycle").focus();
					return false;
				}
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
	
	function Isnewdisk(value){
		if(value == "是"){
			$("#isnew").show();
			$("#isnew1").show();
		}else{
			$("#isnew").hide();
			$("#isnew1").hide();
		}
	}
</script>
</head>
<div class="printContent">
<body oncontextmenu="self.event.returnValue=false">
<form action="${ctx}/computer/approvecomputerjob.action" method="post" >
	<input type="hidden" name="next_approver" id="next_approver"/>
	<input type="hidden" name="job_code" value="${job.job_code}"/>
	<input type="hidden" id="listSize" name="listSize" value="${listSize}"/> 
	<input type="hidden" id="opinion_all" name="opinion_all" value="${opinion_all}"/>
	<input type="hidden" id="opinion" name="opinion"/>  

<table width="95%" border="1" cellspacing="0" cellpadding="0" align="center" class="table_box">

	<tr>
		<td colspan="6" class="title_box">计算机报废审批表</td>
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
    		<td align="center">申请人电话</td>
			<td><font color="blue"><b>&nbsp;${event.user_phone}</td>
			<td align="center">作业密级 </td>
    		<td ><font color="blue"><b>&nbsp;${event.seclv_name}</b></font></td>
    		<td>&nbsp;</td>
    		<td>&nbsp;</td>
    	</tr>
    	<tr>
		  	<td colspan="6" align="left">&nbsp;<font color="blue"><b>报废计算机基本信息</td>
		</tr>
		<tr>
    	<td align="center">计算机名称</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.computer_name}
		</td>
    	<td align="center">原保密编号</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.oldconf_code}
		</td>
    	<td align="center">硬盘序列号</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.hdisk_no}
		</td>
    </tr> 						
    <tr>
    	<td align="center">资产编号</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.computer_code}
		</td>
		<td align="center">保密编号</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.conf_code}
		</td>
		<td align="center">密级</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.seclv_name}
		</td>
    </tr>  
    <tr>
    	<td align="center">责任人</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.duty_user_name}
		</td>
		<td align="center">责任部门</td> 
		<td>
			<font color="blue"><b>&nbsp;${computer.duty_dept_name}
		</td>
		<td align="center">责任单位</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.duty_entp_name}
		</td>
    </tr> 
    <tr>
    	<td align="center">操作系统</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.computer_os}
		</td>
		<td align="center">安装时间</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.install_time_str}
		</td>
		<td align="center">KEY编号</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.key_code}
		</td>
    </tr> 
    <tr>
    	<td align="center">IP</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.computer_ip}
		</td>
		<td align="center">MAC</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.computer_mac}
		</td>
		<td align="center">输出端口</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.output_point}
		</td>
    </tr> 
    <tr>
		<td align="center">交换机</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.switch_num}
		</td>
		<td align="center">端口号</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.switch_point}
		</td>
		<td align="center">网络类型</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.internet_type_name}
		</td>
    </tr> 
    
     <tr>
    	<td align="center">计算机状态</td>
		<td>
			<font color="red"><b>&nbsp;${computer.computer_status_name}
		</td>
		<td align="center">存放区域</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.storage_area}
		</td>
		<td align="center">存放位置</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.storage_location}
		</td>
	</tr> 
    
     <tr>
		<td align="center">启用时间</td>
		<td>
			<font color="blue"><b>&nbsp;${computer.enable_time}
		</td>
		<td align="center">备注</td>
		<td colspan="3">
			<font color="blue"><b>&nbsp;${computer.summ}
		</td>
    </tr> 
    <tr>
		<td align="center">申请原因</td>
		<td colspan="5"><font color="blue"><b>${event.event_reason}&nbsp;</td>		
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
		<td align="center">部门意见</td>
		<td colspan="5" id="step1">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion1" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden1"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">任务分配</td>
		<td colspan="5" id="step2">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion2" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden2"></td></tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td align="center">信息中心处理</td>
		<td colspan="5" id="step3">
			<table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td><textarea id="opinion3" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden3"></td></tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td align="center">保密处回收硬盘情况</td>
		<td colspan="5" id="step4">
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
					硬盘序列号<input type="text" id="content" name="content" value="${computer.hdisk_no}"/>
				</td></tr>
				</c:if>
				<tr><td><textarea id="opinion4" rows="4" cols="100" readonly="readonly"></textarea></td></tr>
				<tr><td id="hidden4"><br></td></tr>
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