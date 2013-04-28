package com.rootls.authority.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.rootls.authority.pojo.Criteria;
import com.rootls.authority.pojo.Tree;

/**
 * 
 * 
 * @author rootls
 * @date 2011-12-7 下午2:27:04
 */
public class BaseModulesServiceTest extends ServicesTest {

	@Autowired
	private BaseModulesService baseModulesService;

	@Test
	public void selectAllModules() {
		Criteria criteria = new Criteria();
		Tree tree = baseModulesService.selectAllModules(criteria);
		assertNotNull(tree);
	}
}
