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
public class beneficiary extends HttpServlet {

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
    String name=request.getParameter("name");
     String accountno=request.getParameter("accountno");
        System.out.println(accountno);
     String email=request.getParameter("email");
     String bankname=request.getParameter("bankname");
     String branchname=request.getParameter("branchname");
     String sts="disable";
     HttpSession hs=request.getSession();
            String userid=(String)hs.getAttribute("accountno");
              try
                 {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from user where accountno='"+accountno+"'");
                if(rs.next())
                {
                    String useraccountno=rs.getString(10);
                    System.out.println(useraccountno);
                    if(userid.equalsIgnoreCase(accountno))
                    {
                    System.out.println(accountno);
                        RequestDispatcher rd=request.getRequestDispatcher("beneficiary.jsp");
                        rd.forward(request, response);
                    }
                    else{
                st.executeUpdate("insert into beneficiary values('"+name+"','"+accountno+"','"+email+"','"+bankname+"','"+branchname+"','"+sts+"','"+userid+"')");
                RequestDispatcher rd=request.getRequestDispatcher("beneficiary.jsp");
                rd.forward(request, response);
                    }
                }
                else
                {
                    RequestDispatcher rd=request.getRequestDispatcher("transactionacc.jsp");
                rd.forward(request, response);
                
                }
                st.close();
                rs.close();
                }
        catch(Exception e)
        {
            System.out.println(e);
        }    
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
