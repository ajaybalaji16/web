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
import java.sql.Statement;
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
public class fixeddeposit extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet fixeddeposit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet fixeddeposit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
           String name = request.getParameter("name");         
           String phone=request.getParameter("phone");        
            String pancard = request.getParameter("pan");
            String addr=request.getParameter("address");           
            String nominee=request.getParameter("nominee");            
            String amount=request.getParameter("amount");
            String year=request.getParameter("select");
            HttpSession hs=request.getSession();
            String accountno=(String)hs.getAttribute("accountno");
              try
                 {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                double A,P,r,n,t,I;
        double temp;
        P=Double.parseDouble(amount);
        r = 0.05;
        t=Double.parseDouble(year);
        n=4;
        temp=(1+r/n);
        A=P*Math.pow(temp,(n*t));
        System.out.println("Fixed deposit: "+ Math.round(A));
        I=A-P;
        System.out.println("Interest Earned Amount: "+ Math.round(I));
                st.executeUpdate("insert into fixeddeposit values('"+name+"','"+accountno+"','"+phone+"','"+pancard+"','"+addr+"','"+nominee+"','"+A+"','"+I+"')");
                hs.setAttribute("amount", amount);
                RequestDispatcher rd=request.getRequestDispatcher("fixeddepositok.jsp");
                rd.forward(request, response);
                
                
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
