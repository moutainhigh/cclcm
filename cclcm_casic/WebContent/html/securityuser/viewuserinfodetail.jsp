<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="${ctx}/_css/displaytag.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/_css/css200603.css"  media="screen"/>
    <script language="javascript" src="${ctx}/_script/jquery/jquery.min.js"></script>
	<script language="JavaScript" src="${ctx}/_script/function.js"></script>
	<script language="javascript" src="${ctx}/_script/casic304_common.js"></script>
	<script language="javascript" src="${ctx}/_script/casic304_ajax.js"></script>
	 <script language="javascript" src="${ctx}/_script/casic304_common_bm.js"></script>
<script>
<!--
$(document).ready(function(){
	if('${event.job_status}' != ""){
		prepareBizApproval("${process.step_dept}","${process.step_role}","${process.step_dept_name}","${process.step_role_name}","${ctx}");
	}
	viewOpinion("");//判断审批到哪一步
	//个人头像展示
	var path = $("#headpath").val();
	if(path != ""){
		var name = path.substring(path.lastIndexOf("/")+1, path.length);
		var newname = $("#userid").val() + "/"+name;
		var newp = "${ctx}/files/secmanage/headshot/" + newname;
		//alert(newp);
		var images = document.getElementById("pic");
		images.src=newp;
	}	
});
function downloadFile(file_path,file_name){
	document.getElementById("file_path").value=file_path;
	document.getElementById("file_name").value=file_name;
	document.getElementById("uploadForm").submit();
}
function getFrameReturn(){
}
//-->
</script>
</head>
<body oncontextmenu="self.event.returnValue=false">
<form action="${ctx}/burn/downloadfile.action" target="hidden_frame" id="uploadForm" method="post">
	<input type="hidden" name="file_path" id="file_path"/>
	<input type="hidden" name="file_name" id="file_name"/>
	<input type="hidden" id="listSize" name="listSize" value="${listSize}"/> 
    <input type="hidden" id="opinion_all" name="opinion_all" value="${opinion_all}"/> 
</form>
<iframe height="0" width="0" frameborder="0" id="hidden_frame" name="hidden_frame" onload="getFrameReturn();"></iframe>
<table width="95%" border="1" cellspacing="0" cellpadding="0" align="center" class="table_box">
	<input type="hidden" id="listSize" name="listSize" value="${listSize}"/> 
	<input type="hidden" id="opinion_all" name="opinion_all" value="${opinion_all}"/> 
	<input type="hidden" id="headpath" name="headpath" value="${headpath}"/>
	<input type="hidden" id="userid" name="userid" value="${event.user_iidd}"/>
	<tr>
	    <td colspan="8" class="title_box">查看用户信息完善作业详情</td>
	</tr>
	<tr>
    	<td width="10%" align="center">申请用户 </td>
    	<td width="15%"><font color="blue"><b>&nbsp;${event.user_name}</b></font></td>
    	<td width="10%" align="center">当前状态 </td>
    	<td width="15%"><font color="red"><b>&nbsp;${event.job_status_name}</b></font></td>
    	<td width="10%"align="center">申请用户部门 </td>
    	<td width="15%"><font color="blue"><b>&nbsp;${event.dept_name}</b></font></td>
    	<td rowspan="4" colspan="2" align="center">
			<img id="pic" src="${ctx}/_image/personal.jpg" width="130" height="100"><br><br>
		</td>
	</tr>
<tr>
	<td width="10%"align="center">申请时间 </td>
    <td width="15%"><font color="blue"><b>&nbsp;${event.apply_time_str}</b></font></td>
	<td align="center">姓名</td>
	<td><font color="blue"><b>&nbsp;${userinfo.base_username}</b></font></td>
	<td align="center">性别</td>
    <td><font color="blue"><b>&nbsp;${userinfo.base_sex_name}</b></font></td>
</tr>
<tr>
	<td align="center">国籍</td>
	<td><font color="blue"><b>&nbsp;${userinfo.base_country}</b></font></td>
	<td align="center">民族</td>
	<td><font color="blue"><b>&nbsp;${userinfo.base_nation}</b></font></td>
	<td align="center">籍贯</td>
	<td><font color="blue"><b>&nbsp;${userinfo.base_nativeplace}</b></font></td>
