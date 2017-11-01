package hdsec.web.project.securityuser.action;

import hdsec.web.project.activiti.model.JobTypeEnum;
import hdsec.web.project.securityuser.model.UserEntrustEvent;
import hdsec.web.project.user.model.SecLevel;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 查看用户委托保密管理申请记录
 * 
 * @author gj
 */
public class ManageUserEntrustListAction extends SecurityUserBaseAction {
	private static final long serialVersionUID = 1L;
	private Date startTime = null;
	private Date endTime = null;
	private String job_status = "";
	private String seclv_code = "";
	private Integer entrust_status = null;
	private List<UserEntrustEvent> eventList = null;
	private JobTypeEnum jobType = JobTypeEnum.SECUSER_ENTRUST;

	public String getStartTime_str() {
		return startTime == null ? "" : sdf.format(startTime);
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getEndTime_str() {
		return endTime == null ? "" : sdf.format(endTime);
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getJob_status() {
		return job_status;
	}

	public void setJob_status(String job_status) {
		this.job_status = job_status;
	}

	public String getSeclv_code() {
		return seclv_code;
	}

	public void setSeclv_code(String seclv_code) {
		this.seclv_code = seclv_code;
	}

	public Integer getEntrust_status() {
		return entrust_status;
	}

	public void setEntrust_status(Integer entrust_status) {
		this.entrust_status = entrust_status;
	}

	public List<UserEntrustEvent> getEventList() {
		return eventList;
	}

	public List<SecLevel> getSeclvList() {
		return userService.getSecLevel();
	}

	public JobTypeEnum getJobType() {
		return jobType;
	}

	public String getActionContext() {
		return "/securityuser/manageuserentrustlist.action";
	}

	@Override
	public String executeFunction() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_iidd", getCurUser().getUser_iidd());
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("seclv_code", seclv_code);
		map.put("entrust_status", entrust_status);
		map.put("job_status", job_status);
		eventList = securityUserService.getUserEntrustEventList(map);
		basicService.setClientMsgRead(getCurUser().getUser_iidd(), "USERSECLV_CHANGE", 2);
		basicService.setClientMsgRead(getCurUser().getUser_iidd(), "USERSECLV_CHANGE", 3);
		return SUCCESS;
	}
}
