package adminis.controller.admin;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Template {
	private String name;
	private String idCard;
	private String arriveDate;
	private String leaveDate;
	private Float price;
	private long month;
	private int day;
	private String createTime;
}
