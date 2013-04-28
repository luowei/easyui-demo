package com.rootls.authority.service;

import com.rootls.authority.pojo.BaseUserRole;
import com.rootls.authority.pojo.Criteria;

import java.util.List;

public interface BaseUserRoleService {
	int countByExample(Criteria example);

	BaseUserRole selectByPrimaryKey(String userRoleId);

	List<BaseUserRole> selectByExample(Criteria example);

}