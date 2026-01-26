package devel.admin.menu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMenuMapper {
	// 메뉴 리스트 조회
	public List<Map<String, Object>> getMenuList(Map<String, Object> param);
}
