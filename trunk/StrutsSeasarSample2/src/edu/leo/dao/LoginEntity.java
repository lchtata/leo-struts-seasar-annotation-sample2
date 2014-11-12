package edu.leo.dao;

import java.io.Serializable;
import org.seasar.dao.annotation.tiger.Bean;
import org.seasar.dao.annotation.tiger.Column;

@Bean(table = "t_login")
public class LoginEntity implements Serializable {

	private static final long serialVersionUID = -6794496634787493936L;

	//	public static final String TABLE = "t_login";

	@Column("user_id")
	private String userId;

	@Column("user_pwd")
	private String userPwd;

	//	public static final String userId_COLUMN = "user_id";
	//	public static final String userPwd_COLUMN = "user_pwd";

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
}
