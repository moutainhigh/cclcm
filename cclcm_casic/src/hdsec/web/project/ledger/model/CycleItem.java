package hdsec.web.project.ledger.model;

import hdsec.web.project.common.BaseDomain;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 生命周期展示组成元素
 * 
 * @author renmingfei
 * 
 */
public class CycleItem extends BaseDomain {
	private String barcode = "";
	private String entity_type = "";
	private Date oper_time = null;
	private String user_name = "";
	private String dept_name = "";
	private CycleOperEnum oper = null;
	private String job_code = "";

	public String getJob_code() {
		return job_code;
	}

	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getEntity_type() {
		return entity_type;
	}

	public void setEntity_type(String entity_type) {
		this.entity_type = entity_type;
	}

	public Date getOper_time() {
		return oper_time;
	}

	public void setOper_time(Date oper_time) {
		this.oper_time = oper_time;
	}

	public String getOper_time_str() {
		return oper_time == null ? "" : getSdf().format(oper_time);
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

	public CycleOperEnum getOper() {
		return oper;
	}

	public void setOper(CycleOperEnum oper) {
		this.oper = oper;
	}

	public void setOper(String oper) {
		this.oper = CycleOperEnum.valueOf(oper);
	}

	public CycleItem() {
		super();
	}

	public CycleItem(SimpleDateFormat sdf) {
		super(sdf);
	}

}
