---
--- Table: SEC_ROLE 系统内置角色(role_type=1)，三员角色2,普通角色3，特殊角色4
---
INSERT INTO SEC_ROLE(ROLE_ID,ROLE_NAME,SUBSYS_CODE,ROLE_DESC,ROLE_TYPE,ROLE_SPEC_KEY) 
	VALUES('15','刻录管理员','admin','集中刻录，及对刻录失败的任务进行标记',3,'BURNADMIN');

---
--- Table: SEC_OPER 初始化操作列表，仅包含安全模块，其他业务模块的操作列表应该列在其他初始化数据sql文件中
---

--INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020304','一体机管理','admin','basic/managemfp.action','_image/ico/default.gif','N','N');
--INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01020305','刻录机管理','admin','basic/manageburner.action','_image/ico/default.gif','N','N');

INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('0104','刻录管理','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('010401','申请刻录','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040101','提交刻录申请','admin','burn/addburnevent.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040102','查看申请记录','admin','burn/manageburnevent.action','_image/ico/default.gif','N','N');
---INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040103','提交NAS刻录申请','admin','burn/addnasburnevent.action','_image/ico/default.gif','N','N');
---INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040104','查看NAS申请记录','admin','burn/managenasburnevent.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('010402','刻录审批','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040201','待审批列表','admin','basic/manageaprvjob.action?type=BURN','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040202','查看审批记录','admin','basic/viewaprvjob.action?type=BURN','_image/ico/default.gif','N','N');
---INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040203','NAS待审批列表','admin','basic/manageaprvjob.action?type=BURN&file_src=nas','_image/ico/default.gif','N','N');
---INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01040204','NAS查看审批记录','admin','basic/viewaprvjob.action?type=BURN&file_src=nas','_image/ico/default.gif','N','N');

INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011102','光盘台帐','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01110201','个人光盘台帐','admin','ledger/viewselfcdledger.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01110202','处理申请记录','admin','ledger/managehandlecd.action','_image/ico/default.gif','N','N');
																												
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01120202','个人光盘台帐','admin','ledger/viewdeptusercdledger.action','_image/ico/default.gif','N','N');
	
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011303','光盘销毁','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130301','光盘回收','admin','ledger/viewcd.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130302','光盘销毁','admin','ledger/viewretrievedcd.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130303','已销毁列表','admin','ledger/viewdestroycd.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011304','光盘外发','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130401','光盘外发确认','admin','ledger/handlesendcd.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130402','已外发列表','admin','ledger/viewsendcd.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011305','刻录标记','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130501','标记刻录失败','admin','ledger/viewcdburnresult.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011308','光盘归档','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130801','待归档光盘','admin','basic/viewapplycdfile.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130802','已归档光盘','admin','basic/viewfilecd.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130902','光盘总台帐','admin','ledger/viewledger.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01130904','刻录光盘统计','admin','basic/viewcdstatic.action','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('011311','光盘闭环审批','admin',NULL,NULL,'N','Y');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01131101','待审批列表','admin','basic/managehandlejob.action?type=CD','_image/ico/default.gif','N','N');
INSERT INTO SEC_OPER(OPER_CODE,OPER_NAME,SUBSYS_CODE,WEB_URL,ICON_PATH,EN_PRVT_OPER,EN_DIRECTORY) VALUES('01131102','查看审批记录','admin','basic/viewhandlejob.action?type=CD','_image/ico/default.gif','N','N');

---
--- Table: SEC_ROLE_OPER 配置各角色权限
---
--INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020304');
--INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('2','01020305');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('3','01130902');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('5','01130301');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('6','01120202');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('9','01130801');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('9','01130802');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01040201');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01040202');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01131101');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('10','01131102');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01040101');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01040102');
---INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01040103');
---INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01040104');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01110201');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('11','01110202');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('12','01130401');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('12','01130402');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('15','01130501');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('15','01130904');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('16','01130302');
INSERT INTO SEC_ROLE_OPER(ROLE_ID,OPER_CODE) VALUES ('16','01130303');
---
--- Table: SYS_MODULE 系统模块配置
---
INSERT INTO SYS_MODULE(MODULE_CODE,MODULE_NAME) VALUES ('BURN','刻录功能模块');