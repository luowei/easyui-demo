package com.easyui.entity;

public class Book {

	private int bookId;
	private String bookName;
	private String author;
	private double price;
	private String pubInfo;
	private String date;

	public Book() {
	}
	
	
	
	public Book(int bookId, String bookName, String author, double price,
			String pubInfo, String date) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.pubInfo = pubInfo;
		this.date = date;
	}



	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPubInfo() {
		return pubInfo;
	}

	public void setPubInfo(String pubInfo) {
		this.pubInfo = pubInfo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
