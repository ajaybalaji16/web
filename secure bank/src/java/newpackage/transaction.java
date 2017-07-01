/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author system4
 */
public class transaction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             HttpSession hs=request.getSession();
             String amountt = (String)hs.getAttribute("amount");
        String accountno=(String)hs.getAttribute("accountno");
        HttpSession hs1=request.getSession();
        String taccountno=(String)hs1.getAttribute("viewaccount");  
        System.out.println(taccountno);
        String button=request.getParameter("click");
        System.out.println(button);
     
           
                hs.setAttribute("taccountno", taccountno);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                Statement st1=con.createStatement();
                Statement st3=con.createStatement();
                System.out.println(button);
                if(button.equalsIgnoreCase("Click To Transfer")){                    
                        // String amountt=request.getParameter("amount");
                        // System.out.println("Amount "+amountt);
                         int amount;
                 amount = Integer.parseInt(amountt);
                         System.out.println(amountt);
                        //hs.setAttribute("amount", amountt);
                ResultSet rs1=st.executeQuery("select balance from user where accountno='"+accountno+"'");                 
                 while(rs1.next()){
                     System.out.println("Selected "+accountno);
                  String frombalanc=rs1.getString("balance");
//                  hs.setAttribute("frombalance", frombalanc);
                  int frombalance=Integer.parseInt(frombalanc);
                  
                  
                  if((frombalance>=amount) && (amount>=500)){
//                      hs.setAttribute("frombalance", frombalanc);
                      
                  RequestDispatcher rd=request.getRequestDispatcher("featurepoint.jsp");
                      rd.forward(request, response);
                  
                  }
                  else
                  {
                      RequestDispatcher rd=request.getRequestDispatcher("transactioninsuff.jsp");
                      rd.forward(request, response);
//                       try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet transaction</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1><center>You have insufficient balance</center> </h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
                  }
//                  ResultSet rs=st.executeQuery("select balance from user where accountno='"+taccountno+"'");
//                 if(rs.next())
//                 {
//                 String balanceoftoaccoun=rs.getString("balance");
//                 hs.setAttribute("balanceoftoaccoun", balanceoftoaccoun);
//                 int balanceoftoaccount=Integer.parseInt(balanceoftoaccoun);
//                 int balance =balanceoftoaccount+amount;                  
//                 st.executeUpdate("insert into transaction values('"+accountno+"','"+taccountno+"','"+balance+"')");
//                 st.executeUpdate("update user set balance='"+balance+"' where accountno='"+taccountno+"'");
////                 HttpSession hs=request.gHttpSessionetSession();
//                hs.setAttribute("amount", amountt);
//                 RequestDispatcher rd=request.getRequestDispatcher("transactionok.jsp");
//                 rd.forward(request, response);          
//                 
//                 }
//                 
//                 else
//                 {
//                     RequestDispatcher rd=request.getRequestDispatcher("transactionacc.jsp");
//                     rd.forward(request, response);
//                 }
                 }
                }
                else if(button.equalsIgnoreCase("Save"))
                {
                    System.out.println("xxxxxxxx");
                           String baccountno=request.getParameter("baccountno");
                           System.out.println(baccountno);
                         String bankname=request.getParameter("bankname");
//                         String name=(String)hs.getAttribute("name");
                         String name=request.getParameter("name");
                         String branchname=request.getParameter("branchname");
//                         String email=(String)hs.getAttribute("email");
                         String email=request.getParameter("email");
                         ResultSet rs1=st1.executeQuery("select * from beneficiary where accountno='"+taccountno+"' and userid='"+accountno+"'");
                          System.out.println(button);
                        
                         if(rs1.next())
                         {
                             System.out.println("ohhhhhhhhhhhhh");
                             st.executeUpdate("update beneficiary set bankname='"+bankname+"',name='"+name+"',branchname='"+branchname+"',email='"+email+"',accountno='"+baccountno+"' where userid='"+accountno+"'");
                             String a=rs1.getString(1);
                             System.out.println(a);
                             System.out.println("dkshfksdh");
                             RequestDispatcher rd=request.getRequestDispatcher("beneficiary.jsp");
                             rd.forward(request, response);
                         }
                }
                else
                {
                    System.out.println("varala");
                    st3.executeUpdate("delete from beneficiary where accountno='"+taccountno+"'and userid='"+accountno+"'");
                    System.out.println(taccountno);
                    System.out.println(accountno);                    
                   RequestDispatcher rd=request.getRequestDispatcher("beneficiary.jsp");
                             rd.forward(request, response);
                    
                }
        }

        catch(Exception e)
        {
            System.out.println(e);
        }
     
           
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       processRequest(request,response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
