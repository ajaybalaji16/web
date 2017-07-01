<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Banking</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
        document.onkeydown = function() {
        if(event.keyCode == 116) {
                event.returnValue = false;
                event.keyCode = 0;
                return false;
               }
               
    }
//    function view(id)
//    {
//        window.location.href="http://localhost:8080/lasttemplate/loan.jsp?id"+id;
//    }
      $(document).ready(function() {
                    $("#user").change(function() {
                        var value = $(this).val();
                        $.get("finaltransaction.jsp", {q: value}, function(data) {
                            $("#javaquery").html(data);
                        });
                    });
                });
        
//            $("#user").change(function() {
//                        var value = $(this).val();
//                        $.get("finaltransaction.jsp", {q: value}, function(data)
       
   function x(){
                 window.open("finaltransaction.jsp")           
//                         window.location = "http://localhost:8080/lasttemplate/finaltransaction.jsp";
//document.forms[0].action = "http://localhost:8080/lasttemplate/finaltransaction.jsp";
//document.forms[0].method = "post"; // "get"
//document.forms[0].submit();
    }
    function checkInp()
{
  var x=document.forms["form1"]["amount"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkamount(amount)
{
    var amount=document.getElementById('amt').value;
    if(amount>=500)
    {
        return true;
    }
    else
    {
        alert("Must transfer amount greater than Rs.500");
        return false;
    }
}
</script>
<style>
body {
    color: #212121;
}

h1,h3 {
    color: #0064ab;
}
p.italic {
    font-style: italic;
}
p {
    font-size: 15px;
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">Secure<span>Banking</span> <small>Trust us</small></a></h1>
      </div>
<!--      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our site:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>-->
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li ><a href="home.jsp"><span>Home</span></a></li>
          <li><a href="fixeddeposit.jsp"><span>Fixed Deposit</span></a></li>
           <li><a href="beneficiary.jsp"><span>Beneficiary</span></a></li>
          <li class="active"><a href="transaction.jsp"><span>Transaction</span></a></li>
          <!--<li><a href="loan.jsp"><span>Loan</span></a></li>-->
          <li style="padding-left: 400px;;" ><a href="login.jsp"><span>Logout</span></a></li>
          <!--<li><a href="contact.html"><span>Contact Us</span></a></li>-->
        </ul>
      </div>
      <div class="clr"></div>
<!--      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="335" alt="" /> </a> </div>-->

        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize"> 
        <center><h1>Account Transaction</h1></center>
        <br></br>
                <center> <form name="form1" action="random" method="post" autocomplete="off">
            
                <%
                    HttpSession hs=request.getSession();
                    String accountno=(String)hs.getAttribute("accountno");
                    String email = (String) session.getAttribute("email1");
                    try{
                         Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from user where accountno='"+accountno+"'");
                        if(rs.next())
                        {
                %>
                      
                            <center><table width="500"> 
                                    <tr align="center">     
                                        <td>
                                            <h3 align="left">From:</h3></td>
                                    </tr>
<!--                                     <tr>
                                         <td><p class="italic">Bank Name:</p> </td>
                                      <td%=rs.getString("bankname")%></td>
                                     </tr>
                            <tr> <td>&nbsp;</td> </tr>-->
                         
                            <tr>
                                <td><p class="italic">Branch Name: </p></td>
                                <td><%=rs.getString("branchname")%></td>
                            </tr>
                            <tr> <td>&nbsp;</td> </tr>
                            <tr>
                                <td><p class="italic">Account No: </p></td>
                                <td><%=rs.getString("accountno")%></td>
                            </tr>
                            <tr> <td>&nbsp;</td> </tr>
                             <tr>
                                         <td><p class="italic">Balance</p> </td>
                                      <td><%=rs.getString("balance")%></td>
                                     </tr>
                                                        <tr> <td>&nbsp;</td> </tr>
                                                        <tr align="center">    
                                        <td>
                                            <h3 align="left">Transaction To:</h3></td>
                                    </tr>

                                </table></center>
             
                        <%}%>  
                                              
<!--                        <center><table border="1" width="500"  align="center">
                               <pre> 
                        <tr>
                              <th align="center">  Name  </th>
                            <th align="center"> Account No  </th>
                            <th align="center"> Status</th>
                            <th align="center" colspan="3" >Modify</th>
                           
                        </tr></pre>-->
                        <table width="500">
                             <tr>
                                 <td>
                                       <%
//                        HttpSession hs=request.getSession();
                        String userid=(String)hs.getAttribute("accountno");
                        Statement st1=con.createStatement();
                        ResultSet rs1=st1.executeQuery("select * from beneficiary where userid='"+userid+"' and statuss='enable'");
                        System.out.println(userid);
                        
//                         String name=rs1.getString(1);
//                         String email=rs1.getString(3);
//                         String bankname=rs1.getString(4);
//                         String branchname=rs1.getString(5);
                         %>
                           <p class="italic">Beneficiary Account:</p></td><td> <select name="viewaccount" style="width:61%; padding-left:  39px;">
                             <option value="" ><---Select---></option>
                             <%while(rs1.next())
                        {
                         String viewaccount=rs1.getString(2);
                         System.out.println(viewaccount);
                         HttpSession hs1=request.getSession();
                          hs1.setAttribute("viewaccount",viewaccount);%>
                            <option value="<%=viewaccount%>"><%=viewaccount%></option>
                            <% 
                        }%>
                                         </select></td>
                             </tr>
                             <tr>
                                 <td>
                                     <h3>Amount</h3>
                                 </td>
                                 <td>
                                     <input type="text" name="amount" id="amt" onkeyup="return checkInp()"  required="" />
                                 </td>
                             </tr>
                         </table>
                             <table>
                                 <center> <input type="submit" value="Click To Transfer" name="click" style="background-color: #008dde;height:40px; width:120px;color: white" onclick="return checkamount('amt')"></input>
                             </table>
                    </form>
<!--                        <tr align="center">
                            <td align="center"><h3>%=name%></h3></td>
                            <td  align="center" ><h3>%=rs1.getString(2)%></h3></td>
                            <td align="center"><h3>%=rs1.getString(6)%></h3></td>
                            
                            <td align="center"><button value="%=rs1.getString(2)%>" style="background-color: #008dde;height:20px; width:60px;color: white"name="delete" >Delete </td>
                        </tr>-->
                      
                                                                                                          

                       
                           <% 
//                           hs.setAttribute("viewaccount", viewaccount);
//                           hs.setAttribute("name", name);
//                            hs.setAttribute("email", email);
//                            hs.setAttribute("bankname", bankname);
//                            hs.setAttribute("branchname", branchname);
                        %>
                            </table></center>
                    <%}
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }%>
                    <!--<td><input type="text" name="name" size="50"/></td>-->
                
<!--                               <tr> <td>&nbsp;</td> </tr>
                            <tr><td><h3> Transaction To:</h3></td></tr>
                            <tr>
                                <td> <p class="italic">Account No: </p> </td>
                    <td><input type="text" name="taccountno" pattern="[0-9]{10}" required=""/></td>
                </tr>
                       <tr> <td>&nbsp;</td> </tr>     
                <tr>
                    <td> <p class="italic">Email-id: </p></td>
                    <td><input type="text" name="email" id="email"  required=""/></td>
                </tr>
                       <tr> <td>&nbsp;</td> </tr>
                <tr>
                    <td> <p class="italic">Bank Name: </p></td>
                    <td><input type="text" name="bankname">
                    </td>
                </tr>
                       <tr> <td>&nbsp;</td> </tr>
                <tr>
                    <td> <p class="italic">Branch Name: </p></td>
                    <td><input type="text" name="branchname">
            
                    </td>
                </tr>
                       <tr> <td>&nbsp;</td> </tr>
                <tr>
                    <td> <p class="italic">Amount: </p></td>
                    <td><input type="text" name="amount" pattern="[0-9]+"/></td>
                </tr>-->
                       <tr> <td>&nbsp;</td> </tr>             
                        </table></center>
                         
<!--       <center>
  <table id="myTable"> 
      <tr> <td>&nbsp;</td> </tr>  
      <tr><input type="submit" value="Click To Transfer" onclick="ValidateEmail(document.form1.email)" style="background-color: #008dde;height:40px; width:120px;color: white"></tr>
   </table>
       </center>-->
<!--      <div class="mainbar">-->
<!--        <div class="article">
          <h2><span>Excellent Solution</span> For Your Business</h2>
          <p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com">Comments <span>11</span></a></p>
          <div class="clr"></div>
          <div class="img"><img src="images/img1.jpg" width="650" height="196" alt="" class="fl" /></div>
          <div class="post_content">
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. <a href="#">Suspendisse bibendum. Cras id urna.</a> Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra condimentum, lorem tellus eleifend magna, eget fringilla velit magna id neque. Curabitur vel urna. In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</p>
            <p><strong>Aenean consequat porttitor adipiscing. Nam pellentesque justo ut tortor congue lobortis. Donec venenatis sagittis fringilla.</strong> Etiam nec libero magna, et dictum velit. Proin mauris mauris, mattis eu elementum eget, commodo in nulla. Mauris posuere venenatis pretium. Maecenas a dui sed lorem aliquam dictum. Nunc urna leo, imperdiet eu bibendum ac, pretium ac massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisi. Quisque condimentum luctus ullamcorper.</p>
            <p class="spec"><a href="#" class="rm">Read more &raquo;</a></p>
          </div>
          <div class="clr"></div>
        </div>-->
<!--        <div class="article">
          <h2><span>We'll Make Sure Template</span> Works For You</h2>
          <p class="infopost">Posted on <span class="date">29 aug 2016</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com">Comments <span>7</span></a></p>
          <div class="clr"></div>
          <div class="img"><img src="images/img2.jpg" width="650" height="196" alt="" class="fl" /></div>
          <div class="post_content">
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</a> Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra condimentum, lorem tellus eleifend magna, eget fringilla velit magna id neque. Curabitur vel urna. In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam.</p>
            <p><strong>Aenean consequat porttitor adipiscing. Nam pellentesque justo ut tortor congue lobortis. Donec venenatis sagittis fringilla.</strong> Etiam nec libero magna, et dictum velit. Proin mauris mauris, mattis eu elementum eget, commodo in nulla. Mauris posuere venenatis pretium. Maecenas a dui sed lorem aliquam dictum. Nunc urna leo, imperdiet eu bibendum ac, pretium ac massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisi. Quisque condimentum luctus ullamcorper.</p>
            <p class="spec"><a href="#" class="rm">Read more &raquo;</a></p>
          </div>-->
          <!--<div class="clr"></div>-->
        </div>
        <!--<p class="pages"><small>Page 1 of 2</small> <span>1</span> <a href="#">2</a> <a href="#">&raquo;</a></p>-->
      </div>
<!--      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="#">Home</a></li>
            <li><a href="#">TemplateInfo</a></li>
            <li><a href="#">Style Demo</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Archives</a></li>
            <li><a href="#">Web Templates</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star"><span>Sponsors</span></h2>
          <div class="clr"></div>
          <ul class="ex_menu">
            <li><a href="#">Lorem ipsum dolor</a><br />
              Donec libero. Suspendisse bibendum</li>
            <li><a href="#">Dui pede condimentum</a><br />
              Phasellus suscipit, leo a pharetra</li>
            <li><a href="#">Condimentum lorem</a><br />
              Tellus eleifend magna eget</li>
            <li><a href="#">Fringilla velit magna</a><br />
              Curabitur vel urna in tristique</li>
            <li><a href="#">Suspendisse bibendum</a><br />
              Cras id urna orbi tincidunt orci ac</li>
            <li><a href="#">Donec mattis</a><br />
              purus nec placerat bibendum</li>
          </ul>
        </div>
      </div>-->
      <!--<div class="clr"></div>-->
    </div>
 
<!--  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2><span>Services</span> Overview</h2>
        <p>Curabitur sed urna id nunc pulvinar semper. Nunc sit amet tortor sit amet lacus sagittis posuere cursus vitae nunc.Etiam venenatis, turpis at eleifend porta, nisl nulla bibendum justo.</p>
        <ul class="fbg_ul">
          <li><a href="#">Lorem ipsum dolor labore et dolore.</a></li>
          <li><a href="#">Excepteur officia deserunt.</a></li>
          <li><a href="#">Integer tellus ipsum tempor sed.</a></li>
        </ul>
      </div>
      <div class="col c3">
        <h2><span>Contact</span> Us</h2>
        <p>Nullam quam lorem, tristique non vestibulum nec, consectetur in risus. Aliquam a quam vel leo gravida gravida eu porttitor dui.</p>
        <p class="contact_info"> <span>Address:</span> 1458 TemplateAccess, USA<br />
          <span>Telephone:</span> +123-1234-5678<br />
          <span>FAX:</span> +458-4578<br />
          <span>Others:</span> +301 - 0125 - 01258<br />
          <span>E-mail:</span> <a href="#">mail@yoursitename.com</a> </p>
      </div>
      <div class="clr"></div>
    </div>
  </div>-->
  <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: blue">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: blue">A Trust Sector</p>
      <div style="clear:both;"></div>
   
  </div>
</div>
</body>
</html>