</tr>
<tr>
	<td align="center">出生日期</td>
	<td><font color="blue"><b>&nbsp;${userinfo.base_birthday}</b></font></td>
	<td align="center">政治面貌</td>
	<td><font color="blue"><b>&nbsp;${userinfo.base_politics_name}</b></font></td>
   	<td align="center">&nbsp;婚姻状况 </td>
   	<td><font color="blue"><b>&nbsp;${userinfo.marital_status_str}</b></font></td>
</tr>
<tr>
	<td align="center">学历</td>
	<td><font color="blue"><b>&nbsp;${userinfo.edu_education_name}</b></font></td>
   	<td align="center">身份证号</td>
   	<td><font color="blue"><b>&nbsp;${userinfo.idcard}</b></font></td>
	<td align="center">电子邮箱</td>
	<td><font color="blue"><b>&nbsp;${userinfo.com_email}</b></font></td>
    <td align="center">联系电话</td>
    <td><font color="blue"><b>&nbsp;${userinfo.com_telephone}</b></font></td>	
</tr>
<tr>
	<td align="center">户籍所在地</td>
	<td colspan="3"><font color="blue"><b>&nbsp;${userinfo.com_residency}</b></font></td>
	<td align="center">现住址</td>
	<td colspan="3"><font color="blue"><b>&nbsp;${userinfo.com_address}</b></font></td>
</tr>
<tr>
    <td align="center">职务</td>
    <td><font color="blue"><b>&nbsp;${userinfo.job_techpost}</b></font></td>
	<td align="center">职称</td>
	<td><font color="blue"><b>&nbsp;${userinfo.job_techtitle}</b></font></td>
	<td align="center">参加工作时间</td>
	<td colspan="3"><font color="blue"><b>&nbsp;${userinfo.job_insectime}</b></font></td>
</tr>
<tr>
	<td align="center">涉密等级</td>
	<td><font color="blue"><b>&nbsp;${secUser.security_name}</b></font></td>
	<td align="center">岗位类别</td>
	<td colspan="5"><font color="blue"><b>&nbsp;${userinfo.bmpost_name}</b></font></td>
	<%-- <td align="center">&nbsp;涉密类别</td>
	<td colspan="3"><font color="blue"><b>&nbsp;${userinfo.sec_category}</b></font></td> --%>
</tr>
<tr>
    <td align="center">因私出国（境）情况</td>
    <td><font color="blue"><b>&nbsp;${userinfo.is_abroad_name}</b></font></td>
	<td align="center">他国绿卡或永久居留证</td>
	<td><font color="blue"><b>&nbsp;${userinfo.resident_card}</b></font></td>
	<td align="center">本人海外经历</td>
	<td><font color="blue"><b>&nbsp;${userinfo.oversea_name}</b></font></td>
	<td align="center">配偶子女海外经历</td>
	<td><font color="blue"><b>&nbsp;${userinfo.famliy_oversea_name}</b></font></td>	
</tr>
<c:if test="${userinfo.is_abroad == '1'}">
<tr>
    <td align="center">最近两次出国情况</td>
    <td colspan="6">
		<table border rules=all width="100%" border="0" cellspacing="0" cellpadding="0" align="left"  class="table_box_bottom_border">
    		<tr>
				<td align="center" width="20%"><font color="blue"><b>&nbsp;出国时间段</b></font></td>
				<td align="center" width="10%"><font color="blue"><b>&nbsp;出国地点</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;出国事由</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;出境海关</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;入境海关</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;陪同人员</b></font></td>
			</tr>
			<s:iterator value="#request.abroadinfo" var="itemm">
  				<tr>
  					<td align="center" width="20%"><font color="blue"><b>&nbsp;${itemm.abroad_time}至${itemm.back_time}</b></font></td>
  					<td align="center" width="10%"><font color="blue"><b>&nbsp;${itemm.abroad_place}</b></font></td>
  					<td align="center" width="15%"><font color="blue"><b>&nbsp;${itemm.abroad_reason}</b></font></td>
  					<td align="center" width="15%"><font color="blue"><b>&nbsp;${itemm.out_customs}</b></font></td>
  					<td align="center" width="15%"><font color="blue"><b>&nbsp;${itemm.in_customs}</b></font></td>
  					<td align="center" width="15%"><font color="blue"><b>&nbsp;${itemm.abroad_content}</b></font></td>
  				</tr>
  			</s:iterator>
		</table>
	</td>
	<td>
		<table border rules=all width="100%" border="0" cellspacing="0" cellpadding="0" align="left"  class="table_box_bottom_border">
    		<tr>
				<td align="center" width="20%"><font color="blue"><b>&nbsp;在外情况汇报</b></font></td>
			</tr>
			<s:iterator value="#request.burnFileList" var="burnFile">
  				<tr>
  					<td align="center"><u><label style="color: blue;cursor: pointer;" onclick="downloadFile('${burnFile.file_path}','${burnFile.file_name}');">${burnFile.file_name}</label></u></td>	  		
  				</tr>
			</s:iterator>
		</table>		
	</td>
