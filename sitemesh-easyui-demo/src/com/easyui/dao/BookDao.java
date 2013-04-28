package com.easyui.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.easyui.entity.Book;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;


public class BookDao {
	private QueryRunner runner;
	private MysqlDataSource dataSource;
	private Connection connection;
	public BookDao() {
		DbUtils.loadDriver("com.mysql.jdbc.Driver");
		dataSource=new MysqlDataSource();
		dataSource.setUrl("jdbc:mysql://localhost:3306/easyui");
		dataSource.setUser("root");
		dataSource.setPassword("");
		//connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/easyui", "root", "");
		try {
			connection=dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		runner=new QueryRunner(dataSource);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Book> listBook(int pageNumber,int pageSize){
		List<Book> list=new ArrayList<Book>();
		String sql="select * from bookInfo limit " + pageNumber+"," + pageSize ;
		try {
			list = (List<Book>)runner.query(sql, new BeanListHandler(Book.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean deleteBook(int id){
		String sql="delete from bookInfo where bookId="+id;
		try {
			int n=runner.update(connection,sql);
			System.out.println(n);
			//DbUtils.commitAndClose(connection);
			return n==1?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				DbUtils.rollbackAndClose(connection);
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * 根据Id查询一个book
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Book findBookById(int id){
		Book book = null;
		String sql="select * from bookInfo where bookId="+id;
		try {
			List<Book> list=(List<Book>)runner.query(sql, new BeanListHandler(Book.class));
			if(list!=null&&list.size()>0){
				book=list.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
	
	
	public boolean insertBook(Book book){
		String sql="insert into bookInfo values(null,'"+book.getBookName()+"','"+book.getAuthor()+"',"+book.getPrice()+",'"+book.getPubInfo()+"','"+book.getDate()+"')";
		try {
			System.out.println(sql);
			int n=runner.update(connection,sql);
			//DbUtils.commitAndClose(connection);
			return n==1?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				DbUtils.rollbackAndClose(connection);
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return true;
	}
	
	
	
	
	
	
	
	public boolean updateBook(Book book){
		String sql="update bookInfo set bookName='"+book.getBookName()+"',author='"+book.getAuthor()+"',price="+book.getPrice()+"," +
				"pubInfo='"+book.getPubInfo()+"',date='"+book.getDate()+"' where bookId="+book.getBookId();
		try {
			System.out.println(sql);
			int n=runner.update(connection,sql);
			//DbUtils.commitAndClose(connection);
			return n==1?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				DbUtils.rollbackAndClose(connection);
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return true;
	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * 获取总记录数
	 * @return
	 */
	public long results(){
		long results=0;
		String sql="select count(*) count from bookInfo ";
		try {
			List<Map<String,Object>> lst=runner.query(sql, new MapListHandler());
			if(lst!=null){
				Map<String,Object> map=lst.get(0);
				results=(Long)map.get("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}
	
	
}
