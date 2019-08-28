package study.model1.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Image {
	@SerializedName("documents")
	public List<Doucments> documents;
	
	public class Doucments{
		@SerializedName("collection")
		public String collection;
		
		@SerializedName("thumbnail_url")
		public String thumbnail_url;
		
		@SerializedName("image_url")
		public String image_url;
		
		@SerializedName("width")
		public int width;
		
		@SerializedName("height")
		public int heigth;
		
		@SerializedName("display_sitename")
		public String display_sitename;
		
		@SerializedName("doc_url")
		public String doc_url;
		
		@SerializedName("datetime")
		public String datetime;
	}

}
