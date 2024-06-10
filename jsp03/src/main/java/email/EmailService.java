package email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {
	public void mailSender(EmailDTO dto) throws Exception {
		String host = "smtp.gmail.com";
		// gmail id, @gmail.com은 입력하지 않음
		String username = "miihyun95";
		String password = "xojr fgyp yklv lvbc";
		int port = 587;

		String senderMail = dto.getSenderMail();
		String senderName = dto.getSenderName();
		String recipient = dto.getReceiveMail();
		String subject = dto.getSubject();
		String body = dto.getMessage();

		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		// 디버그 활성화 옵션
		session.setDebug(true);
		// 이메일 객체
		Message miMessage = new MimeMessage(session);
		// 발신자 주소
		miMessage.addFrom(new InternetAddress[] { new InternetAddress(senderMail, senderName) });
		// 수신자 주소
		miMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		miMessage.setSubject(subject);
		miMessage.setText(body);
		Transport.send(miMessage);
	}
}
