<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增子系统</title>
<link rel="stylesheet" href="${ctx}/_css/css200603.css" type="text/css" media="screen" />
<script language="JavaScript" src="${ctx}/_script/function.js"></script>
<script language="javascript" src="${ctx}/_script/casic304_common.js"></script>
<script  language="JavaScript" >
<!--
function chk()
{
	if(document.all.subsys_code.value=='')
    {
        alert("请填写子系统代号");
        document.all.subsys_code.focus();
        return false;
    }
    if(byteLength(document.all.subsys_code.value) != document.all.subsys_code.value.length){
    	alert("子系统代号包含非半角英文或数字的字符");
        document.all.subsys_code.focus();
        return false;
    }
    if(document.all.subsys_name.value=='')
    {
        alert("请填写子系统名称");
        document.all.subsys_name.focus();
        return false;
    }
	if(!specialCharFilter(document.all.subsys_name.value)){
		alert("子系统名称包含特殊字符");
		document.all.subsys_name.focus();
        return false;
	}
	if(isNaN(document.all.oper_code_prefix.value) || document.all.oper_code_prefix.value.length!=2){
		alert("操作编号前缀必须是2位数字");
		document.all.oper_code_prefix.focus();
        return false;
	}
    return true;
}
	//-->
</script>
</head>
<body onload="onHover();" oncontextmenu="self.event.returnValue=false">
<center>
<form method="post" action="${ctx}/user/addsubsys.action">
  <table class="table_box" cellspacing=0 cellpadding=0 border=1 width="95%">
	 <tr>
		 <td colspan="2" class="title_box">
            	新增子系统
        </td>
    </tr>
    <tr>
      <td width="30%" align="center"><font style="color:red">子&nbsp;系&nbsp;统&nbsp;代&nbsp;号：</font></td>
      <td><input type="text" name="subsys_code" size="38"/>
      </td>
    </tr>
    <tr>
      <td align="center"><font style="color:red">子&nbsp;系&nbsp;统&nbsp;名&nbsp;称：</font></td>
      <td><input type="text" name="subsys_name" size="38"/>
      </td>
    </tr>
    <tr>
      <td align="center"><font style="color:red">操作编号前缀：</font></td>
      <td><input type="text" name="oper_code_prefix" size="38"/>
      </td>
    </tr>
    <tr>
      <td align="center">子&nbsp;系&nbsp;统&nbsp;简&nbsp;介：</td>
      <td>
            <textarea rows="3" cols="38" name="subsys_desc" ></textarea>
      </td>
    </tr>
    <tr>
        <td colspan="2" align="center" class="bottom_box">
            <input type="button" value="添加" class="button_2003" onclick="if(chk()) forms[0].submit();">&nbsp;
            <input type="reset" value="重置" class="button_2003">&nbsp;
            <input type="button" value="返回" class="button_2003" onclick="location.href='${ctx}/user/managesubsys.action'">
        </td>
    </tr>
  </table>
  </form>
</center>
</body>
</html>
