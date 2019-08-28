package study.model1.retrofit.model;

import com.google.gson.annotations.SerializedName;

public class Grade {
	@SerializedName("student")
	public Student student;
	
	public class Student{
		@SerializedName("name")
		public String name;

		@SerializedName("kor")
		public int kor;
		
		@SerializedName("eng")
		public int eng;
		
		@SerializedName("math")
		public int math;
		
		//자바 빈즈를 만들기 싫어서 그냥 private를 전부다 public으로 오픈한 상황.
	}

}

