package devel.cmmn.login.service;

import java.util.Map;

import devel.cmmn.login.vo.LoginVO;

/**
*
* @Class Name   : LoginService
  @Description  : 로그인 처리를 위한 서비스

* @author  : PJC
* @date    : 2026. 1. 5
* @desc    :
* @version : 1.0
* @see
*
* 개정이력(Modification Information)
* 수정일		      수정자	     내용
* ----------------  --------  -----------------
*  2026. 1. 5.	 	PJC	      최초작성
*/

public interface LoginService {
	/**
	 * 비밀번호실패 카운트 조회
	 * @param Map
	 * @return String
	 * @exception Exception
	 */
	public String selectLoginFailCnt(Map<String, Object> param) throws Exception;

	/**
	 * 아이디 승인 체크
	 * @param Map
	 * @return String
	 * @exception Exception
	 */
	public String selectConfmYn(Map<String, Object> param) throws Exception;

	/**
	 * 로그인 처리
	 * @param Map
	 * @return String
	 * @exception Exception
	 */
	public LoginVO actionLogin(Map<String, Object> param) throws Exception;

	/**
	 * 아이디 중복체크
	 * @param Map
	 * @return int
	 * @exception Exception
	 */
	public int checkId(Map<String, Object> param) throws Exception;

	/**
	 * 회원 등록
	 * @param Map
	 * @return void
	 * @exception Exception
	 */
	public void insertSignUp(Map<String, Object> param) throws Exception;
}
