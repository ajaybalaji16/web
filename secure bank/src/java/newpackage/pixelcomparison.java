/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author system29
 */
public class pixelcomparison extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet pixelcomparison</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet pixelcomparison at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException 
//    {
//     
//               
//    }
//    
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
     try {
          String x=request.getParameter("imag.x");
          System.out.println(x);
          int xpoint=Integer.parseInt(x);
          System.out.println(xpoint);
          String y=request.getParameter("imag.y");
          int ypoint=Integer.parseInt(y);
         System.out.println(ypoint);
         HttpSession hs=request.getSession();
         String accountno=(String)hs.getAttribute("accountno");
         System.out.println("user accountno"+accountno);
         String taccountno=(String)hs.getAttribute("viewaccount"); 
         String amountt=(String)hs.getAttribute("amount");
         System.out.println("amount"+amountt);
         System.out.println("transaction accountno"+taccountno);
//     String balanceoftoaccoun=(String)hs.getAttribute("balanceoftoaccoun");
         System.out.println(accountno);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from imagepoint where accountno='"+accountno+"'");
                if(rs.next()){
                    String orgx=rs.getString(2);
                    int x1=Integer.parseInt(orgx);
                    System.out.println(orgx);
                    String orgy=rs.getString(3);
                    int y1=Integer.parseInt(orgy);
                    if(xpoint<x1 && ypoint<y1) 
                    {
                        int diff=x1-xpoint;
                        int diffy=y1-ypoint;
                        if(diff<=5 && diffy<=5)
                        {
                            
                            ResultSet rss=st.executeQuery("select * from user where accountno='"+accountno+"'");
                            if(rss.next()){
                            String frombalanc=rss.getString("balance");
                            System.out.println("From balance "+frombalanc);
                            int frombalance=Integer.parseInt(frombalanc);                            
                            int amount=Integer.parseInt(amountt);
                            int newbalance=frombalance-amount;
                            System.out.println("updated balance"+newbalance);
                            st.executeUpdate("update user set balance='"+newbalance+"' where accountno='"+accountno+"'");
                            System.out.println("Next po");
                            ResultSet rs1=st.executeQuery("select * from user where accountno='"+taccountno+"'");
                            if(rs1.next())
                            {         System.out.println("poitiya");
                                String balanceoftoaccoun=rs1.getString("balance");
                                System.out.println(balanceoftoaccoun);
                                int balanceoftoaccount=Integer.parseInt(balanceoftoaccoun);
                                System.out.println(balanceoftoaccount);
                                int balance=balanceoftoaccount+amount;                  
//                               st.executeUpdate("insert into transaction values('"+accountno+"','"+taccountno+"','"+balance+"')");
                               st.executeUpdate("update user set balance='"+balance+"' where accountno='"+taccountno+"'");
                            RequestDispatcher rd=request.getRequestDispatcher("transactionok.jsp");
                            rd.forward(request, response);
                        }
                            }
                        }
                        else
                        {
                            RequestDispatcher rd1=request.getRequestDispatcher("home.jsp");
                            rd1.forward(request, response);
                        }
                            
                    }
                    
                    else
                    {
                        int diff=xpoint-x1;
                        int diffy=ypoint-y1;
                         if(diff<=5 && diffy<=5)
                        {
                            
                            ResultSet rss=st.executeQuery("select * from user where accountno='"+accountno+"'");
                            if(rss.next()){
                            String frombalanc=rss.getString("balance");
                                System.out.println("From balance "+frombalanc);
                            int frombalance=Integer.parseInt(frombalanc);
//                            String amountt=(String)hs.getAttribute("amount");
                            int amount=Integer.parseInt(amountt);
                            int newbalance=frombalance-amount;
                            System.out.println(newbalance);
                            st.executeUpdate("update user set balance='"+newbalance+"' where accountno='"+accountno+"'");
                                System.out.println("Next 1");
                            ResultSet rs1=st.executeQuery("select * from user where accountno='"+taccountno+"'");
                            if(rs1.next())
                            {         
                                System.out.println("chup");
                                String balanceoftoaccoun=rs1.getString("balance");
                                System.out.println(balanceoftoaccoun);
                                int balanceoftoaccount=Integer.parseInt(balanceoftoaccoun);
                                System.out.println(balanceoftoaccount);
                                int balance =balanceoftoaccount+amount;                  
//                               st.executeUpdate("insert into transaction values('"+accountno+"','"+taccountno+"','"+balance+"')");
                               st.executeUpdate("update user set balance='"+balance+"' where accountno='"+taccountno+"'");
                               RequestDispatcher rd=request.getRequestDispatcher("transactionok.jsp");
                                rd.forward(request, response);
                            
                        }
                        }
                        }
                        
                        else
                        {
                            RequestDispatcher rdd=request.getRequestDispatcher("home.jsp");
                            rdd.forward(request, response);
                        }
                    }
                
                
                }
                else
                {
                    RequestDispatcher rd=request.getRequestDispatcher("index.html");
                            rd.forward(request, response);
                }
     }
     
     catch(Exception e)
     {
         System.out.println(e);
     }
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
