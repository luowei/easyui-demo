package com.easyui.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyui.service.BookService;

@SuppressWarnings("serial")
public class DeleteBookServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		int bookId=0;
		if(id!=null){
			bookId=Integer.parseInt(id);
			BookService bookService=new BookService();
			boolean b=bookService.deleteBook(bookId);
		}
	}
}
