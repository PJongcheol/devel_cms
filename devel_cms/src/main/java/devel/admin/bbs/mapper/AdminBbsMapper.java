package devel.admin.bbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminBbsMapper {
	// 게시물 목록 카운트
	public int selectBbsMstTotalCount(Map<String, Object> param);

	// 게시물 목록
	public List<Map<String, Object>> selectBbsMstList(Map<String, Object> param);

	// 게시물 상세
	public Map<String, Object> selectBbsDetail(Map<String, Object> param);

	// 게시물 필드 상세 목록
	public List<Map<String, Object>> selectBbsDtlFieldList(Map<String, Object> param);

	// 게시물 필드 목록
	public List<Map<String, Object>> selectBbsFieldList(Map<String, Object> param);

	// 게시물 일련번호
	public int selectBbsSeq();

	// 게시물 저장
	public void insertBbs(Map<String, Object> param);

	// 게시물 필드 일련번호
	public int selectBbsFieldSeq(Map<String, Object> param);

	// 게시물 필드 목록 저장
	public void insertBbsField(Map<String, Object> param);

	// 게시물 수정
	public void updateBbs(Map<String, Object> param);

	// 게시물 필드 수정
	public void updateBbsField(Map<String, Object> param);

	// 게시물 삭제
	public void deleteBbs(Map<String, Object> param);

	// 게시물 필드 삭제
	public void deleteBbsField(Map<String, Object> param);
}
