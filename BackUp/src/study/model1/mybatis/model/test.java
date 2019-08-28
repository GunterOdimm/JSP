package study.model1.mybatis.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor @AllArgsConstructor
@ToString(includeFieldNames = true)
@Getter @Setter

public class test {
	private int id;              
	private String search_date;     
	private int rank;
	private int rank_inten;      
	private String rank_old_and_new;
	private String movie_cd;        
	private String movie_nm;        
	private String open_dt;         
	private double sales_amt;       
	private float sales_share;     
	private double sales_inten;     
	private float sales_change;
	private double sales_acc;       
	private int audi_cnt;        
	private double audi_inten;      
	private float audi_change;
	private int audi_acc;        
	private int scrn_cnt;        
	private int show_cnt;        
	private String reg_date;        
	private String edit_date;       
}
