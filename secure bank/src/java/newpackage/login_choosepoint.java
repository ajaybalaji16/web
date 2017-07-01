/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author system4
 */
public class login_choosepoint extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try{
              Class.forName("com.mysql.jdbc.Driver");
              String url="jdbc:mysql://localhost/bank";
              String user="root";
              String password="root";
               HttpSession hs=request.getSession();
              
              String accountno=(String)hs.getAttribute("accountno");
              
             System.out.println(accountno);
              
              //String name=(String)request.getAttribute("Name");
             // String employee_id=(String)request.getAttribute("employee_id");
              String sql="select * from user where accountno='"+accountno+"'";
              Connection conn=DriverManager.getConnection(url, user, password);
              Statement st=conn.createStatement();
              ResultSet rs=st.executeQuery(sql);
             
              
              OutputStream img;
              while(rs.next())
              {  
//                   String accountno=rs.getString("accountno");
                   out.println("<h1>"+accountno+"</h1>");
              System.out.println(accountno);
                  out.println("<h1>");
                  byte barray[]=rs.getBytes("image");
                         response.setContentType("image/png");
                         img=response.getOutputStream();
                         img.write(barray);
                  byte barray1[]=rs.getBytes("image");
                         response.setContentType("image/png");
                         img=response.getOutputStream();
                         img.write(barray);                          
                          out.println("</h1>");
              }
        
        
              rs.close();
              st.close();
              conn.close();
              //employee_details.invalidate();
          }catch(Exception ex){
                 ex.printStackTrace();
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
