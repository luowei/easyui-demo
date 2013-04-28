package com.rootls.authority.service.impl;

import com.rootls.authority.dao.BaseRoleModuleMapper;
import com.rootls.authority.pojo.BaseRoleModule;
import com.rootls.authority.pojo.Criteria;
import com.rootls.authority.service.BaseRoleModuleService;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseRoleModuleServiceImpl implements BaseRoleModuleService {
	@Autowired
	private BaseRoleModuleMapper baseRoleModuleMapper;

	private static final Logger logger = LoggerFactory.getLogger(BaseRoleModuleServiceImpl.class);

	public int countByExample(Criteria example) {
		int count = this.baseRoleModuleMapper.countByExample(example);
		logger.debug("count: {}", count);
		return count;
	}

	public BaseRoleModule selectByPrimaryKey(String roleModuleId) {
		return this.baseRoleModuleMapper.selectByPrimaryKey(roleModuleId);
	}

	public List<BaseRoleModule> selectByExample(Criteria example) {
		return this.baseRoleModuleMapper.selectByExample(example);
	}
}