package send.mail;

import javax.mail.PasswordAuthentication;

public class checkIDPASS extends javax.mail.Authenticator{

	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("dleown2420", "29233641ef");
	}

}