</tr>
</c:if>
<tr>
	<td align="center">个人简历</td>
	<td colspan="7">
		<font color="blue"><b>&nbsp;
    		<table border rules=all width="90%" border="0" cellspacing="0" cellpadding="0" align="left"  class="table_box_bottom_border">
    		<tr>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;开始时间</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;结束时间</b></font></td>
				<td align="center" width="55%"><font color="blue"><b>&nbsp;工作/学习经历</b></font></td>
			</tr>		
	  			<s:iterator value="#request.experienceinfo" var="itemmm">
	  				<tr>
	  					<td align="center"><font color="blue"><b>&nbsp;${itemmm.experience_time}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${itemmm.end_time}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${itemmm.experience_content}</b></font></td>
	  				</tr>
				</s:iterator>
  			</table>
		</b></font>
	</td>
</tr>
<tr>
	<td align="center">家庭成员信息</td>
	<td colspan="7">
		<font color="blue"><b>&nbsp;
    		<table border rules=all width="90%" border="0" cellspacing="0" cellpadding="0" align="left"  class="table_box_bottom_border">
    		<tr>
				<td align="center" width="10%"><font color="blue"><b>&nbsp;与本人关系</b></font></td>
				<td align="center" width="10%"><font color="blue"><b>&nbsp;姓名</b></font></td>
				<td align="center" width="10%"><font color="blue"><b>&nbsp;国籍</b></font></td>
				<td align="center" width="10%"><font color="blue"><b>&nbsp;出生年月</b></font></td>
				<td align="center" width="10%"><font color="blue"><b>&nbsp;政治面貌</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;工作地点</b></font></td>
				<td align="center" width="15%"><font color="blue"><b>&nbsp;现居住地</b></font></td>		
				<td align="center" width="20%"><font color="blue"><b>&nbsp;有无绿卡或永久居住证</b></font></td>			
			</tr>		
	  			<s:iterator value="#request.familyinfo" var="ite">
	  				<tr>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_relationship}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_name}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_nationality}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_borndate}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_politicalstatus}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_workplace}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_lifeplace}</b></font></td>
	  					<td align="center"><font color="blue"><b>&nbsp;${ite.family_greencard}</b></font></td>
	  				</tr>
				</s:iterator>
  			</table>
		</b></font>
	</td>
</tr>
	<tr>
		<td align="center">本部门审核</td>
		<td colspan="7" id="step1">
			<table width="95%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td>
					<textarea id="opinion1" rows="4" cols="100" readonly="readonly"></textarea>
				</td></tr>
				<tr><td id="hidden1"></td></tr>
		</table>
	</tr>
	<tr>
		<td align="center">人事部审核</td>
		<td colspan="7" id="step2">
			<table width="95%" border="0" cellspacing="0" cellpadding="0" align="left">
				<tr><td>
					<textarea id="opinion2" rows="4" cols="100" readonly="readonly"></textarea>
				</td></tr>
				<tr><td id="hidden2"></td></tr>
		</table>
	</tr>  	
  	<tr>
	    <td colspan="8" align="center">
			<input class="button_2003" type="button" value="返回" onClick="javascript:history.go(-1);">&nbsp;
	    </td>
  	</tr>
</table>
</form>
</body>
</html>
