<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="Basic.ConnectionManager" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>My Orders | 4Shoppers</title>
        <!-- Bootstrap core CSS -->         
        <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet"> 
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet"> 
        <!-- Material Design core CSS -->         
        <link href="assets/mdl/material.min.css" rel="stylesheet"> 
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <!-- Custom styles for this template -->
        <link href="assets/style.css" rel="stylesheet">
        
    </head>
    <body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header"> 
	<!-- Checking user is logged in or not -->
            <%
        if (session.getAttribute("client") == null ){
           
            response.sendRedirect("login.html");

        }else {
            %>
               <jsp:include page="includes/user-nav.jsp"></jsp:include>
            <% } %>
           
            <main class="mdl-layout__content"> 
                <div class="page-content">
        <div class="container">
            <div class="row">
			<!-- creating connection using connection manager class to retrieve data from order_detail and order_list table.-->
            <%
                Connection conn=null;
            
        		Statement st=null;
        		ResultSet rs=null;
        		
        		Statement st1=null;
        		ResultSet rs1=null;
        		
        		Statement st2=null;
        		ResultSet rs2=null;
        		
        		Statement st3=null;
        		ResultSet rs3=null;
        		
        		int order_id=0;
        		int grand_total=0;
        		Date date_time;
        		String status="";
        		
        		String p_name="";
        		int p_id=0;
        		int quantity=0;
        		int sub_total=0;
        		
        		
        		String catg="";
        		String imgUrl="";
        		
                
                
        		conn=ConnectionManager.getConnection();
        		st=conn.createStatement();
        		st1=conn.createStatement();
                st2=conn.createStatement();
                st3=conn.createStatement();
        		rs= st.executeQuery("select * from order_list where client_id='"+session.getAttribute("client")+"'");
        		while(rs.next()){
        			order_id=rs.getInt("order_id");
        			date_time=rs.getDate("stamp");
        			grand_total=rs.getInt("total_cost");
        			status=rs.getString("status");
        			
        			
            %>
                <div class="col-md-12">
                    <div class="order-container">
                        <div class="order-card">
                            <div class="order-header">
                                <button type="button" class="btn btn-default">Order :<%=order_id %></button>
                                <span class="label label-success"><%=status %></span>
                            </div>
                            <div class="order-items">
                                <ul> 
                                <%
                                
                                rs1= st1.executeQuery("select * from order_detail where order_id='"+order_id+"'");
                               
                        		while(rs1.next()){
                        			
                        			p_id=rs1.getInt("pid");
                        			quantity=rs1.getInt("quantity");
                        			sub_total=rs1.getInt("sub_total");
                        			
                        			rs2= st2.executeQuery("select * from plist where id='"+p_id+"'");
                        			rs2.next();
                        			catg=rs2.getString("catg");
                        			p_name=rs2.getString("title");
                        			
                        			rs3= st3.executeQuery("select photo from "+catg+" where id='"+p_id+"'");
                        			rs3.next();
                        			imgUrl=rs3.getString("photo");
                        			
                                %>
                                    <li>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <img src="<%=imgUrl %>img-1.jpeg" class="img-responsive">
                                                <a href="product_detail.jsp?pid=<%=p_id%>"><h6><%=p_name %></h6></a>
                                                <span>
            Quantity : <%=quantity %></span>
                                            </div>
                                            <div class="col-md-4">
                                                <p>
               Price : <i class="fa fa-inr" aria-hidden="true"></i><%=sub_total %> </p>
                                            </div>
                                            <div class="col-md-4">
                                                <p>
               Order Date : <%=date_time %></p>
                                            </div>
                                        </div>
                                    </li>                                     
                                    <% } %>
                                </ul>
                            </div>
                            <div class="order-date">
                                <p><strong>Order Date: <%=date_time %></strong> <small>Order Total : <i class="fa fa-inr" aria-hidden="true"></i><%=grand_total %></small></p>
                            </div>
                        </div>
                    </div>                     
                </div>
                <% }
        		rs.close();
        		rs1.close(); 
        		rs2.close();
        		rs3.close(); %>
            </div>
        </div>
        <div class="push"></div>
        </div>
        </main>
        </div>
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery-3.1.1.min.js"></script>        
        <script src="assets/js/jquery-migrate-1.4.1.min.js"></script>              
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>       
        <script src="assets/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>  
         <script src="assets/mdl/material.min.js"></script>    
        <script src="assets/script.js"></script>
    </body>
</html>
