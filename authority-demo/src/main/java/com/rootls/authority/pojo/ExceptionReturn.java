package com.rootls.authority.pojo;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * Ext 异常返回对象
 * 
 * @author rootls
 * @date 2011-10-11 下午12:56:56
 */
public class ExceptionReturn {

	public ExceptionReturn() {
	}

	/**
	 * 异常时的构造方法
	 * 
	 * @param msg
	 *            异常消息
	 */
	public ExceptionReturn(Throwable exceptionMessage) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		exceptionMessage.printStackTrace(pw);
		// 异常情况
		this.success = false;
		//太详细了
		// this.exceptionMessage = sw.toString();
		this.exceptionMessage = exceptionMessage.getMessage();
	}

	/**
	 * 是否成功
	 */
	private boolean success;
	/**
	 * 异常的消息
	 */
	private Object exceptionMessage;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Object getExceptionMessage() {
		return exceptionMessage;
	}

	public void setExceptionMessage(Object exceptionMessage) {
		this.exceptionMessage = exceptionMessage;
	}

}
