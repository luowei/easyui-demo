package com.easyui.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyui.entity.Book;
import com.easyui.service.BookService;
import com.google.gson.Gson;

@SuppressWarnings("serial")
public class BookServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		BookService bookService=new BookService();
		int page;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (NumberFormatException e) {
			page=1;
		}
		int row;
		try {
			row = Integer.parseInt(req.getParameter("rows"));
		} catch (NumberFormatException e) {
			row=10;
		}
		List<Book> list=bookService.listBook(page, row);
		//计算总记录数
		long total=bookService.results();
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		Gson gson=new Gson();
		String json=gson.toJson(map);
		PrintWriter out = resp.getWriter();
		out.write(json);
		out.flush();
	}
	
}
