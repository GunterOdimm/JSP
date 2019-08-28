package study.model1.retrofit.model;

import com.google.gson.annotations.SerializedName;

public class phone {
	@SerializedName("rt")
	public String rt;
	
	@SerializedName("rtmsg")
	public String rtmsg;
	
	@SerializedName("item")
	public Item item;
	
	public class Item{
		@SerializedName("name")
		public String name;
		
		@SerializedName("type")
		public String type;
		
		@SerializedName("img")
		public String img;
		
		@SerializedName("price")
		public Price price;
		
		public class Price{
			@SerializedName("fixed")
			public int fixed;
			
			@SerializedName("sale")
			public int sale;
		}
	}

}
