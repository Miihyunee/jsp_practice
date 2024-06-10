package survey;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnswerDTO {
	private int answer_dx; // 일련번호
	private int survey_idx; // 설문문제 번호
	private int num; // 응답번호(1,2,3,4)
}
