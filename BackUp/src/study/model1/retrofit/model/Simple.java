package study.model1.retrofit.model;

import com.google.gson.annotations.SerializedName;
/**
 * JSON 데이터를 표현하는 beans 클래스
 * @SerializedName("JSON")
 *
 */
public class Simple {
	@SerializedName("name")
	public String name;
	
	@SerializedName("type")
	public String type;
	
	@SerializedName("img")
	public String img;

}
