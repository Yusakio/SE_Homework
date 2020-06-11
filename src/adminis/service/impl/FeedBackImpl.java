package adminis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import adminis.dao.FeedBackDao;
import adminis.entity.FeedBack;
import adminis.service.FeedBackService;

@Service
public class FeedBackImpl implements FeedBackService {
	
	@Autowired
	private FeedBackDao feedback;

	@Override
	public int add(FeedBack feedBack) {
		// TODO Auto-generated method stub
		return feedback.add(feedBack);
	}

	@Override
	public int edit(FeedBack feedBack) {
		// TODO Auto-generated method stub
		return feedback.edit(feedBack);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return feedback.delete(id);
	}

	@Override
	public List<FeedBack> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return feedback.findList(queryMap);
	}

	@Override
	public List<FeedBack> findAll() {
		// TODO Auto-generated method stub
		return feedback.findAll();
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return feedback.getTotal(queryMap);
	}

	@Override
	public FeedBack find(Long id) {
		// TODO Auto-generated method stub
		return feedback.find(id);
	}

}
