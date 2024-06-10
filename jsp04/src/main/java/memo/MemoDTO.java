package memo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "memo")
@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemoDTO {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idx")
	private int idx;

	@Column(name = "writer")
	private String writer;

	@Column(name = "memo")
	private String memo;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "post_date")
	private Date post_date;

	public MemoDTO(String writer, String memo) {
		this.writer = writer;
		this.memo = memo;
	}
}
