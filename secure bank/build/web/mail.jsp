<%-- 
    Document   : mail
    Created on : Mar 21, 2017, 2:32:38 PM
    Author     : Goa
--%>

<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            
		Properties props=new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port","465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session1=Session.getDefaultInstance(props, new Authenticator()
		{
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication("mailfromcloud844@gmail.com", "mailfromcloud844");
			}
		});
		try
                {
			// multiple senders
			//String to[]={"dharani081990@gmail.com","dharani@uniqtechnologies.co.in"};
		
                    /*InternetAddress[] addressTo=new InternetAddress[to.length];
			for(int i=0;i<to.length;i++)
			
				addressTo[i]=new InternetAddress(to[i]);
			}*/
                   //  HttpSession session = request.getSession();
             String tomail = (String)session.getAttribute("email1");
              //HttpSession session = request.getSession();
             String key = (String)session.getAttribute("key");
			MimeMessage msg=new MimeMessage(session1);
			msg.setFrom(new InternetAddress("mailfromcloud844@gmail.com"));
			msg.addRecipients(Message.RecipientType.TO, tomail);

			msg.setSubject("Alert");
                       // String pass=password;
			msg.setText(key);

			Transport.send(msg);
			System.out.println("Mail sent successfully");
                        response.sendRedirect("transcation");

		}
		catch(Exception e)
		{

		}

            %>
            
    </body>
</html>
