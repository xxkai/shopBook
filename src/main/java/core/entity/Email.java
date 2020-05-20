package core.entity;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Email {
    //进行邮箱登录
	public static void sendMailForResetPwd(String email, String code) {	     
        String from = "1460009038@qq.com";// 发件人电子邮箱
        // 看你使用谁家的邮箱发生邮件，就填写谁家的
        // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
        String host = "smtp.qq.com"; 
        Properties properties = System.getProperties();// 获取系统属性

        properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证

        try {
            //QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);


            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                // 发件人邮箱账号、授权码，就是之前配置的账号密码
                    return new PasswordAuthentication("1460009038@qq.com", "uromycggdlfoiefj"); 
                }
            });

            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(from));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("重置密码");
            // 2.4设置邮件内容，根据你自己的情况写
            String content = "<html><head></head><body><h1>【小凯图书商城】</h1><h3>您正在使用修改密码功能，重置密码为 "+code+" 。如果不是本人操作，请忽略该邮件。 [请勿回复]</h3></body></html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
