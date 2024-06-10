package guestbook;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GuestbookDTO {
	private int idx;
	private String name;
	private String email;
	private String passwd;
	private String contents;
	private String post_date;
}
