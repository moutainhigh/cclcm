---
--- Table: SEC_ROLE 系统内置角色(role_type=1)，三员角色2,普通角色3，特殊角色4
---
INSERT INTO SEC_ROLE(ROLE_ID,ROLE_NAME,SUBSYS_CODE,ROLE_DESC,ROLE_TYPE,ROLE_SPEC_KEY) 
	VALUES('14','打印管理员','admin','在打印现场，负责对打印失败的任务进行标记',3,'');
INSERT INTO SEC_ROLE(ROLE_ID,ROLE_NAME,SUBSYS_CODE,ROLE_DESC,ROLE_TYPE,ROLE_SPEC_KEY) 
	VALUES('17','打印纸张统计员','admin','可以查看打印纸张统计情况',3,'');
INSERT INTO SEC_ROLE(ROLE_ID,ROLE_NAME,SUBSYS_CODE,ROLE_DESC,ROLE_TYPE,ROLE_SPEC_KEY) 
	VALUES('20','拼图管理员','admin','为拼图打印的子图补打并粘贴条码',3,'');		
INSERT INTO SEC_ROLE(ROLE_ID,ROLE_NAME,SUBSYS_CODE,ROLE_DESC,ROLE_TYPE,ROLE_SPEC_KEY) 
	VALUES('21','打印专员','admin','打印外发管理',3,'SPECIALPAPERMANAGER');
---
--- Table: SEC_OPER 初始化操作列表，仅包含打印模块，其他业务模块的操作列表应该列在其他初始化数据sql文件中
---
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020114','关键字管理','admin','basic/managekeyword.action','_image/ico/default.gif','N','N');

INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020306','打印机管理','admin','basic/manageprinter.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020310','打印参数配置','admin','basic/configprint.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020501','客户端列表','admin','client/managecvs.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020502','客户端版本列表','admin','basic/viewversionfile.action','_image/ico/default.gif','N','N');

INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('0103','打印管理','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('010301','申请打印','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01030101','启动打印流程','admin','print/submitprintevent.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01030102','查看申请记录','admin','print/manageprintjob.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('010302','打印审批','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01030201','待审批列表','admin','print/manageprintaprvjob.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01030202','查看审批记录','admin','print/viewprintaprvjob.action','_image/ico/default.gif','N','N');

INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011101','文件台帐','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01110101','个人文件台帐','admin','ledger/viewselfpaperledger.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01110102','处理申请记录','admin','ledger/managehandlepaper.action','_image/ico/default.gif','N','N');
																												
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01120201','个人文件台帐','admin','ledger/viewdeptuserpaperledger.action','_image/ico/default.gif','N','N');
	
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011301','文件销毁','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130101','文件回收','admin','ledger/viewpaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130102','文件销毁','admin','ledger/viewretrievedpaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130103','已销毁列表','admin','ledger/viewdestroypaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011302','文件外发','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130201','文件外发确认','admin','ledger/handlesendpaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130202','已外发列表','admin','ledger/viewsendpaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011306','打印标记','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130601','标记打印失败','admin','ledger/viewpaperprintresult.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130602','补打拼图条码','admin','ledger/viewgraphpaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011307','文件归档','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130701','待归档文件','admin','basic/viewapplypaperfile.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130702','已归档文件','admin','basic/viewfilepaper.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130901','文件总台帐','admin','ledger/viewpaperledger.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130903','打印纸张统计','admin','basic/viewpaperstatic.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130905','纸张密级统计','admin','basic/viewpaperstaticbyseclv.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130906','纸张颜色统计','admin','basic/viewpaperstaticbycolor.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130907','纸张单双面统计','admin','basic/viewpaperstaticbydouble.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130908','纸张类型计','admin','basic/viewpaperstaticbysize.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130909','纸张总统计','admin','basic/viewpaperstaticbyall.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011310','文件闭环审批','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01131001','待审批列表','admin','basic/managehandlejob.action?type=PAPER','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01131002','查看审批记录','admin','basic/viewhandlejob.action?type=PAPER','_image/ico/default.gif','N','N');

---
--- Table: SEC_ROLE_OPER 配置各角色权限
---
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020114');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020306');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020310');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020501');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020502');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('3','01130901');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('5','01130101');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('6','01120201');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('9','01130701');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('9','01130702');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01030201');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01030202');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01131001');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01131002');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01030101');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01030102');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01110101');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01110102');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('12','01130201');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('12','01130202');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('14','01020110');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('14','01130601');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('14','01130903');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('20','01130602');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('16','01130102');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('16','01130103');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('17','01130905');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('17','01130906');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('17','01130907');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('17','01130908');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('17','01130909');

---
--- Table: SYS_MODULE 系统模块配置
---
INSERT INTO SYS_MODULE(MODULE_CODE,MODULE_NAME) VALUES ('PRINT','打印功能模块');

---
--- Table: SEC_CONFIG 设置默认系统配置
---
INSERT INTO SEC_CONFIG(ITEM_KEY,ITEM_NAME,ITEM_VALUE,ITEM_TYPE) VALUES ('PRINT_VALID_DAYS','打印任务有效时间','7','PRINT');
INSERT INTO SEC_CONFIG(ITEM_KEY,ITEM_NAME,ITEM_VALUE,ITEM_TYPE) VALUES ('REPPRINT_VALID_DAYS','补打有效时间','7','PRINT');
INSERT INTO SEC_CONFIG(ITEM_KEY,ITEM_NAME,ITEM_VALUE,ITEM_TYPE) VALUES ('REPPRINT_TIMES','补打限制次数','20','PRINT');
INSERT INTO SEC_CONFIG(ITEM_KEY,ITEM_NAME,ITEM_VALUE,ITEM_TYPE,STARTUSE) VALUES ('KEYWORD','关键字检测',null,'PRINT_KW',0);