package co.bootjava.palette.account.service.impl;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;

import co.bootjava.palette.account.mapper.AccountMapper;
import co.bootjava.palette.account.service.AccountService;
import co.bootjava.palette.account.vo.AccountVO;
import co.bootjava.palette.common.DataSource;

public class AccountServiceImpl implements AccountService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); // 오토 커밋
	private AccountMapper map = sqlSession.getMapper(AccountMapper.class); // 데이터베이스 연결후 커넥션 호출

	// 아이디 중복확인
	@Override
	public boolean isAccountIdCheck(String id) {
		return map.isAccountIdCheck(id);
	}

	// 회원가입 정보 insert
	@Override
	public int AccountInsert(AccountVO vo) {
		return map.accountInsert(vo);
	}

	// 로그인
	@Override
	public AccountVO accountLogin(String id, String password) {
		return map.accountLogin(id, password);
	}
	
	//이메일값 찾기
	@Override
	public AccountVO emailFind(String id) {
		return map.emailFind(id);
	}

	// 이메일 전송 메소드
	@Override
	public String sendMail(String toId, String subject, String content) {
		String _email = "tpgns5890@gmail.com";
		String _password = "lwklkuyfbjoqnqgc";

		String title = subject;
		String fromMail = "tpgns5890@gmail.com";// "cholee@yedam.ac";
		String fromName = "Palette 운영진";
		String toMail = toId;// "leadon@naver.com"; // 콤마(,) 나열 가능

		// mail properties
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // use Gmail
		props.put("mail.smtp.port", "587"); // set port

		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true"); // use TLS
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() { // set authenticator
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(_email, _password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(mailSession);

			message.setFrom(new InternetAddress(fromMail, MimeUtility.encodeText(fromName, "UTF-8", "B"))); // 한글의 경우
																											// encoding
																											// 필요
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toMail));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8"); // 내용 설정 (HTML 형식)
			message.setSentDate(new java.util.Date());

			Transport t = mailSession.getTransport("smtp");
			t.connect(_email, _password);
			t.sendMessage(message, message.getAllRecipients());
			t.close();

			return "Success";
		} catch (javax.mail.internet.AddressException ae) {
			ae.printStackTrace();
			return "Fail";
		} catch (javax.mail.MessagingException me) {
			me.printStackTrace();
			return "Fail";
		} catch (java.io.UnsupportedEncodingException ue) {
			ue.printStackTrace();
			return "Fail";
		}  catch (NullPointerException e1) {
			System.out.println("존재하지 않는 회원 아이디입니다.");
			return "Fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "Fail";
		}
	}

	//계정 리스트
	@Override
	public List<AccountVO> accountList() {
		return map.accountList();
	}
	//계정 선택
	@Override
	public AccountVO AccountSelected(String id) {
		return map.accountSelected(id);
	}
	//계정 메인출력
	@Override
	public List<AccountVO> mainAccountList() {
		return map.mainAccountList();
	}
	//팔로워 증가
	@Override
	public int updateAccountFollower(AccountVO vo) {
		return map.updateAccountFollower(vo);
	}
	//관리자 페이지 계정출력
	@Override
	public List<AccountVO> accountListM() {
		return map.accountListM();
	}

	@Override
	public int accountDelete(String id) {

		return map.accountDelete(id);
	}

	

}
