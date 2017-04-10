<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,Basic.ConnectionManager" %>
<% 
Connection con=null;	//connection to the DB is declared
Statement st=null;	//statement to be sent to query the DB is declared
ResultSet rs=null;

con = ConnectionManager.getConnection();	//connection is initialized, port is given, DB name,password are given
st= con.createStatement();	//statement is initialized to be queried with the DB
rs= st.executeQuery("select count(id) from cart where id='"+session.getAttribute("client")+"'");
rs.next();
int count=rs.getInt(1);
rs.close();
rs= st.executeQuery("select SUM(sub_total) from cart where id='"+session.getAttribute("client")+"'");
rs.next();
int grandTotal =rs.getInt(1);
rs.close();
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Payment Form |</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link rel="icon" type="image/png" href="assets/img/favicon.png" />
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
        <link href="assets/css/material-bootstrap-wizard.css" rel="stylesheet" />
        <!-- Material Design core CSS -->         
        <link href="assets/mdl/material.min.css" rel="stylesheet">
        <link href="assets/style.css" rel="stylesheet"> 
        <body>
</body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header"> 
        <%
        if (session.getAttribute("client") == null ){
           
        	response.sendRedirect("login.html");
        } %>
        <header class="mdl-layout__header"> 
                <div class="mdl-layout__header-row"> 
                    <!-- Title -->                     
                    <a href="index.jsp"><span class="mdl-layout-title"><img src="assets/images/logo-2.png" style="width:108px; height:30px; margin-left:-10px;"></span> </a>                   
                                        
                   
                </div>                 
            </header>             
                   
        <!--   Core JS Files   -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <!--      Wizard container        -->
                    <div class="wizard-container">
                        <div class="card wizard-card" data-color="red" id="wizard">
                            <form action="ID" method="post" >
                                <!--        You can switch " data-color="blue" "  with one of the next bright colors: "green", "orange", "red", "purple"             -->
                                <div class="wizard-header">
                                    <h3 class="wizard-title">
		                        		4Shoppers</h3>
                                    <h5>Provide your Details to confirm Order.</h5>
                                </div>
                                <div class="wizard-navigation">
                                    <ul>
                                        <li>
                                            <a href="#details" data-toggle="tab">Address</a>
                                        </li>
                                        <li>
                                            <a href="#captain" data-toggle="tab">Payment Method</a>
                                        </li>
                                        <li>
                                            <a href="#description" data-toggle="tab">Confirm Order</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane" id="details">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h4 class="info-text"> Let's start with the Address details.</h4>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="material-icons">home</i></span>
                                                    <div class="form-group label-floating">
                                                        <label class="control-label">Address Line 1</label>
                                                        <input name="add_line1" type="text" class="form-control" id="address1" required>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="material-icons">home</i></span>
                                                    <div class="form-group label-floating">
                                                        <label class="control-label">Address Line 2</label>
                                                        <input name="add_line2" type="text" class="form-control" id="address2" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="material-icons">home</i></span>
                                                    <div class="form-group label-floating">
                                                        <label class="control-label">State</label>
                                                        <input name="State" type="text" class="form-control" id="state" required>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="material-icons">home</i></span>
                                                    <div class="form-group label-floating">
                                                        <label class="control-label">Pincode</label>
                                                        <input name="pin" type="number" maxlength="6" class="form-control" id="pin" required>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="material-icons">home</i></span>
                                                    <div class="form-group label-floating">
                                                        <label class="control-label">Phone Number</label>
                                                        <input name="pin" type="number" maxlength="10" class="form-control" id="phone" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="captain">
                                        <h4 class="info-text">We Only support Cash On Delivery for now. </h4>
                                        <div class="row">
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <div class="col-sm-4">
                                                <a href="payuform.jsp">
                                                    <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Pay with Credit card.">
                                                        <input type="radio" name="job" value="Design">
                                                        <div class="icon">
                                                            <i class="material-icons">credit_card</i>
                                                        </div>
                                                        <h6>Credit Card</h6>
                                                    </div></a>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Pay when Product reachs your door step.">
                                                        <input type="radio" name="job" value="Code">
                                                        <div class="icon">
                                                            <i class="fa fa-money" aria-hidden="true"></i>
                                                        </div>
                                                        <h6>Cash On Delivery</h6>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                <a href="payuform.jsp">
                                                    <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Select Debit card for payment">
                                                        <input type="radio" name="job" value="Code">
                                                        <div class="icon">
                                                            <i class="material-icons">credit_card</i>
                                                        </div>
                                                        <h6>Debit Card</h6>
                                                    </div></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="description">
                                        <div class="row">
                                            <h4 class="info-text"> Order Summary</h4>
                                            
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    
                                                    <p class="description">Total Items in your cart : <%=count %><br>
                                                    Grand Total : <%=grandTotal %><br>
                                                        Payment Method : Cash On Delivery</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="wizard-footer">
                                    <div class="pull-right">
                                        <input type='button' class='btn btn-next btn-fill btn-danger btn-wd' name='next' value='Next' />
                                        
                                        <input type='submit' class='btn btn-finish btn-fill btn-danger btn-wd' name='finish' value='Finish' id="submit-form"/>
                                      
                                    </div>
                                    <div class="pull-left">
                                        <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
                                        <div class="footer-checkbox">
</div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>                     
                    <!-- wizard container -->
                    
                </div>
            </div>       
            <!-- row -->
        </div>
         <div class="push"></div>      
        </div>
        <script src="assets/js/jquery-3.1.1.min.js"></script>                     
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
        <script src="assets/js/jquery.bootstrap.js" type="text/javascript"></script>
        <!--  Plugin for the Wizard -->
        <script src="assets/js/material-bootstrap-wizard.js"></script>
        <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
        <script src="assets/js/jquery.validate.min.js"></script>
         <script src="assets/mdl/material.min.js"></script> 
         
         <script type="text/javascript">
          $(document).ready(function(){
      	
          $("#submit-form").click(function(){
        	  var num=$("#phone").val();
           var address1 = $("#address1").val();
           var address2 = $("#address2").val();
           var state = $("#state").val();
           var pincode = $("#pin").val();
                $.post("Details",{address1:add_lin1,address2:add_lin2,state:state,pincode:pin,num:phone},function(data){
              	  alert("address : "+address1+" :state : "+state);
                    });
              	   
              });
      });
        
        </script>   
</html>
