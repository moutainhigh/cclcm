package hdsec.web.project.enter.action;

import hdsec.web.project.activiti.model.JobTypeEnum;
import hdsec.web.project.activiti.model.ProcessJob;
import hdsec.web.project.enter.model.EnterEvent;
import hdsec.web.project.user.model.SecLevel;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;
import org.springframework.util.StringUtils;

/**
 * 管理录入任务，录入申请列表 2014-5-15 上午8:06:30
 * 
 * @author gaoximin
 */
public class ManageEnterListJobAction extends EnterBaseAction {
	private static final long serialVersionUID = 1L;
	private Date startTime = null;
	private Date endTime = null;
	private String job_status = "";
	private String seclv_code = "";
	private List<ProcessJob> jobList = null;
	private String entertype = "";

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

	public List<SecLevel> getSeclvList() {
		return userService.getCopySecLevelByUser(getCurUser().getUser_iidd());
	}

	public List<ProcessJob> getJobList() {
		return jobList;
	}

	public String getJobType_code() {
		if (entertype != null && entertype != "" && entertype.equals("SCAN")) {
			return JobTypeEnum.SCAN_LEADIN.getJobTypeCode();
		} else {
			return JobTypeEnum.LEADIN.getJobTypeCode();
		}
	}

	public String getEntertype() {
		return entertype;
	}

	public void setEntertype(String entertype) {
		this.entertype = entertype;
	}

	public String getActionContext() {
		if (entertype != null && entertype != "" && entertype.equals("SCAN")) {
			return "/enter/manageenterlistjob.action?type=SCAN";
		} else {
			return "/enter/manageenterlistjob.action";
		}
	}

	@Override
	public String executeFunction() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_iidd", getCurUser().getUser_iidd());
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("seclv_code", seclv_code);
		if (entertype != null && entertype != "" && entertype.equals("SCAN")) {
			map.put("jobType_code", JobTypeEnum.SCAN_LEADIN.getJobTypeCode());
		} else {
			map.put("jobType_code", JobTypeEnum.LEADIN.getJobTypeCode());
		}
		map.put("job_status", job_status);
		String pageIndexName = new ParamEncoder("item").encodeParameterName(TableTagParameters.PARAMETER_PAGE);
		if (StringUtils.hasLength(getRequest().getParameter(pageIndexName))) {
			page = Integer.parseInt(getRequest().getParameter(pageIndexName)) - 1;
		}
		totalSize = basicService.getJobSize(map);
		beginIndex = page * pageSize;
		RowBounds rbs = new RowBounds(beginIndex, pageSize);
		jobList = basicService.getJobList(map,rbs);
		for (ProcessJob job : jobList) {
			String event_names = "";
			List<EnterEvent> events = enterService.getEnterEventListByJobCode(job.getJob_code());
			for (EnterEvent event : events) {
				event_names += event.getZipfile() + "  ";
			}
			job.setEvent_names(event_names);
		}
		basicService.setClientMsgRead(getCurUser().getUser_iidd(), "LEADIN", 2);
		basicService.setClientMsgRead(getCurUser().getUser_iidd(), "LEADIN", 3);

		return SUCCESS;
	}
}