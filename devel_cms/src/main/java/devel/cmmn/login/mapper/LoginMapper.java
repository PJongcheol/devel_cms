package devel.cmmn.login.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import devel.cmmn.login.vo.LoginVO;

@Mapper
public interface LoginMapper {
	// 비밀번호실패 카운트 조회
	public String selectLoginFailCnt(Map<String, Object> param);

	// 아이디 승인 체크
	public String selectConfmYn(Map<String, Object> param);

	// 로그인 처리
	public LoginVO actionLogin(Map<String, Object> param);

	// 로그인 이력 저장
	public void insertLoginHis(Map<String, Object> param);

	// 로그인 실패 카운트 수정
	public void updateUserFailCnt(Map<String, Object> param);

	// 아이디 중복체크
	public int checkId(Map<String, Object> param);

	// 회원 등록
	public void insertSignUp(Map<String, Object> param);
}
