package hdsec.web.project.copy.action;

import hdsec.web.project.activiti.model.JobTypeEnum;
import hdsec.web.project.activiti.model.ProcessJob;
import hdsec.web.project.copy.model.CopyEvent;
import hdsec.web.project.user.model.SecLevel;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;
import org.springframework.util.StringUtils;

/**
 * 管理复印任务
 * 
 * @author lixiang
 * 
 */
public class ManageCopyJobAction extends CopyBaseAction {
	private static final long serialVersionUID = 1L;
	private Date startTime = null;
	private Date endTime = null;
	private String job_status = "";
	private String seclv_code = "";
	private String cycle_type = "";
	private String user_name = "";
	private String dept_name = "";
	private List<ProcessJob> jobList = null;
	private String copy_merge = "";

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

	public String getCycle_type() {
		return cycle_type;
	}

	public void setCycle_type(String cycle_type) {
		this.cycle_type = cycle_type;
	}

	public List<SecLevel> getSeclvList() {
		return userService.getCopySecLevelByUser(getCurUser().getUser_iidd());
	}

	public List<ProcessJob> getJobList() {
		return jobList;
	}

	public String getActionContext() {
		return "/copy/managecopyjob.action";
	}

	public String getJobType_code() {
		return JobTypeEnum.COPY.getJobTypeCode();
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getCopy_merge() {
		return copy_merge;
	}

	public void setCopy_merge(String copy_merge) {
		this.copy_merge = copy_merge;
	}

	@Override
	public String executeFunction() throws Exception {
		jobList = new ArrayList<ProcessJob>();
		List<ProcessJob> tempJobList = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_iidd", getCurUser().getUser_iidd());
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("seclv_code", seclv_code);
		map.put("job_status", job_status);
		map.put("user_name", user_name);
		map.put("dept_name", dept_name);
		map.put("isCopyJob", true);
		String pageIndexName = new ParamEncoder("item").encodeParameterName(TableTagParameters.PARAMETER_PAGE);
		if (StringUtils.hasLength(getRequest().getParameter(pageIndexName))) {
			page = Integer.parseInt(getRequest().getParameter(pageIndexName)) - 1;
		}
		totalSize = basicService.getJobSize(map);
		beginIndex = page * pageSize;
		RowBounds rbs = new RowBounds(beginIndex, pageSize);

		if (cycle_type.isEmpty()) {
			// map.put("isCopyJob", true);
			tempJobList = basicService.getJobList(map, rbs);
			if (tempJobList != null) {
				jobList.addAll(tempJobList);
				tempJobList.clear();
			}
		} else {
			if (cycle_type.equalsIgnoreCase("REMAIN")) {
				if (copy_merge.equalsIgnoreCase("yes")) {
					map.put("jobType_code", JobTypeEnum.valueOf("COPY_MERGE"));
				} else {
					map.put("jobType_code", JobTypeEnum.valueOf("COPY"));
				}
			} else {
				map.put("jobType_code", JobTypeEnum.valueOf("COPY_" + cycle_type));
			}
			tempJobList = basicService.getJobList(map, rbs);
			if (tempJobList != null) {
				jobList.addAll(tempJobList);
				tempJobList.clear();
			}
		}
		for (ProcessJob job : jobList) {
			String event_names = "";
			List<CopyEvent> events = copyService.getCopyEventListByJobCode(job.getJob_code());
			for (CopyEvent event : events) {
				event_names += event.getFile_name() + "  ";
			}
			job.setEvent_names(event_names);
		}
		basicService.setClientMsgRead(getCurUser().getUser_iidd(), "COPY", 2);
		basicService.setClientMsgRead(getCurUser().getUser_iidd(), "COPY", 3);
		return SUCCESS;
	}
}
