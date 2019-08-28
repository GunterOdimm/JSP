package study.model1.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Book {
	@SerializedName("documents")
	public List<Doucments> documents;
	
	public class Doucments{
		@SerializedName("authors")
		public String[] authors;
		
		@SerializedName("contents")
		public String contents;
		
		@SerializedName("title")
		public String title;
		
		@SerializedName("url")
		public String url;
		
		@SerializedName("isbn")
		public String isbn;
		
		@SerializedName("datetime")
		public String datetime;
		
		@SerializedName("publisher")
		public String publisher;
		
		@SerializedName("translators")
		public String[] translators;
		
		@SerializedName("price")
		public int price;
		
		@SerializedName("sale_price")
		public int sale_price;
		
		@SerializedName("thumbnail")
		public String thumbnail;
		
		@SerializedName("staus")
		public String staus;
	}

}
