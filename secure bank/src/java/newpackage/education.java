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

/**
 *
 * @author system4
 */
public class education extends HttpServlet {

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
            out.println("<title>Servlet education</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet education at " + request.getContextPath() + "</h1>");
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
        String name=request.getParameter("name");
        System.out.println(name);
        String mobileno=request.getParameter("mobileno");
        System.out.println(mobileno);
        String emailid=request.getParameter("email");
        System.out.println(emailid);
        String accountno=request.getParameter("account");
        System.out.println(accountno);
        String address=request.getParameter("address");
        System.out.println(address);
        String placeofstudy=request.getParameter("placeofstudy");
        System.out.println(placeofstudy);
        String from=request.getParameter("from");
        System.out.println(from);
        String to=request.getParameter("to");
        System.out.println(to);
        String loanamount=request.getParameter("loanamount");
        System.out.println(loanamount);
        String admissionsecured=request.getParameter("get");     
        System.out.println(admissionsecured);
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from educationloan where account_no='"+accountno+"'");
                if(rs.next())
                {
                    RequestDispatcher rd=request.getRequestDispatcher("educationalloan.jsp");
                    rd.include(request, response);
                     try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet education</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>You are already applied for educational loan</h1>");
            out.println("</body>");
            out.println("</html>");
        }
                }
                else{
                st.executeUpdate("insert into educationloan values('"+name+"','"+mobileno+"','"+emailid+"','"+accountno+"','"+address+"','"+placeofstudy+"','"+from+"','"+to+"','"+loanamount+"','"+admissionsecured+"','education')");
                st.executeUpdate("insert into loan values('"+name+"','"+accountno+"','education')");
                RequestDispatcher rd=request.getRequestDispatcher("educationalloan.jsp");
                rd.include(request, response);
                try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet education</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Loan applied</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        }
        }
        catch(Exception e)
        {
            
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
