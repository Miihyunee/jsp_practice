package book;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BookDTO {
	private int idx;
	private String title;
	private String author;
	private int price;
	private int amount;

	public BookDTO(String title, String author, int price, int amount) {
		this.title = title;
		this.author = author;
		this.price = price;
		this.amount = amount;
	}
}
