package devel.admin.menu.service;

import java.util.List;
import java.util.Map;

/**
*
* @Class Name   : AdminMenuService
  @Description  : 메뉴관리 처리를 위한 서비스

* @author  : PJC
* @date    : 2026. 1. 19
* @desc    :
* @version : 1.0
* @see
*
* 개정이력(Modification Information)
* 수정일		      수정자	     내용
* ----------------  --------  -----------------
*  2026. 1. 19.	 	PJC	      최초작성
*/

public interface AdminMenuService {
	/**
	 * 메뉴 리스트 조회
	 * @param Map
	 * @return List
	 * @exception Exception
	 */
	public List<Map<String, Object>> getMenuList(Map<String, Object> param) throws Exception;
}
