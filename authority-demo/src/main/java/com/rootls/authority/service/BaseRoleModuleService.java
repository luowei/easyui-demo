package com.rootls.authority.service;

import com.rootls.authority.pojo.BaseRoleModule;
import com.rootls.authority.pojo.Criteria;
import java.util.List;

public interface BaseRoleModuleService {
	int countByExample(Criteria example);

	BaseRoleModule selectByPrimaryKey(String roleModuleId);

	List<BaseRoleModule> selectByExample(Criteria example);
}