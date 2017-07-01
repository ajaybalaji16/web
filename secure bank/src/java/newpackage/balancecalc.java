
package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class balancecalc
{
    HttpServletRequest request;
    HttpServletResponse response;
    void totbalance(String amt)
    {
        try
        {
//            HttpSession hs=request.getSession();
//           String taccountno=(String) hs.getAttribute("taccountno");
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                 ResultSet rs=st.executeQuery("select balance from user where accountno='1234567877'");
                 if(rs.next())
                 {
                     int amtt=Integer.valueOf(amt);
                     int balanceoftoaccount=rs.getInt("balance");
                     int total=amtt+balanceoftoaccount;
                     System.out.println(total);
                 }
                 else
                 {
                     
                 }
                       }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        balancecalc b=new balancecalc();
        b.totbalance("5000");
    }
}
