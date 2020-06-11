package adminis.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import adminis.entity.admin.Authority;
import adminis.entity.admin.Log;

@Service
public interface LogService {
	public int add(Log log);
	public int add(String content);
	public List<Log> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
	public int delete(String ids);
}
