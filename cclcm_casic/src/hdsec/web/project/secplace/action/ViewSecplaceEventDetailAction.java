package hdsec.web.project.secplace.action;

import hdsec.web.project.activiti.model.ApproveProcess;
import hdsec.web.project.activiti.model.ProcessJob;
import hdsec.web.project.activiti.model.ProcessRecord;
import hdsec.web.project.common.CCLCMConstants;
import hdsec.web.project.common.bm.BMPropertyUtil;
import hdsec.web.project.secplace.model.EntityVisitor;
import hdsec.web.project.secplace.model.SecplaceEvent;
import hdsec.web.project.secplace.model.SecplaceFile;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

/**
 * 查看涉密场所申请详细信息
 * 
 * @author liuyaling 2015-6-11
 */
public class ViewSecplaceEventDetailAction extends SecplaceBaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String event_code = "";
	// private String op = "";
	private SecplaceEvent event = null;
	private ApproveProcess process = null;
	private ProcessJob job = null;
	private List<ProcessRecord> recordList = null;
	private List<SecplaceFile> secplaceFileList = null;
	private List<EntityVisitor> visitorList = null;
	private String type = "N";
	private String job_code = "";

	public String getEvent_code() {
		return event_code;
	}

	public void setEvent_code(String event_code) {
		this.event_code = event_code;
	}

	public SecplaceEvent getEvent() {
		return event;
	}

	public void setEvent(SecplaceEvent event) {
		this.event = event;
	}

	public ApproveProcess getProcess() {
		return process;
	}

	public void setProcess(ApproveProcess process) {
		this.process = process;
	}

	public ProcessJob getJob() {
		return job;
	}

	public void setJob(ProcessJob job) {
		this.job = job;
	}

	public List<ProcessRecord> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<ProcessRecord> recordList) {
		this.recordList = recordList;
	}

	public List<SecplaceFile> getSecplaceFileList() {
		return secplaceFileList;
	}

	public void setSecplaceFileList(List<SecplaceFile> secplaceFileList) {
		this.secplaceFileList = secplaceFileList;
	}

	public List<EntityVisitor> getVisitorList() {
		return visitorList;
	}

	public void setVisitorList(List<EntityVisitor> visitorList) {
		this.visitorList = visitorList;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getJob_code() {
		return job_code;
	}

	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}

	@Override
	public String executeFunction() throws Exception {
		if (type.equalsIgnoreCase("Y")) {
			event_code = secplaceService.getSecplaceEventCodeByJobCode(job_code);
		}
		event = secplaceService.getSecplaceEventByEventCode(event_code);
		if (event == null) {
			throw new Exception("查询的作业已经被删除");
		} else {
			// 文件列表
			String[] filelist = event.getFile_list().split(CCLCMConstants.DEVIDE_SYMBOL);
			if (filelist.length > 0 && StringUtils.hasLength(filelist[0])) {
				String storePath = BMPropertyUtil.getSecplaceFileStorePath();
				secplaceFileList = new ArrayList<SecplaceFile>();
				String file_path = "";
				for (int i = 0; i < filelist.length; i++) {
					file_path = storePath + "/" + event_code + "/" + filelist[i];
					secplaceFileList.add(new SecplaceFile(filelist[i], file_path));
				}
			}
			// 流程及审批信息
			String job_code = event.getJob_code();// secplaceService.getJobCodeByEventCode(event_code);
			if (StringUtils.hasLength(job_code)) {
				job = basicService.getProcessJobByCode(job_code);
				process = basicPrcManage.getApproveProcessByInstanceId(job.getInstance_id());
				ProcessRecord record = new ProcessRecord();
				record.setJob_code(job_code);
				recordList = activitiService.getProcessRecordList(record);
			}
		}
		return SUCCESS;
	}

}