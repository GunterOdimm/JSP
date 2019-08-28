package study.model1.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class SearchDailyboxOfficeList {
	@SerializedName("boxOfficeResult")
	public BoxOfficeResult boxOfficeResult;

	public class BoxOfficeResult {

		@SerializedName("boxofficeType")
		public String boxofficeType;

		@SerializedName("showRange")
		public String showRange;

		@SerializedName("dailyBoxOfficeList")
		public List<DailyBoxOfficeList> dailyBoxOfficeList;

		public class DailyBoxOfficeList {
			@SerializedName("rnum")
			public int rnum;

			@SerializedName("rank")
			public int rank;

			@SerializedName("rankInten")
			public int rankInten;

			@SerializedName("rankOldAndNew")
			public String rankOldAndNew;

			@SerializedName("movieCd")
			public int movieCd;

			@SerializedName("movieNm")
			public String movieNm;

			@SerializedName("openDt")
			public String openDt;

			@SerializedName("salesAmt")
			public double salesAmt;

			@SerializedName("salesShare")
			public double salesShare;

			@SerializedName("salesInten")
			public double salesInten;

			@SerializedName("salesChange")
			public double salesChange;

			@SerializedName("salesAcc")
			public double salesAcc;

			@SerializedName("audiCnt")
			public int audiCnt;

			@SerializedName("audiInten")
			public double audiInten;

			@SerializedName("audiChange")
			public double audiChange;

			@SerializedName("audiAcc")
			public int audiAcc;

			@SerializedName("scrnCnt")
			public int scrnCnt;

			@SerializedName("showCnt")
			public int showCnt;
		}
	}
}
