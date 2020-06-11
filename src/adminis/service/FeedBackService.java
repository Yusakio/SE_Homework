package adminis.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import adminis.entity.FeedBack;

@Service
public interface FeedBackService {
	public int add(FeedBack feedBack);
	public int edit(FeedBack feedBack);
	public int delete(Long id);
	public List<FeedBack> findList(Map<String, Object> queryMap);
	public List<FeedBack> findAll();
	public Integer getTotal(Map<String, Object> queryMap);
	public FeedBack find(Long id);
}
