package devel.admin.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMainMapper {
	// 팝업 목록 조회
	public List<Map<String, Object>> selectPopupList();

	// 팝업 조회
	public Map<String, Object> selectPopup(Map<String, Object> param);

}
