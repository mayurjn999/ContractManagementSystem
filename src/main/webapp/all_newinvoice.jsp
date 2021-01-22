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
<title>Show Invoice</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container" style="border:none">
	<h1>All Invoices</h1>
	<div class="row">
   	<div class="col-12">
   		<%
   	Session s=FactoryProvider.getFactory().openSession();
   	Query q=s.createSQLQuery("select * from invoice order by po_id");
   	List<Object[]> list=q.list();
   	for(Object[] note:list)
   	{
   		%>
   		<div class="card mt-3">
  <div class="card-body px-5">
    <h5 class="card-title">Invoice Id : <%= note[0] %></h5>
    <h5 class="card-title">PO_Id : <%= note[9] %></h5>
    <p class="card-text"><span>Invoice File Name : <%= note[8] %></span>
    <span style="margin-left:30%">Invoice Type : <%= note[4] %></span>
    </p>
    <p class="card-text"><span>Invoice Frequency : <%= note[2] %></span>
    <span style="margin-left:39%">Payment Terms  : <%= note[7] %></span>
    </p>
    <p class="card-text"><span>Invoice Date : <%= note[1] %></span>
    <span style="margin-left:32%">Invoice Submission Date : <%= note[3] %></span>
    </p>
    <p class="card-text"><span>Payment Received Date : <%= note[6] %></span>
    <span style="margin-left:23%">Payment Due Date : <%= note[5] %></span>
    </p>
   
    <div class="container text-center mt-2" style="border:none">
    <% int id1=((Integer)note[0]).intValue(); %>
    <a href="edit_invoice.jsp?note_id=<%= id1 %>" class="btn btn-primary">Update</a>
    <a href="DeleteInvoiceServlet?note_id=<%= id1 %>" class="btn btn-danger" >Delete</a>
    
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