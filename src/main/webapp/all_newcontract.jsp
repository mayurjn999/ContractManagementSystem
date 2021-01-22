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
<title>Show Contracts</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container" style="border:none">
	<h1>All Contracts</h1>
	<div class="row">
   	<div class="col-12">
   		<%
   	Session s=FactoryProvider.getFactory().openSession();
   	Query q=s.createSQLQuery("select * from contracts order by reference_number");
   	List<Object[]> list=q.list();
   	for(Object[] note:list)
   	{
   		%>
   		<div class="card mt-3">
  <div class="card-body px-5">
    <h5 class="card-title">Reference Number : <%= note[0] %></h5>
    <p class="card-text"><span>Client Name : <%= note[1] %></span>
    <span style="margin-left:30%">Received Date : <%= note[8] %></span>
    </p>
    <p class="card-text"><span>contract Value : <%= note[3] %></span>
    <span style="margin-left:27%">Contract Type  : <%= note[2] %></span>
    </p>
    <p class="card-text"><span>Start Date : <%= note[9] %></span>
    <span style="margin-left:17%"> End Date : <%= note[6] %></span>
    </p>
    <p class="card-text"><span>Document Name : <%= note[5] %></span>
    <span style="margin-left:20%">Submission Status : <%= note[10] %></span>
    </p>
    <p class="card-text"><span>Reason for Pending : <%= note[7] %></span>
    <span style="margin-left:25%">Description : <%= note[4] %></span>
    </p>
    <div class="container text-center mt-2" style="border:none">
    <% int id1=((Integer)note[0]).intValue(); %>
    <a href="add_po.jsp?note_id=<%= id1 %>" class="btn btn-success" >Add PO</a>
    <a href="edit.jsp?note_id=<%= note[0] %>" class="btn btn-primary">Update</a>
    <a href="DeleteContractServlet?note_id=<%= id1 %>" class="btn btn-danger" >Delete</a>
    
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