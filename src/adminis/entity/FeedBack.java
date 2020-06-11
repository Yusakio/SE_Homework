package adminis.entity;


import org.springframework.stereotype.Component;

@Component
public class FeedBack {
	private Long id;//反馈id
	private String text;//反馈内容
	private String photo;//图片
	private String createTime;//创建时间
	private String handleTime;//回复时间
	private int feedType;//反馈类型
	private int status;//状态
	private Long createId;//创建者id
	private String feedback;//反馈回复
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreatTime(String createTime) {
		this.createTime = createTime;
	}
	public String getHandleTime() {
		return handleTime;
	}
	public void setHandleTime(String handleTime) {
		this.handleTime = handleTime;
	}
	public int getFeedType() {
		return feedType;
	}
	public void setFeedType(int feedType) {
		this.feedType = feedType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Long getCreateId() {
		return createId;
	}
	public void setCreateId(Long createId) {
		this.createId = createId;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
}
