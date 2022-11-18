package co.bootjava.palette.account.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.bootjava.palette.account.vo.AccountVO;

public interface AccountMapper {
	
	int accountInsert(AccountVO vo); //회원가입
	boolean isAccountIdCheck(String id);	//존재하면 false
	AccountVO accountLogin(@Param("id") String id, @Param("password") String password); //로그인
	AccountVO emailFind(@Param("id") String id); //등록된이메일 찾기
	List<AccountVO> accountList(); //계정출력	
	AccountVO accountSelected(String id); // 선택된 계정 정보 출력
	List<AccountVO> mainAccountList(); //메인화면 작가 리스트
	int updateAccountFollower(AccountVO vo);	//팔로워 추가	
	List<AccountVO> accountListM(); //관리자 페이지 계정 출력
	int accountDelete(String id);

	
}
