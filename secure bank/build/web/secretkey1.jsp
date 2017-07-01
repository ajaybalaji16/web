<%-- 
    Document   : secretkey1
    Created on : Mar 21, 2017, 4:54:50 PM
    Author     : Goa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s1 = request.getParameter("s");
           String key  = (String) session.getAttribute("key");
            if(s1.equals(key))
            {
               
                 //out.println("valid OTP");
                //response.sendRedirect("transaction");
                out.println("<form action='transaction'>");
                out.println("<input type='submit' name='click' value='Click To Transfer'/>");
                out.println("</form>");
            }
else
            {
                out.println("Invalid OTP");
            }
            %>
    </body>
</html>
