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

       
</script>
<script type="text/javascript">
function checkNum1()
{

if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8)
   return true;
else
   {
       alert("Please enter only char");
       return false;
   }

}
function checkInp1()
{ 
   
    var y=document.forms["myForm"]["phone"].value;
    if(isNaN(y))
  {
      alert("Must input numbers");
        return false;
  }
}
  
function IsMobileNumber(txtMobId) {
    var mob = /^[1-9]{1}[0-9]{9}$/;
    var txtMobile = document.getElementById(txtMobId);
    if (mob.test(txtMobile.value) == false) {
        alert("Please enter valid Mobile number.");
        txtMobile.focus();
        return false;
    }
    return true;
}
</script>
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
 function checkInp()
{
  var x=document.forms["myForm"]["amount"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
  
}
function checkdeposit()
{
    var x=document.forms["myForm"]["amount"].value;
    if(x<1000)
    {
        alert("Must deposit amount above 1000");
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
</style></head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">Secure<span>Banking</span> <small>Trust Us</small></a></h1>
      </div>
      <div class="searchform">
<!--        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our site:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>-->
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul> 
          <li><a href="home.jsp"><span>Home</span></a></li>
          <li class="active"><a href="fixeddeposit"><span>Fixed Deposit</span></a></li>
           <li><a href="beneficiary.jsp"><span>Beneficiary</span></a></li>
          <li ><a href="transaction.jsp"><span>Transaction</span></a></li>
          <!--<li><a href="loan.jsp"><span>Loan</span></a></li>-->
          <li style="padding-left: 400px;;" ><a href="login.jsp"><span>Logout</span></a></li>
          
<!--          <li><a href="contact.html"><span>Contact Us</span></a></li>-->
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
        <center> <h1>Fixed Deposit</h1></center><br>
                     <form name="myForm" method="post" action="fixeddeposit" autocomplete="off">
            <center><table width="400">
                                  
                <tr>
                    <td ><p class="italic">Name: </p> </td>
                    <td><input type='text' name='name'  required pattern='[A-Za-z\\s]*'
                                           onkeypress="return checkNum1()"  autocomplete="false"></td>
                </tr> 
                             <tr> <td>&nbsp;</td> </tr>
                            <tr>
                                <td><p class="italic">Mobile No: </p> </td>
                                <td><input type='text' name='phone' required="" id="txtMB" onkeyup="return checkInp1()" pattern="[0-9]{10}" maxlength="10" autocomplete="false"/></td>
                </tr>
                              <tr> <td>&nbsp;</td> </tr>
                <tr>
                    <td> <p class="italic">PanCard No: </p></td>
                    <td><input type="text" name="pan" pattern="[a-zA-Z0-9]{10}" onkeyup="return IsMobileNumber('txtMB')" maxlength="10"required="">
                    </td>
                </tr> 
                 <tr> <td>&nbsp;</td> </tr>
                <tr>
                    <td> <p class="italic">Address: </p></td>
                    <td><textarea rows="4"  name="address" cols="20" placeholder="present" required=""></textarea>
            
                    </td>
                </tr> 
                  <tr> <td>&nbsp;</td> </tr>
                <tr>
                    <td> <p class="italic">Nominee: </p></td>
                    <td><input type="text" name="nominee" pattern="[a-zA-Z]+" onkeypress="return checkNum1()" required=""/></td>
                </tr> 
                   <tr> <td>&nbsp;</td> </tr>

                <tr>
                    <td> <p class="italic">Amount Deposit: </p></td>
                    <td><input type="text" name="amount" onkey="return checkInp()"  required=""/></td>
                </tr> 
                       <tr> <td>&nbsp;</td> </tr>
                       <tr>
                    <td> <p class="italic">Year: </p></td>
                    <td>
                        <select name="select" style="width:61%; padding-left:  39px;" onblur="return checkInp()" onmousedown="return checkdeposit()">
                                             <!--<option value="" ><--Select--></option>-->
                                             <option value="1">1</option>
                                             <option value="2">2</option>
                                             <option value="3">3</option>
                                             <option value="4">4</option>
                                             <option value="5">5</option>
                    </td>
                </tr> 
                     
               
                        </table></center>
                         
       <center>
  <table id="myTable">
      <tr><input type="submit" value="Enter" style="background-color: #008dde;height:40px; width:120px;color: white" onmouseover="return checkdeposit()"></tr>
   </table>
       </center></form>

<!-- <div class="content">
    <div class="content_resize">
      <div class="article">
<p>The Internet banking portal of our bank, enables its retail banking customers to operate their accounts from anywhere anytime, removing the restrictions imposed by geography and time. It's a platform that enables the customers to carry out their banking activities from their desktop, aided by the power and convenience of the Internet.</p>
    <p>Using Internet banking services, you can do the following normal banking transactions online:</p>
    <p>Funds transfer between own accounts.
    Third party transfers to accounts maintained at any branch </p>
    <p>Group Transfers to accounts in Secure Bank Group
    Inter Bank Transfers to accounts with other Banks</p>
    <p>Online standing instructions for periodical transfer for the above</p>
    <p>Credit PPF accounts across branches</p>
    <p>Request for Issue of Demand Draft</p>
    <p>Request for opening of new accounts</p>
     <p>Request for closure of Loan Accounts</p>-->
<!--          <h2><span>About to</span> Company Name</h2> 
          <div class="clr"></div>
          <p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget bibendum tellus. Nunc vel imperdiet tellus. Mauris ornare aliquam urna, accumsan bibendum eros auctor ac.</strong></p>
          <p>Curabitur purus mi, pharetra vitae viverra et, mattis sit amet nunc. Quisque enim ipsum, convallis sit amet molestie in, placerat vel urna. Praesent congue auctor elit, nec pretium ipsum volutpat vitae. Vivamus eget ipsum sit amet ipsum tincidunt fermentum. Sed hendrerit neque ac erat condimentum vulputate. Nulla velit massa, dictum etinterdum quis, tempus at velit.</p>
        </div>
        <div class="article">
          <h2><span>Our</span> Mission</h2>
          <div class="clr"></div>
          <p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget bibendum tellus. Nunc vel imperdiet tellus. Mauris ornare aliquam urna, accumsan bibendum eros auctor ac.</strong></p>
          <p>Maecenas vestibulum fermentum eleifend. Mauris erat sem, suscipit non tincidunt quis, vestibulum eget elit. Duis eget arcu ante. Proin nulla elit, elementum sit amet commodo et, eleifend vitae quam. Nam vel aliquam tortor. Aliquam bibendum erat a urna interdum quis mattis augue interdum. Phasellus fermentum bibendum mauris, ut semper justo pharetra vestibulum. Duis dictum purus sed nibh commodo a congue elit lobortis. Nunc sed feugiat tellus. Mauris aliquet lorem non enim euismod quis fermentum erat porta. Nullam non elit orci. Aliquam blandit mattis feugiat. Cras pulvinar aliquet massa, quis laoreet mi pulvinar ac. Aliquam mi augue, vehicula in consectetur in, porttitor sed tellus. Mauris convallis dapibus auctor. Integer in egestas lorem. In nulla dolor, sollicitudin vitae sollicitudin quis, viverra at lorem.</p>
          <p>Ut ullamcorper velit et nisi feugiat non sagittis tortor pharetra. Mauris ut urna et magna commodo cursus. Curabitur quis elementum arcu. Maecenas eleifend, urna vitae vehicula bibendum, felis tellus tincidunt lorem, at iaculis neque eros ac dui. Nunc malesuada pulvinar suscipit. Phasellus sed tortor quis ligula facilisis aliquam. Aliquam quis magna eu dolor posuere malesuada. Quisque consequat, metus fermentum convallis imperdiet, ante justo pharetra enim, vel commodo ipsum mauris eget purus. Morbi lacinia nisl urna, scelerisque suscipit lacus. Nulla ac orci ut nunc venenatis gravida.</p>
        </div>
      </div>
      <div class="sidebar">
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
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
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
      <div class="clr"></div>-->
    </div>
  </div>
    </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: blue">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: blue">A Trust Sector</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>