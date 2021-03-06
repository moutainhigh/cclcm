<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>添加特殊打印制作类型</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${ctx}/_css/css200603.css" type="text/css" media="screen" />
	<script language="javascript" src="${ctx}/_script/jquery/jquery.min.js"></script>
	<script language="javascript" src="${ctx}/_script/casic304_common.js"></script>
	<script  language="JavaScript" >
	<!--
	$(document).ready(function(){
		onHover();
	});
	function chk()
	{
		if($("#usage_code").val().trim() == ""){
			alert("请填写类型特征值");
			$("#usage_code").focus();
			return false;
		}
		if($("#usage_name").val().trim() == ""){
			alert("请填写类型名称");
			$("#usage_name").focus();
			return false;
		}
		if($("#usage_content").val().length > 1024){
			alert("类型说明不能超过1024个字符");
			$("#usage_content").focus();
			return false;
		}
		if(!checkCode($("#usage_code").val())){
			alert("类型特征值只能由数字，字母或下划线组成，长度小于30位");
			$("#usage_code").focus();
			return false;
		}
		if(!checkCode_addword($("#usage_name").val())){
			alert("类型名称只能由数字、字母、汉字或下划线组成，长度小于30位");
			$("#usage_name").focus();
			return false;
		}
	    return true;
	}
	//-->
	</script>
</head>
<body oncontextmenu="self.event.returnValue=true">
<center>
<form method="post" action="${ctx}/basic/addspecialpapertype.action">
  	<table class="table_box" cellspacing=0 cellpadding=0 border=1 width="60%">
	 <tr>
		 <td colspan="2" class="title_box">
            	添加特殊打印制作类型
        </td>
    </tr>
    <tr>
    	<td align="center"><font color="red">*</font>类型特征值：</td>
		<td>
			<input type="text" name="usage_code" id="usage_code"/>
		</td>
    </tr>
    <tr>
    	<td align="center"><font color="red">*</font>类型名称：</td>
		<td>
			<input type="text" name="usage_name" id="usage_name"/>
		</td>
    </tr>
    <tr>
    	<td align="center">类型说明：</td>
		<td>
			<textarea rows="3" cols="60" name="usage_content" id="usage_content"></textarea>
		</td>
    </tr>
    <tr>
        <td colspan="2" align="center" class="bottom_box">
            <input type="submit" value="添加" class="button_2003" onclick="return chk();">&nbsp;
            <input type="reset" value="重置" class="button_2003">
            <input type="button" value="返回" class="button_2003" onclick="javascript:history.go(-1);">
        </td>
    </tr>
  	</table>
</form>
</center>
</body>
</html>