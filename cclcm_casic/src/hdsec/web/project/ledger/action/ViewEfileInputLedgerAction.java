package hdsec.web.project.ledger.action;

import hdsec.web.project.input.model.InputEvent;
import hdsec.web.project.input.service.InputService;
import hdsec.web.project.user.model.SecLevel;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * 电子文件导入总台账列表 2016-11-30 13:51:10
 * 
 * @author guoxh
 * 
 */
public class ViewEfileInputLedgerAction extends LedgerBaseAction {

	private static final long serialVersionUID = 1L;
	@Resource
	protected InputService inputService;
	private Date startTime = null;
	private Date endTime = null;
	private String job_status = "";
	private String seclv_code = "";
	// private List<ProcessJob> jobList = null;
	private List<InputEvent> eventList = null;

	private String user_iidd = "";

	private String duty_user_name = "";
	private String file_title = "";
	private String dept_name = "";
	private String dept_id = "";
	private String duty_dept_id = "";
	private String duty_dept_name = "";
	private String usage_code = "";

	public String getUsage_code() {
		return usage_code;
	}

	public void setUsage_code(String usage_code) {
		this.usage_code = usage_code;
	}

	public String getDuty_dept_id() {
		return duty_dept_id;
	}

	public void setDuty_dept_id(String duty_dept_id) {
		this.duty_dept_id = duty_dept_id;
	}

	public String getDuty_dept_name() {
		return duty_dept_name;
	}

	public List<SecLevel> getSeclvList() {
		return userService.getSecLevel();
	}

	public void setDuty_dept_name(String duty_dept_name) {
		this.duty_dept_name = duty_dept_name;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getFile_title() {
		return file_title;
	}

	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}

	public String getDuty_user_name() {
		return duty_user_name;
	}

	public void setDuty_user_name(String duty_user_name) {
		this.duty_user_name = duty_user_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

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

	public List<InputEvent> getEventList() {
		return eventList;
	}

	public void setEventList(List<InputEvent> eventList) {
		this.eventList = eventList;
	}

	@Override
	public String executeFunction() throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_iidd", user_iidd);
		map.put("user_name", duty_user_name);
		map.put("dept_name", duty_dept_name);
		map.put("dept_id", dept_id);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("seclv_code", seclv_code);
		map.put("usage_code", usage_code);
		map.put("job_status", job_status);
		map.put("file_title", file_title);
		eventList = inputService.getEfileInputEventList(map);

		return SUCCESS;
	}
}
