package com.rootls.authority.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.rootls.authority.common.springmvc.SpringContextHolder;
import com.rootls.authority.pojo.Criteria;
import com.rootls.authority.service.BaseFieldsService;

/**
 * 系统初始化监听器
 * 
 * @author rootls
 * @date 2011-12-16 下午11:26:14
 */
public class SystemInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext servletContext = sce.getServletContext();
		BaseFieldsService baseFieldsService = SpringContextHolder.getBean("baseFieldsServiceImpl");
		Criteria criteria = new Criteria();
		criteria.setOrderByClause(" field desc ,sort asc ");
		criteria.put("enabled", "1");
		servletContext.setAttribute("fields", baseFieldsService.selectAllByExample(criteria));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
