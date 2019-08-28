package study.model1.retrofit.service;

import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import retrofit2.http.Query;
import study.model1.helper.RetrofitHelper;
import study.model1.retrofit.model.SearchDailyboxOfficeList;

public interface KobisService {
	public static final Retrofit retrofit = RetrofitHelper.getInstance().getRetrofit("http://www.kobis.or.kr");
	
	@GET("/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=8c56c13266968c52f489661f44b76b5b&")
	Call<SearchDailyboxOfficeList> getSearchDailyboxOfficeList(@Query("targetDt") String targetDt);
	
}
