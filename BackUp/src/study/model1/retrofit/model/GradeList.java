package study.model1.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class GradeList {
	@SerializedName("student")
	public List<Student> student;
	
	public class Student{
		@SerializedName("name")
		public String name;
		
		@SerializedName("math")
		public int math;
		
		@SerializedName("kor")
		public int kor;
		
		@SerializedName("eng")
		public int eng;
	}

}
