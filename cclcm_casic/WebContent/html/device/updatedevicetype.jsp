<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改磁介质类型</title>
<link rel="stylesheet" href="${ctx}/_css/css200603.css" type="text/css" media="screen" />
<script language="JavaScript" src="${ctx}/_script/function.js"></script>
<script language="javascript" src="${ctx}/_script/casic304_common.js"></script>

<script  language="JavaScript" >
<!--
function chk(){
    if(document.all.typename.value==''){
        alert("请填写类型名称");
        document.all.typename.focus();
        return false;
    }
	if(!specialCharFilter(document.all.typename.value)){
		alert("类型名称包含特殊字符");
		document.all.typename.focus();
        return false;
	}
    return true;
}
	//-->
</script>
</head>
<body oncontextmenu="self.event.returnValue=false" onload="onHover();">
<center>
<form method="post" action="${ctx}/device/updatedevicetype.action">
	<input type="hidden" name="update" value="Y"/>
	<input type="hidden" name="id" value="${id}"/>
  <table class="table_box" cellspacing=0 cellpadding=0 border=1 width="50%">
	 <tr>
		 <td colspan="2" class="title_box">修改磁介质类型 </td>
    </tr>
    <tr>
      <td width="40%" align="center"><font style="color:red">*</font>类型名称：</td>
      <td><input type="text" name="typename" size="38" value="${type.typename}" maxlength="15"/>
      </td>
    </tr>
    <tr>
      <td align="center">类型描述：</td>
      <td><input type="text" name="content" size="38" value="${type.content}" maxlength="15"/>
      </td>
    </tr>
    <tr>
        <td colspan="2" align="center" class="bottom_box">
            <input type="button" value="修改" class="button_2003" onclick="if(chk()) forms[0].submit();">&nbsp;
            <input type="button" value="返回" class="button_2003" onclick="location.href='${ctx}/device/managedevicetype.action'">
        </td>
    </tr>
  </table>
  </form>
</center>
</body>
</html>
