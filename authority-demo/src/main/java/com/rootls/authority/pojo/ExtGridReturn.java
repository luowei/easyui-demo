package com.rootls.authority.pojo;

import java.util.List;

/**
 * Ext Grid返回对象
 * 
 * @author rootls
 * @date 2011-3-10 下午09:43:35
 */
public class ExtGridReturn {

	/**
	 * 总共条数
	 */
	private int results;
	/**
	 * 所有数据
	 */
	private List<?> rows;

	public ExtGridReturn() {
	}

	public ExtGridReturn(int results, List<?> rows) {
		this.results = results;
		this.rows = rows;
	}

	public int getResults() {
		return results;
	}

	public void setResults(int results) {
		this.results = results;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

}
