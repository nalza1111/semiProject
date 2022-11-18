package co.bootjava.palette.account.service;

import java.util.List;

import co.bootjava.palette.account.vo.AccountVO;

public interface AccountService {
	
	int AccountInsert(AccountVO vo); //회원가입
	boolean isAccountIdCheck(String id);	//존재하면 false
	AccountVO accountLogin(String id, String password);//로그인
	String sendMail(String email, String subject, String Mail); //메일보내기
	AccountVO emailFind(String id);
	List<AccountVO> accountList();
	AccountVO AccountSelected(String id);
	List<AccountVO> mainAccountList();
	int updateAccountFollower(AccountVO vo);
	List<AccountVO> accountListM();
	int accountDelete(String id);



	
}
