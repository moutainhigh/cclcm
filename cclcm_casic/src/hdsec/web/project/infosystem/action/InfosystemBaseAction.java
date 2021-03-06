package hdsec.web.project.infosystem.action;

import hdsec.web.project.activiti.service.ActivitiService;
import hdsec.web.project.basic.service.BasicPrcManage;
import hdsec.web.project.basic.service.BasicService;
import hdsec.web.project.common.action.BaseAction;
import hdsec.web.project.common.util.Constants;
import hdsec.web.project.computer.model.InfoType;
import hdsec.web.project.computer.service.ComputerService;
import hdsec.web.project.log.model.AdminOperLog;
import hdsec.web.project.log.model.CommonOperLog;
import hdsec.web.project.log.service.LogService;
import hdsec.web.project.securityuser.service.SecurityUserService;
import hdsec.web.project.user.model.SecUser;
import hdsec.web.project.user.service.UserService;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

public abstract class InfosystemBaseAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	protected LogService logService;
	@Resource
	protected ComputerService computerService;
	@Resource
	protected UserService userService;
	@Resource
	protected BasicService basicService;
	@Resource
	protected BasicPrcManage basicPrcManage;
	@Resource
	protected ActivitiService activitiService;
	@Resource
	protected SecurityUserService securityUserService;

	protected SecUser curUser = getSecUserFromSession();
	protected AdminOperLog adminOperLog = null;
	protected CommonOperLog commonOperLog = null;

	public SecUser getCurUser() {
		return curUser;
	}

	public void insertAdminLog(String detail) {
		adminOperLog = new AdminOperLog(curUser.getUser_iidd(), curUser.getUser_name(), curUser.getDept_name(), detail,
				"成功", new Date(), Constants.LOG_OPERATION, getRequest().getRemoteAddr(), getRequest().getRemoteHost(),
				"admin");
		logService.addAdminOperLog(adminOperLog);
	}

	public void insertCommonLog(String detail) {
		commonOperLog = new CommonOperLog(curUser.getUser_iidd(), curUser.getUser_name(), curUser.getDept_name(),
				detail, "成功", new Date(), Constants.LOG_OPERATION, getRequest().getRemoteAddr(), getRequest()
						.getRemoteHost(), "admin");
		logService.addCommonOperLog(commonOperLog);
	}

	@Override
	protected String getModuleName() {
		return "infosystem";
	}

	/* 安全产品类分为软件 */
	public List<InfoType> getInfoTypeSoft5() {
		Map<String, Object> allgettype = new HashMap<String, Object>();
		allgettype.put("device_type", "5");
		allgettype.put("statue", "0");
		allgettype.put("product_type", "1");
		return computerService.getInfoTypeList(allgettype);
	}

	/** 安全软件 后台获取软件名称并展示 **/
	public String getSoftName(String Software_type) {
		if (!Software_type.equals("")) {
			InfoType medname = null;
			String names = "";
			String med[] = Software_type.split(",");
			for (int i = 0; i < med.length; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("info_id", med[i].trim());
				medname = computerService.getInfoTypeByID(map);
				if (medname != null) {
					names += medname.getInfo_type() + ",";
				}
			}
			return names;
		}
		return "";
	}
}