<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.servlets.*"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Purchase Orders</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container" style="border:none">
	<h1>All Purchase Order</h1>
	<div class="row">
   	<div class="col-12">
   		<%
   	Session s=FactoryProvider.getFactory().openSession();
   	Query q=s.createSQLQuery("select * from purchaseOrders order by reference_number");
   	List<Object[]> list=q.list();
   	for(Object[] note:list)
   	{
   		%>
   		<div class="card mt-3">
  <div class="card-body px-5">
    <h5 class="card-title">PO Id : <%= note[0] %></h5>
    <h5 class="card-title">Reference Number : <%= note[7] %></h5>
    <p class="card-text"><span>PO Name : <%= note[6] %></span>
    <span style="margin-left:300px">PO Value : <%= note[5] %></span>
    </p>
    <p class="card-text"><span>Start Date : <%= note[3] %></span>
    <span style="margin-left:300px">End Date : <%= note[2] %></span>
    </p>
    <p class="card-text"><span>Contract Period : <%= note[1] %></span>
    <span style="margin-left:350px">Type of PO : <%= note[4] %></span>
    </p>
    
    <div class="container text-center mt-2" style="border:none">
    <% int id1=((Integer)note[0]).intValue(); %>
    <a href="add_invoice.jsp?note_id=<%= id1 %>" class="btn btn-success" >Add Invoice</a>
    <a href="DeletePoServlet?note_id=<%= id1 %>" class="btn btn-danger" >Delete</a>
    <a href="edit.jsp?note_id=<%= note[0] %>" class="btn btn-primary">Update</a>
    </div>
  </div>
</div>
   		
   		<% 
   		
   	}
   	
   	s.close();
   	
   	%>
   	
   	
   	</div>
   	</div>
	</div>
</body>
</html>