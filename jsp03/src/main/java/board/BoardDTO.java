package board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int num;
	private String writer;
	private String subject;
	private String passwd;
	private String reg_date;
	private int hit;
	private int group_num;
	private int re_order;
	private int re_depth;
	private String contents;
	private String ip;
	private int count_comments;
	private String filename;
	private int filesize;
	private int down;
}
