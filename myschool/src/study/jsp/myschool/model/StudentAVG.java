package study.jsp.myschool.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor
@ToString(includeFieldNames = true)
@Getter @Setter
public class StudentAVG {
	private int grade;
	private float avg_height;
	private float avg_weight;


}
