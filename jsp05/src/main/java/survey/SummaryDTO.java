package survey;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SummaryDTO {
	private int survey_idx; // 문제번호
	private int num; // 응답번호
	private int sum_num; // 응답횟수
	private double rate; // 응답률
}
