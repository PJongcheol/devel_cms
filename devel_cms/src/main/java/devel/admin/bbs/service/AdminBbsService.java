package devel.admin.bbs.service;

import java.util.List;
import java.util.Map;

/**
 * 게시물 처리를 위한 Service
 * @Class Name   : AdminBbsService
   @Description  :게시물 처리를 위한 Service
 * @author  : PJC
 * @date    : 2026. 2. 6
 * @desc    :
 * @version : 1.0
 * @see
 *
 * 개정이력(Modification Information)
 * 수정일		      수정자	     내용
 * ----------------  --------  -----------------
 *  2026. 2. 6		PJC			최초생성
 **/
public interface AdminBbsService {
	/**
	 * 게시물 목록 카운트
	 * @param Map
	 * @return int
	 * @exception Exception
	 */
	public int selectBbsMstTotalCount(Map<String, Object> param) throws Exception;

	/**
	 * 게시물 목록
	 * @param Map
	 * @return List
	 * @exception Exception
	 */
	public List<Map<String, Object>> selectBbsMstList(Map<String, Object> param) throws Exception;

	/**
	 * 게시물 상세
	 * @param Map
	 * @return Map
	 * @exception Exception
	 */
	public Map<String, Object> selectBbsDetail(Map<String, Object> param) throws Exception;


	/**
	 * 게시물 필드 목록
	 * @param Map
	 * @return List
	 * @exception Exception
	 */
	public List<Map<String, Object>> selectBbsFieldList(Map<String, Object> param) throws Exception;

	/**
	 * 게시물 필드 목록
	 * @param Map, List
	 * @return void
	 * @exception Exception
	 */
	public void saveBbs(Map<String, Object> param, List<Map<String, Object>> list) throws Exception;

	/**
	 * 게시물 삭제
	 * @param Map
	 * @return void
	 * @exception Exception
	 */
	public void deleteBbs(Map<String, Object> param) throws Exception;
}
