package study.model1.retrofit.service;

import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Query;
import study.model1.helper.RetrofitHelper;
import study.model1.retrofit.model.Book;
import study.model1.retrofit.model.Image;

public interface KakaoSearchService {
	public static final Retrofit retrofit = RetrofitHelper.getInstance().getRetrofit("https://dapi.kakao.com");
	
	
	@Headers("Authorization: KakaoAK 1f84f241e9d1a0f871dc40e7926ac5f1")
	@GET("/v3/search/book") 
	Call<Book> getBook(@Query("query") String query, @Query("page")int page, @Query("size") int size);
	 
	@Headers("Authorization: KakaoAK 1f84f241e9d1a0f871dc40e7926ac5f1")
	@GET("/v2/search/image")
	Call<Image> getImage(@Query("query") String query, @Query("page")int page, @Query("size") int size);
}
