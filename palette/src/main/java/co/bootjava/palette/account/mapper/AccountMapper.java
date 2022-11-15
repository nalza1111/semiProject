package co.bootjava.palette.account.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.bootjava.palette.account.vo.AccountVO;

public interface AccountMapper {
	
	int accountInsert(AccountVO vo); //회원가입
	boolean isAccountIdCheck(String id);	//존재하면 false
	AccountVO accountLogin(@Param("id") String id, @Param("password") String password); //로그인
	AccountVO emailFind(@Param("id") String id); //등록된이메일 찾기
	List<AccountVO> accountList();
	AccountVO accountSelected(String id);
	List<AccountVO> mainAccountList();

	
}
