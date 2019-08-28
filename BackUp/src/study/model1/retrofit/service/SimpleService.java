package study.model1.retrofit.service;



import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import study.model1.helper.RetrofitHelper;
import study.model1.retrofit.model.Grade;
import study.model1.retrofit.model.GradeList;
import study.model1.retrofit.model.Simple;
import study.model1.retrofit.model.phone;

public interface SimpleService {

	public static final Retrofit retrofit = RetrofitHelper.getInstance().getRetrofit("http://itpaper.co.kr");
	
	@GET("/demo/java/simple.json")
	Call<Simple> getSimple();
	
	@GET("/demo/java/grade.json")
	Call<Grade> getGrade();
	
	
	@GET("/demo/java/phone.json") 
	Call<phone> getPhone();
	  
	@GET("/demo/java/grade_list.json") 
	Call<GradeList> getGradeList();
	 
}
