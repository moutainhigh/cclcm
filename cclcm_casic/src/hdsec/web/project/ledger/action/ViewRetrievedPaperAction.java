package hdsec.web.project.ledger.action;

import hdsec.web.project.basic.model.SysConfigItem;
import hdsec.web.project.basic.model.SysRecycleBox;
import hdsec.web.project.ledger.model.EntityPaper;
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
 * 已回收待销毁列表
 * 
 * @author yueying
 * 
 */
public class ViewRetrievedPaperAction extends LedgerBaseAction {
	private static final long serialVersionUID = 1L;
	private List<EntityPaper> paperLedgerList;
	private String paper_barcode;
	private String duty_user_name;
	private String seclv_code;
	private Date start_time;
	private Date end_time;
	private String retrieve_box_code;// 回收柜
	private List<String> dept_ids;
	private String user_name;
	private String dept_name;
	private String hid_dept_ids = "";
	private String retrieveType = "";
	private String paper_barcodes = "";

	public String getHid_dept_ids() {
		return hid_dept_ids;
	}

	public void setHid_dept_ids(String hid_dept_ids) {
		this.hid_dept_ids = hid_dept_ids;
	}

	public List<EntityPaper> getPaperLedgerList() {
		return paperLedgerList;
	}

	public void setPaperLedgerList(List<EntityPaper> paperLedgerList) {
		this.paperLedgerList = paperLedgerList;
	}

	public String getPaper_barcode() {
		return paper_barcode;
	}

	public void setPaper_barcode(String paper_barcode) {
		this.paper_barcode = paper_barcode.trim();
	}

	public String getDuty_user_name() {
		return duty_user_name;
	}

	public String getSeclv_code() {
		return seclv_code;
	}

	public String getStart_time() {
		return sdf.format(start_time);
	}

	public String getEnd_time() {
		return sdf.format(end_time);
	}

	public List<SecLevel> getSeclvList() {
		return userService.getSecLevel();
	}

	public void setDuty_user_name(String duty_user_name) {
		this.duty_user_name = duty_user_name.trim();
	}

	public void setSeclv_code(String seclv_code) {
		this.seclv_code = seclv_code;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public List<SysRecycleBox> getRecycleBoxList() {
		return basicService.getSysRecycleBoxList();
	}

	public String getRetrieve_box_code() {
		return retrieve_box_code;
	}

	public void setRetrieve_box_code(String retrieve_box_code) {
		this.retrieve_box_code = retrieve_box_code;
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

	public void setDept_ids(List<String> dept_ids) {
		this.dept_ids = dept_ids;
	}

	public String getRetrieveType() {
		return retrieveType;
	}

	public void setRetrieveType(String retrieveType) {
		this.retrieveType = retrieveType;
	}

	public String getPaper_barcodes() {
		return paper_barcodes;
	}

	public void setPaper_barcodes(String paper_barcodes) {
		this.paper_barcodes = paper_barcodes;
	}

	public String getDept_ids() {
		String ret = "";
		for (String d_item : dept_ids) {
			ret += d_item + ",";
		}
		if (ret.endsWith(",")) {
			ret = ret.substring(0, ret.length() - 1);
		}
		return ret;
	}

	@Override
	public String executeFunction() throws Exception {
		String web_url = getModuleName().toLowerCase() + "/" + getTitleName().toLowerCase() + ".action";
		dept_ids = basicService.getAdminDeptIdList(getCurUser().getUser_iidd(), web_url);
		if (dept_ids == null || dept_ids.size() == 0) {
			throw new Exception("没有配置管理部门,请联系系统管理员进行配置");
		}
		// for (int i = 0; i < dept_ids.size(); i++) {
		// hid_dept_ids = hid_dept_ids + dept_ids.get(i) + ",";
		// }
		hid_dept_ids = web_url;
		Map<String, Object> map = new HashMap<String, Object>();
		int recover = basicService.getSysConfigItemValue(SysConfigItem.KEY_Recover_On_Off).getStartuse();
		int destroy = basicService.getSysConfigItemValue(SysConfigItem.KEY_SendDestroy_On_Off).getStartuse();
		// if (recover == 0 && destroy == 0) {
		// map.put("is_sendes_1", true);
		// } else if (recover == 1 && destroy == 0) {
		// map.put("is_sendes_1", true);
		// } else {
		// map.put("is_sendes", true);
		// }
		if (recover == 1 && destroy == 1) {
			map.put("is_sendes_1", true);
		} else if (recover == 1 && destroy == 0) {
			map.put("is_sendes_1", true);
		} else if (recover == 0 && destroy == 0) {
			map.put("is_sendes_1", true);
		} else {
			map.put("is_sendes", true);
		}

		// map.put("is_sendes", true);
		if ("批量扫描回收".equals(retrieveType) && paper_barcode != null && !"".equals(paper_barcode)) {
			paper_barcodes = paper_barcode + "," + paper_barcodes;
			map.put("barcodes", paper_barcodes.split(","));
			paper_barcode = "";
		} else {
			paper_barcodes = "";
			map.put("paper_barcode", paper_barcode);
		}
		map.put("duty_user_name", duty_user_name);
		map.put("seclv_code", seclv_code);
		map.put("start_time", start_time);
		map.put("end_time", end_time);
		map.put("retrieve_box_code", retrieve_box_code);
		map.put("admin_dept_ids", dept_ids);
		map.put("retrieve_time_sortable", true);
		map.put("user_name", user_name);
		map.put("dept_name", dept_name);
		map.put("time_type", "retrieve");

		String pageIndexName = new ParamEncoder("item").encodeParameterName(TableTagParameters.PARAMETER_PAGE);
		if (StringUtils.hasLength(getRequest().getParameter(pageIndexName))) {
			page = Integer.parseInt(getRequest().getParameter(pageIndexName)) - 1;
		}
		beginIndex = page * pageSize;
		RowBounds rbs = new RowBounds(beginIndex, pageSize);

		// if (paper_barcode != null && !"".equals(paper_barcode)) {
		totalSize = ledgerService.getAllPaperLedgerSize(map);
		List<EntityPaper> papers = ledgerService.getAllPaperLedgerList(map, rbs);
		paperLedgerList = papers;
		// }
		return SUCCESS;
	}
}
