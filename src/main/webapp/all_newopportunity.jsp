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
<title>Show Opportunity</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container" style="border:none">
	<h1>All Opportunity</h1>
	<div class="row">
   	<div class="col-12">
   		<%
   	Session s=FactoryProvider.getFactory().openSession();
   	Query q=s.createSQLQuery("select * from opportunities order by status,reference_number");
   	List<Object[]> list=q.list();
   	for(Object[] note:list)
   	{
   		%>
   		<div class="card mt-3">
  <div class="card-body px-5">
    <h5 class="card-title">Reference Number : <%= note[0] %></h5>
    <p class="card-text"><span>Client Name : <%= note[1] %></span>
    <span style="margin-left:30%">Document Name : <%= note[2] %></span>
    </p>
    <p class="card-text"><span>Due Date : <%= note[3] %></span>
    <span style="margin-left:20%">Service Type : <%= note[4] %></span>
    </p>
    
    <p class="card-text">Status : <%= note[5] %></p>
    <div class="container text-center mt-2" style="border:none">
    <% int id1=((Integer)note[0]).intValue(); %>
    <% if(note[5].toString().equals("Won")){ %>
    <a href="add_contract.jsp?note_id=<%= id1 %>" class="btn btn-success" >Add Contract</a>
    <%} %>
    <a href="DeleteOpportunityServlet?note_id=<%= id1 %>" class="btn btn-danger" >Delete</a>
    <a href="edit_opportunity.jsp?note_id=<%= id1 %>" class="btn btn-primary">Update</a>
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