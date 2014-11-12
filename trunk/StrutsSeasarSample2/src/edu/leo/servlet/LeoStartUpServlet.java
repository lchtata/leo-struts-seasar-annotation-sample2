package edu.leo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LeoStartUpServlet extends HttpServlet {

	private static final long serialVersionUID = -7038908616471163548L;

	public void init() throws ServletException {
		System.out.println("LeoStartUpServlet#init() is run..........");
		// 当tomcat启动时解析web.xml会发现此Servlet
		// 然后会执行init方法
		// 可以在此写一些项目启动时需要运行的代码
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("LeoStartUpServlet#doGet() is run..........");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("LeoStartUpServlet#doPost() is run..........");
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("LeoStartUpServlet#service() is run..........");
	}

	public void destroy() {
		System.out.println("LeoStartUpServlet#destroy() is run..........");
	}
}
