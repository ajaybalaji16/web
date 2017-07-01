package Mai;



import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
public class Mail {
public void sendMail(String key,String tomail) 
{
   
    
		Properties props=new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port","465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session=Session.getInstance(props, new javax.mail.Authenticator()
		{
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication("mailfromcloud844@gmail.com", "mailfromcloud844");
			}
		});
                //session=Session.getInstance(props,this);
		try
                {
			// multiple senders
			//String to[]={"dharani081990@gmail.com","dharani@uniqtechnologies.co.in"};
		
                    /*InternetAddress[] addressTo=new InternetAddress[to.length];
			for(int i=0;i<to.length;i++)
			{
				addressTo[i]=new InternetAddress(to[i]);
			}*/
			MimeMessage msg=new MimeMessage(session);
			msg.setFrom(new InternetAddress("mailfromcloud844@gmail.com"));
			msg.addRecipients(Message.RecipientType.TO, tomail);

			msg.setSubject("Alert");
                       // String pass=password;
			msg.setText(key);

			Transport.send(msg);
			System.out.println("Mail sent successfully");

		}
		catch(Exception e)
		{
                     System.out.println(e);
                     e.printStackTrace();
		}
	}


}
