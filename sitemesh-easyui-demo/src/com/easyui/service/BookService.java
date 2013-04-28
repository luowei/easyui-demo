package com.easyui.service;

import java.util.List;

import com.easyui.dao.BookDao;
import com.easyui.entity.Book;

public class BookService {
	
	BookDao bookDao=new BookDao();
	
	public List<Book> listBook(int pageNumber,int pageSize){
		int start=(pageNumber-1)*pageSize;
		List<Book> list=bookDao.listBook(start, pageSize);
		return list;
	}
	
	public long results(){
		return bookDao.results();
	}
	
	
	public boolean updateBook(Book book){
		return bookDao.updateBook(book);
	}
	
	
	public boolean insertBook(Book book){
		return bookDao.insertBook(book);
	}
	
	
	@SuppressWarnings("unchecked")
	public Book findBookById(int id){
		return bookDao.findBookById(id);
	}
	
	
	public boolean deleteBook(int id){
		return bookDao.deleteBook(id);
	}
	
}
