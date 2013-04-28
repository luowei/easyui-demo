package com.easyui.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyui.entity.Book;
import com.easyui.service.BookService;

@SuppressWarnings("serial")
public class AddBookServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//String bookId = request.getParameter("bookId");
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String pubInfo = request.getParameter("pubInfo");
		String date = request.getParameter("date");
		
		Book book = new Book();
		
		BookService bookService=new BookService();
		//book.setBookId(Integer.parseInt(bookId));
		book.setBookName(bookName);
		book.setAuthor(author);
		book.setPrice(Double.parseDouble(price));
		book.setPubInfo(pubInfo);
		book.setDate(date);
		
		bookService.insertBook(book);
		
	}
}
