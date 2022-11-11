package UtilityClass;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Mail {
    public static void sendMail(String destinatario, String contenuto) throws Exception {

        String myEmail = "gabettinocera.send@hotmail.com";
        String password = "Gabettimail2022";

        Properties props = System.getProperties();
        String host = "smtp-mail.outlook.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", myEmail);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "true");


        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmail, password);
            }
        });

        Message message = prepareMessage(session, myEmail, destinatario, contenuto);
        Transport.send(message);
        System.out.println("message sent");
    }

    private static Message prepareMessage(Session session, String myEmail, String destinatario, String contenuto) throws AddressException, MessagingException {

        Message msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(myEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            msg.setSubject("Messaggio da Gabetti");
            msg.setText(contenuto);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return msg;

    }
}
