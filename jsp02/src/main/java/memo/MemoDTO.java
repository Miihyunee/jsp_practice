package memo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemoDTO {
	private int idx;
	private String writer;
	private String memo;
	private Date post_date;
	private String ip;


}
