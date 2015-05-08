<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="send.mail.checkIDPASS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("UTF-8");

String sender = "dleown2420@naver.com";
String receiver = request.getParameter("receiver");
String subject = "<대학커뮤니티에서 알립니다.>";
String id = request.getParameter("id");
String content = "고객님의 id는" + id + "입니다.";


Properties p = new Properties();
p.put("mail.smtp.user", "tootry3217");

p.put("mail.smtp.host", "smtp.naver.com");
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");

try {
    Authenticator auth = new checkIDPASS();
    Session ses = Session.getInstance(p, auth);
    ses.setDebug(true);

    MimeMessage msg = new MimeMessage(ses);
    msg.setSubject(subject);

    Address fromAddr = new InternetAddress(sender);
    msg.setFrom(fromAddr);

    Address toAddr = new InternetAddress(receiver);
    msg.addRecipient(Message.RecipientType.TO, toAddr);

    msg.setContent(content, "text/html;charset=UTF-8");

    Transport.send(msg);
        
} catch (Exception mex) {
    mex.printStackTrace();
    String script = "<script type='text/javascript'>\n";
    script += "alert('메일발송에 실패했습니다.');\n";
    script += "history.back();\n";
    script += "</script>";
    out.print(script);
    return;
}
    
String script = "<script type='text/javascript'>\n";
script += "alert('메일발송에 성공했습니다.');\n";
script += "</script>";
script += "<meta http-equiv='refresh' content='0; url=../combinePage/homeMainPage.jsp' />";
out.print(script);
%>
<body>
</body>
</html>