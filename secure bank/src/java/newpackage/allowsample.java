/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author system4
 */
@MultipartConfig(maxFileSize = 16177215)
public class allowsample extends HttpServlet {

//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet allow</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet allow at " + request.getContextPath() + "</h1>");
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
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

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
     try
     {
         Part profile = request.getPart("photo");
         InputStream photo = null;
         photo = profile.getInputStream();
         HttpSession hs=request.getSession();
         String accountno=(String)hs.getAttribute("accountno");
         System.out.println(accountno);
         String delete="delete from registration where accountno='"+accountno+"'";         
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank", "root", "root");
         Statement st=con.createStatement();
         st.executeUpdate("update registration set statuss='allowded'");         
         ResultSet rs=st.executeQuery("select * from registration where accountno='"+accountno+"'");
         {
             if(rs.next())
             {
                 String status=rs.getString("statuss");
                if(status.equalsIgnoreCase("allowded")){
                 {
                     PreparedStatement  ps=con.prepareStatement("insert into images (accountno,image) values (?,?)");
                     ps.setString(1,accountno);
                     if(photo!=null)
                     {

                         ps.setBlob(2, photo);
                     }
//                     String img="insert into images values('"+accountno+"','"+photo+"')";
//                     st.executeUpdate(img);
                    String sql="insert into user (firstname,lastname,password,confirmpass,dob,age,sex,email,address,accountno,phone,balance,bankname,branchname,image) select name,lastname,password,confirmpass,dob,age,sex,email,address,accountno,phone,balance,bankname,branchname,image from registration where accountno='"+accountno+"'";                    
                    st.executeUpdate(sql); 
                
             }
                 st.executeUpdate(delete);
                 RequestDispatcher rd=request.getRequestDispatcher("a_newaccount1.jsp");       
                 rd.forward(request, response);
                 
             }}
                 
                         
                 
//                    String img="insert into additionalimage(accountno,image)values(?,?)";
//                     
//                     InputStream photo = null;
//                    Part profile = request.getPart("photo");
//                    if (profile != null) {
//                            // prints out some information for debugging
//                            System.out.println(profile.getName());
//                            System.out.println(profile.getSize());
//                            System.out.println(profile.getContentType());             
//                            // obtains input stream of the upload file
//                            photo = profile.getInputStream();
//                                        }
//                    PreparedStatement statement = con.prepareStatement(img);
//                    statement.setString(1,accountno);
//                    if (photo != null) {
//                // fetches input stream of the upload file for the blob column
//                    statement.setBlob(2, photo);
//                    }
                 
             else
                {
                 RequestDispatcher rd1=request.getRequestDispatcher("a_newaccount1.jsp");
                 rd1.forward(request, response);
                }
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
