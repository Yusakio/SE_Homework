package adminis.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import adminis.entity.admin.Menu;

@Repository
public interface MenuDao {
	public List<Menu> findList(Map<String, Object> queryMap);
	public List<Menu> findTopList();
	public int getTotal(Map<String, Object> queryMap);
	public List<Menu> findChildernList(Long parentId);
	public List<Menu> findListByIds(String ids);
}
