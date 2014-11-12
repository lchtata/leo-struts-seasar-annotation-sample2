package edu.leo.action;

import java.io.Serializable;
import java.util.List;

public class JQueryTableModel implements Serializable {

	private static final long serialVersionUID = 3884662922872680862L;

	private String tableId;
	private List<JQueryTRModel> trDataList;

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public List<JQueryTRModel> getTrDataList() {
		return trDataList;
	}

	public void setTrDataList(List<JQueryTRModel> trDataList) {
		this.trDataList = trDataList;
	}
}
