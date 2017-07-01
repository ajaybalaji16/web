/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import Mai.Mail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Goa
 */
public class random extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try
        {
            /* TODO output your page here. You may use following sample code. */
         /*   out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet random</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet random at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        Random rd=new Random();
            int rd1=rd.nextInt(8);
            int rd2=rd.nextInt(8);
            int rd3=rd.nextInt(8);
            int rd4=rd.nextInt(8);
             String rendom_key=""+rd1+rd2+rd3+rd4;
             rendom_key=rendom_key.trim();
             String amt= request.getParameter("amount");
             HttpSession session = request.getSession();
             session.setAttribute("amount",amt);
             String s = (String)session.getAttribute("email1");
             String mob=session.getAttribute("mob").toString();
             session.setAttribute("key",rendom_key);
          // out.println(s);
          CallSmscApi cms=new CallSmscApi();
          cms.sendsms(rendom_key, mob);
          
//           Mail m =  new Mail();
//           
//          m.sendMail(rendom_key,s);
            response.sendRedirect("secretkey.jsp");
        }catch(Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
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
            throws ServletException, IOException {
        processRequest(request, response);
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
