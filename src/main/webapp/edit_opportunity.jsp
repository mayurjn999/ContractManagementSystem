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
<title>Add Opportunity</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
   Session s=FactoryProvider.getFactory().openSession();
	Opportunity note=(Opportunity)s.get(Opportunity.class, noteId);
	s.close();
   %>
	<div class="container" style="margin-top: 20px;">
              
            <form action="UpdateOpportunityServlet" method="post">
              <div class="form-group row form-padding" style=" padding-top: 5px;">
                <h3 class="col-sm-8"  style=" text-align: center; color: white; background-color: #404040;font-weight: 100;">Opportunity Details</h3>
              </div>
                
                <div class="form-padding form-group row">
                  <label for="reference-number" class="col-sm-3 col-form-label text-color">Reference Number</label>
                  <div class="col-sm-5">
                    <input type="text" name="reference_number" value="<%= note.getReference_number() %>"
                    class="form-control" id="reference-number" placeholder="Reference Number" required >
                  </div>
                </div>
                <div class="form-group row form-padding">
                  <label for="client" class="col-sm-3 col-form-label">Client Name</label>
                  <div class="col-sm-5">
                    <input type="text" name="client_name" value="<%= note.getClient_name() %>"
                    class="form-control" id="client" placeholder="Client Name" required>
                  </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="service" class="col-sm-3 col-form-label">Type of Service</label>
                    <div class="col-sm-5">
                      <input type="text" name="service_type" value="<%= note.getService_type() %>"
                      class="form-control" id="service" placeholder="Type" required>
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="service" class="col-sm-3 col-form-label">Submission Due Date</label>
                    <div class="col-sm-5">
                        <input type="date" name="due_date" value="<%= note.getDue_date() %>"
                        class="form-control" id="due-date" name="due_date" >
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">Upload Document (Optional)</label>
                    <div class="col-sm-5">
                        <input type="file" name="doc" 
                        class="form-control" id="document" name="upload_document"  multiple>
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="status" class="col-sm-3 col-form-label">Opportunity Status</label>
                    <div class="col-sm-5">
                    <label class="radio-inline">
                        <input type="radio" name="optradio" value="Won">Won
                      </label>
                        
                        
                      <label class="radio-inline" style="padding-left: 10%;" >
                        <input type="radio" name="optradio" value="Lost">Lost
                      </label>
                      </div>  
                    
                </div>
                <div class="form-group row form-padding" style="margin-left:40%">
  
                    <button type="submit" class="btn btn-primary">Submit</button>
                    
                    </div>
              </form>
            </div>
</body>
</html>