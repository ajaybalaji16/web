<%-- 
    Document   : ii
    Created on : Jan 6, 2017, 1:57:28 PM
    Author     : system29
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
                    HttpSession hs=request.getSession();
                    String accountno=(String)hs.getAttribute("accountno");
                    String viewaccount=(String)hs.getAttribute("viewaccount");
                    System.out.println(viewaccount);
                    System.out.println(accountno);
                    String view =request.getParameter("q");
                    System.out.println(view);
                    
                    try{
                         Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from beneficiary where accountno='"+viewaccount+"' and userid='"+accountno+"'");
                        if(rs.next())
                        {
                            String name=rs.getString("name");
//                            String accountno1=rs.getString("accountno");
                            String email=rs.getString("email");
                            String bankname=rs.getString("bankname");
                            String branchname=rs.getString("branchname");
                            hs.setAttribute("name", name);
                            hs.setAttribute("email", email);
                            hs.setAttribute("bankname", bankname);
                            hs.setAttribute("branchname", branchname);
                %>
                            <center>
                                <table width="500">                      
<!--                                     <tr>
                                         <td><p class="italic">Bank Name:</p> </td>
                                      <td></td>
                                     </tr>
                            <tr> <td>&nbsp;</td> </tr>-->
                        
                            <tr>
                                <td><p class="italic">Name: </p></td>
                                <td><%=rs.getString("name")%></td>
                            </tr>
                            <tr> <td>&nbsp;</td> </tr>
                            <tr>
                                <td><p class="italic">Account No: </p></td>
                                <td><%=rs.getString("accountno")%></td>
                            </tr>
                            <tr> <td>&nbsp;</td> </tr>
                             <tr>
                                         <td><p class="italic">Email-id:</p> </td>
                                      <td><%=rs.getString("email")%></td>
                                     </tr>
                                                        <tr> <td>&nbsp;</td> </tr>
                                                         <tr>
                                <td><p class="italic">Bank Name: </p></td>
                                <td><%=rs.getString("bankname")%></td>
                            </tr>
                            <tr> <td>&nbsp;</td> </tr>
                             <tr>
                                <td><p class="italic">Branch Name: </p></td>
                                <td><%=rs.getString("branchname")%></td>
                            </tr>
                            <tr> <td>&nbsp;</td> </tr>
                                
             
                        <%
                        }
                        %>  
                        <tr><td><h3>Amount</h3></td><td><input type="text" name="amount" pattern="[0-9]+" required="" /></td></tr></table>
                        <center> <input type="submit" value="Click To Transfer" name="click" style="background-color: #008dde;height:40px; width:120px;color: white"></input>
                            </table>
                        </center>
                          
                            <!--                        <h3> Transaction To: </h3>-->
                    <%
                    st.close();
                    rs.close();
                    
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }%>
    
                            </body>
</html>
