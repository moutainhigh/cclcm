<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
</head>
<frameset cols='220,8,*' frameborder='NO' border='0' framespacing='0' name='mainframeset'>
  <frame src='${ctx}/user/getopertree.action?config=Y&subsys_code=${subsys_code}' name='leftframe' scrolling='auto'>
  <frame src='${ctx}/html/user/innerline.htm' name='innerframe' scrolling='no' noresize>
  <frame src='${ctx}/user/configoper.action?oper_code=${oper_code}&subsys_code=${subsys_code}' name='workframe' scrolling='no'>
</frameset>
<noframes></noframes>
<body></body></html>