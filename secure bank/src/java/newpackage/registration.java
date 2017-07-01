/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class registration extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/bank";
    private String dbUser = "root";
    private String dbPass = "root";
  
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
       
     
        String Name = request.getParameter("name");
        String last = request.getParameter("last");
        String age=request.getParameter("age");
        String sex=request.getParameter("sex");
        String password=request.getParameter("password");
        String cpass=request.getParameter("cpass");
        String dob=request.getParameter("dob");
        String addr=request.getParameter("addr");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String acc=request.getParameter("acc");
        String bankname=request.getParameter("bankname");
        String branchname=request.getParameter("branchname");
       // String bal=request.getParameter("bal");
        System.out.println(Name+" "+last);
         
        InputStream photo = null;
       /* InputStream experiencecert = null;
        InputStream degreecert = null;
        InputStream pgcert = null;
        InputStream ugcert = null;
        InputStream diplomacert = null;
        InputStream hsccert = null;
        InputStream sslccert = null;*/
        // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part profile = request.getPart("photo");
        /*Part exper=request.getPart("experiencecert");
        Part deg = request.getPart("degreecert");
        Part pgc=request.getPart("pgcert");
        Part ugc = request.getPart("ugcert");
        Part dipc=request.getPart("diplomacert");
        Part hscc = request.getPart("hsccert");
        Part sslcc=request.getPart("sslccert");
        */
        
        if (profile != null) {
            // prints out some information for debugging
            System.out.println(profile.getName());
            System.out.println(profile.getSize());
            System.out.println(profile.getContentType());
             
            // obtains input stream of the upload file
            photo = profile.getInputStream();
            /*experiencecert = exper.getInputStream();
            degreecert = deg.getInputStream();
            pgcert = pgc.getInputStream();
            ugcert = ugc.getInputStream();
            diplomacert = dipc.getInputStream();
            hsccert = hscc.getInputStream();
            sslccert = sslcc.getInputStream();*/
            
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery("select * from user where accountno='"+acc+"'");
            if(rs.next())
            {
                 RequestDispatcher rd=request.getRequestDispatcher("loginexist.jsp");
                 rd.forward(request, response);
                 
            }
            else{   // constructs SQL statement
            String sql ="INSERT INTO registration (name,lastname,password,confirmpass,dob,age,sex,email,address,accountno,phone,balance,bankname,branchname,statuss,image) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, Name);
            
             
            if (photo != null) {
                // fetches input stream of the upload file for the blob column
                statement.setString(2, last);
                statement.setString(3, password);
                statement.setString(4, cpass);
                statement.setString(5, dob);
                statement.setString(6, age);
                statement.setString(7, sex);
                statement.setString(8, email);
                statement.setString(9, addr);
                statement.setString(10, acc);
                statement.setString(11, phone);
                statement.setString(12, "0");
                statement.setString(13, bankname);
                statement.setString(14, branchname);
                statement.setString(15, "null");
                statement.setBlob(16, photo);
                
                
            }
 HttpSession hs=request.getSession();
 hs.setAttribute("accountno", acc);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded uploadedand saved into database";
              RequestDispatcher rd=request.getRequestDispatcher("choosepoint.jsp");
                rd.forward(request, response); 
        } 
            }
        }catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            
             
          
            if (conn != null) {
                             
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
        }
    }
}
