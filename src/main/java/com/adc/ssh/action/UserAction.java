package com.adc.ssh.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.adc.ssh.model.User;
import com.adc.ssh.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户管理Action
 * http://localhost:8080/ssh/user/user-input.action
 *
 */
@Namespace("/user")
@ParentPackage("struts-default")
@Controller
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private static final long serialVersionUID = 1L;

	private User user = new User();
	@Autowired
	private UserService userService;


	/**
	 * 用户列表页面
	 */
	@Override
	@Action(value = "user-list", results = {
			@Result(name = "success", type = "dispatcher", location = "/WEB-INF/content/user/user-list.jsp") })
	public String execute() throws Exception {
		List<User> users = userService.getUsers();

		ActionContext.getContext().put("users", users);
		return SUCCESS;
	}

	/**
	 * 用户增加页面
	 */
	@Action(value = "user-inp", results = {
			@Result(name = "input", type = "dispatcher", location = "/WEB-INF/content/user/user-input.jsp")

	})
	public String doInput() throws Exception {
		System.out.println("111");
		return INPUT;
	}

	/**
	 * 用户数据提交
	 * 
	 * @return
	 * @throws Exception
	 */
	@Action(value = "user-input-submit", results = {
			@Result(name = "success", type = "redirectAction", location = "user-list", params = {}),
			@Result(name = "input", type = "chain", params = { "actionName", "user-input", "namespace", "/user",
					"method", "doInput" }) })
	public String doSubmit() throws Exception {
		userService.addUser(user);

		return SUCCESS;
	}


	@Override
	public User getModel() {
		return user;
	}

	
}
