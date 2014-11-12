package edu.leo.action;

import java.io.Serializable;
import java.util.List;

public class JQueryTRModel implements Serializable {

	private static final long serialVersionUID = 2615104033921007381L;

	private String id;
	private String name;
	private List<JQueryHobbyModel> hobbyList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<JQueryHobbyModel> getHobbyList() {
		return hobbyList;
	}

	public void setHobbyList(List<JQueryHobbyModel> hobbyList) {
		this.hobbyList = hobbyList;
	}
}
