package edu.leo.dao;

import java.util.List;
import org.seasar.dao.annotation.tiger.Arguments;
import org.seasar.dao.annotation.tiger.Query;
import org.seasar.dao.annotation.tiger.S2Dao;
import org.seasar.dao.annotation.tiger.Sql;
import org.seasar.framework.container.annotation.tiger.Aspect;
import org.seasar.framework.container.annotation.tiger.AutoBindingType;
import org.seasar.framework.container.annotation.tiger.Component;
import org.seasar.framework.container.annotation.tiger.InstanceType;

@S2Dao(bean = LoginEntity.class)
public interface LoginDao {

	//	public static final Class BEAN = LoginEntity.class;

	@Arguments({ "userId" })
	@Query("user_id = /*userId*/")
	public LoginEntity getDataByPK(String userId);

	@Query("user_pwd = ?")
	public List<LoginEntity> getDataByUserPwd(String userPwd);

	@Query("user_id = ? and user_pwd = ?")
	public LoginEntity getDataByUserIdPwd(String userId, String userPwd);

	public List<LoginEntity> getAllData();

	@Sql("SELECT MAX(user_id) FROM t_login ")
	public String getMaxUserId();

	@Arguments({ "userIdList" })
	@Query("user_id IN /*userIdList*/('') ")
	List<LoginEntity> findAllByIdList(List<String> userIdList);

	public void insert(LoginEntity loginEntity);

	public int update(LoginEntity loginEntity);

	public int updateModifiedOnly(LoginEntity loginEntity);

	public int delete(LoginEntity loginEntity);
}
