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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}

//--></script>
<script type="text/javascript">

//    $(document).ready(function() {
//        function disableBack() { window.history.forward() }
//
//        window.onload = disableBack();
//        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
//    });
//        document.onkeydown = function() {
//        if(event.keyCode == 116) {
//                event.returnValue = false;
//                event.keyCode = 0;
//                return false;
//               }
//               
//    }
    server.transfer("registration.jsp");
//    subwin = window.open(url,"dummyname",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no'); 

            function Validate() {
        var password = document.getElementById("txtNewPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
    function ValidateEmail(inputText)  
                {  
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
                if(inputText.value.match(mailformat))  
                {  
                document.form1.email.focus();  
                return true;  
                }  
                else  
                {  
                alert("You have entered an invalid email address!");  
                document.form1.email.focus();  
                return false;  
                }  
                }  

function checkemail(email)
{
   var regex=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   if(!regex.test(email))
   {
       alert('Please enter valid email id');
    }
 }
 function validate() {
    if (document.myForm.name.value == "") {
        alert("Enter a name");
        document.myForm.name.focus();
        return false;
    }
    if (!/^[a-zA-Z]*$/g.test(document.myForm.name.value)) {
        alert("Invalid characters");
        document.myForm.name.focus();
        return false;
    }
    function onkeydown(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[a-zA-Z]/   ;
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
}
function checkNum()
{

if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8)
   return true;
else
   {
       alert("Please enter only char");
       return false;
   }

}
function checkInp()
{
  var x=document.forms["form1"]["age"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkInp3()
{
  var x=document.forms["form1"]["acc"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkInp1()
{
  var x=document.forms["form1"]["phone"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword){
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    
    }
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}

$(document).ready(function () {
   $("#txtConfirmPassword").keyup(checkPasswordMatch);
});
$('#txtConfirmPassword').keyup(function(){


if($(this).val() != $('#txtNewPassword').val().substr(0,$(this).val().length))
{
 alert('confirm password not match');
}



});
function check() {
    if(document.getElementById('password').value === document.getElementById('confirm_password').value) {
        document.getElementById('message').innerHTML = "match";
    } else {
        document.getElementById('message').innerHTML = "no match";
    }
}

function IsAccountNumber(txtMobId) {
    var mob = /^[1-9]{1}[0-9]{9}$/;
    var txtMobile = document.getElementById(txtMobId);
    if (mob.test(txtMobile.value) == false) {
        alert("Please enter valid Account number.Account no should have 10 digit");
        txtMobile.focus();
        return false;
    }
    return true;
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
<style>
body {
    color: #212121;
}

h1 {
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
          <li ><a href="index.html"><span>Home</span></a></li>
          <li><a href="login.jsp"><span>Login</span></a></li>
          <li class="active"><a href="registration.jsp"><span>Registration</span></a></li>
          <li><a href="about.jsp"><span>About Us</span></a></li>
          <!--<li><a href="contact.html"><span>Contact Us</span></a></li>-->
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <!--<div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="335" alt="" /> </a> </div>-->

        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
      <div>
          <div class="box">
        <section class="container">
            <div class="login">
                <form name="form1" action="registration" method="post" enctype="multipart/form-data"  width="600px" autocomplete="off" onsubmit="return Validate()">
            
                <center>               
                    <h1>Registration Form</h1><br><br>
                    </center>
                    <center>     <table width='800' align="center">
                            <tr align="center">
                                <td>First Name:</td>
                                <td><input type='text' name='name'  required pattern='[A-Za-z\\s]*'
                                           onkeypress="return checkNum()"  autocomplete="false"></td>
                                <td>Last Name:</td>
                                <td><input type='text' name='last' pattern="[a-zA-Z]+"required onkeydown="return checkNum()"></td>
                            </tr>
                            <tr ><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td>Age:</td>
                                <td><input type='text' name='age' required="" onkeyup="return checkInp()" maxlength="2"></td>
                                <td>Date Of Birth:</td>
                                <td><input type="date" name='dob' required style="width: 155px"></td>
                            </tr>
                            <tr ><td>&nbsp;</td></tr>
                            <tr align="center">
                                
                                <td>Phone:</td>
                                <td><input type='text' name='phone' required="" id="txtMB" onkeyup="return checkInp1()"  pattern="[0-9]{10}" maxlength="10"/></td>
                                <!--<td><input type='text' name='phone' required="" onkeydown="return checkInp1()" maxlength="10"  pattern="[0-9]{10}" /></td>-->
                                <td>Branch Name:</td>
                                <td><input type='text' name='branchname' required onkeyup="return checkNum()" pattern="[a-zA-Z]+"></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td>Account number: </td>
                                <td><input  type="text" name="acc" onkeyup="return checkInp3()" onclick="return IsMobileNumber('txtMB')"   id="txtMB1" maxlength="10" pattern="[0-9]{10}"/></td>
                                <td>Email-id:</td>
                                <td><input type='text' name='email' id="email"  required onkeyup="if(this.length>255) this.value=this.value.substr(0, 255)" onblur="checkemail(this.value)" /></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td>Password:</td>                           
                                <td> <div class="td"> <input type="password"  name="password" id="txtNewPassword" onkeyup="return IsAccountNumber('txtMB1')" required/></div></td>
                                <td>Confirm Password:</td>
                                <td><div class="td"><input type="password" name="cpass" id="txtConfirmPassword" onkeyup="checkPasswordMatch();"  required/>
                             </div>
    <div class="registrationFormAlert" id="divCheckPasswordMatch">
</div></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td>Gender:</td>
                                <td><input type='radio' name='sex' value="male"checked>Male
                                        <input type="radio" name="sex" value="female">Female</td>
                                <td>Address:</td>
                                <td><input type='text' name='addr' required></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td>Bank Name:</td>
                                <td>
                         <select name="bankname" style="width:61%; padding-left:  39px;">
                                             <option value="" ><--Select--></option>
                                             <option value="sbi">SBI</option>
                                             <option value="hdfc">HDFC</option>
                                             <option value="kotak">KOTAK</option>
                                             <option value="icici">ICICI</option>
                                             <option value="indian">INDIAN</option>
                         </select>
                    </td>
                                
                                <td >Image Password: </td>
                                <td><input type="file"  name="photo"  size="50" accept="image/*" required style="width: 155px" /></td>
                            </tr>
                        </table></center><br><br>
                                <center> <input type="submit" value="Register" name="register" style="background-color: #008dde;height:40px; width:120px;color: white" /></center>
                            </form>
         
            </div>
      </div>
    <div class="content_resize">
      <div class="mainbar">
          
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
