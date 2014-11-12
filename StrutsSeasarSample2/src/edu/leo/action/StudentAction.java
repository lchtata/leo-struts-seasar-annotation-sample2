package edu.leo.action;

import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ModelDriven;
import edu.leo.common.CommonConst;
import edu.leo.common.S2ContainerServiceCreater;
import edu.leo.dao.StudentEntity;
import edu.leo.service.StudentService;

/**
 */
@Namespace("/")
@ParentPackage("default")
@Results({
	@Result(name = "search", value = "/JSP/SearchStudent.jsp"),
	@Result(name = "gotoAdd", value = "/JSP/ModifyStudent.jsp"),
})
public class StudentAction extends CommonAction implements ModelDriven<StudentModel> {

	private static final long serialVersionUID = -8758527888343695068L;

	private StudentModel model = new StudentModel();

	private Logger logger = Logger.getLogger(this.getClass());

	public String init() throws Exception {
		logger.debug("init start");
		StudentService vStudentService = S2ContainerServiceCreater.getInstance().getStudentService();
		List<StudentEntity> vEntitys = vStudentService.searchStudent(model);
		model.setDispStudents(vEntitys);
		logger.debug("init end");
		return "search";
	}

	public String gotoAdd() {
		logger.debug("gotoAdd start");
		this.model.setRunModel(CommonConst.RunModel.ADD);
		logger.debug("gotoAdd end");
		return "gotoAdd";
	}

	public String add() throws Exception {
		logger.debug("add start");
		this.validateAdd();
		if (this.getActionErrors().size() > 0) {
			this.model.setRunModel(CommonConst.RunModel.ADD);
			return "gotoAdd";
		} else {
			StudentService vStudentService = S2ContainerServiceCreater.getInstance().getStudentService();
			int vInsertReturn = vStudentService.addStudent(model);
			String vMsg = "成功插入" + vInsertReturn + "条数据";
			this.addActionMessage(vMsg);
		}
		logger.debug("add end");
		return init();
	}

	public String delete() throws Exception {
		logger.debug("delete start");
		StudentService vStudentService = S2ContainerServiceCreater.getInstance().getStudentService();
		int vDeleteReturn = vStudentService.deleteStudent(model.getStudentId());
		String vMsg = "成功删除" + vDeleteReturn + "条数据";
		this.addActionMessage(vMsg);
		logger.debug("add end");
		return init();
	}

	public String gotoUpdate() throws Exception {
		logger.debug("gotoUpdate start");
		this.model.setRunModel(CommonConst.RunModel.UPDATE);
		StudentService vStudentService = S2ContainerServiceCreater.getInstance().getStudentService();
		StudentEntity vEntity = vStudentService.searchStudentByPK(model.getStudentId());
		this.model.setStudentName(vEntity.getStudentName());
		this.model.setStudentAge(String.valueOf(vEntity.getStudentAge()));
		this.model.setStudentSex(vEntity.getStudentSex());
		logger.debug("gotoUpdate end");
		return "gotoAdd";
	}

	public String update() throws Exception {
		logger.debug("update start");
		StudentService vStudentService = S2ContainerServiceCreater.getInstance().getStudentService();
		int vUpdateReturn = 0;
		vUpdateReturn = vStudentService.updateStudent(model);
		String vMsg = "成功更新" + vUpdateReturn + "条数据";
		this.addActionMessage(vMsg);
		logger.debug("update end");
		return init();
	}

	private void validateAdd() {
		if (StringUtils.isEmpty(this.model.getStudentName())) {
			this.addActionError("请输入学生名字.");
		}
		if (StringUtils.isEmpty(this.model.getStudentAge()) || this.model.getStudentAge().equals("0")) {
			this.addActionError("请选择学生年龄.");
		}
		if (StringUtils.isEmpty(this.model.getStudentSex())) {
			this.addActionError("请选择学生性别.");
		}
	}

	public StudentModel getModel() {
		return model;
	}
}