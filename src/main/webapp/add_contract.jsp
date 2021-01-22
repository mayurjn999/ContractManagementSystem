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
<title>Add Contract</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
	Session s=FactoryProvider.getFactory().openSession();
	Opportunity o=(Opportunity)s.get(Opportunity.class, noteId);
	
	s.close();
   %>
	<div class="container" style="margin-top: 20px;">
		<form action="SaveContractServlet" method="post" >
              <div class="form-group row form-padding" style=" padding-top: 5px;">
                <h3 class="col-sm-8"  style=" text-align: center; color: white; background-color: #404040;font-weight: 100;">Contract Details</h3>
              </div>
                
                <div class="form-padding form-group row">
                  <label for="reference-number" class="col-sm-3 col-form-label text-color">Reference Number</label>
                  <div class="col-sm-5">
                    <input type="text" name="reference_number" value="<%= noteId %>"
                    class="form-control" id="reference-number"  required readonly>
                  </div>
                </div>
                <div class="form-group row form-padding">
                  <label for="receiveddate" class="col-sm-3 col-form-label">Date Received</label>
                  <div class="col-sm-5">
                      <input type="date" name="received_date"
                      class="form-control" id="receiveddate"  required>
                  </div>
              </div>
                <div class="form-group row form-padding">
                  <label for="customer" class="col-sm-3 col-form-label">Customer Details</label>
                  <div class="col-sm-5">
                    <input type="text" name="client_name" value="<%= o.getClient_name() %>"
                    class="form-control" id="customer"  required readonly>
                  </div>
                </div>
               
                <div class="form-group row form-padding">
                    <label for="startdate" class="col-sm-1 col-form-label">Start Date</label>
                    <div class="col-sm-3">
                        <input type="date" name="start_date"
                        class="form-control" id="start-date"  required>
                    </div>
                    <label for="enddate" class="col-sm-1 col-form-label">End Date</label>
                    <div class="col-sm-3">
                        <input type="date" name="end_date"
                        class="form-control" id="end-date"  required>
                    </div>
                </div>
                <div class="form-group row form-padding">
                  <label for="ctype" class="col-sm-3 col-form-label">Contract Type</label>
                  <div class="col-sm-5">
                    <input type="text" name="contract_type"
                    class="form-control" id="customer" placeholder="Contract Type" required>
                  </div>
              </div>
              <div class="form-group row form-padding">
                  <label for="cvalue" class="col-sm-3 col-form-label">Contract Value</label>
                  <div class="col-sm-5">
                    <input type="text" name="contract_value"
                    class="form-control" id="customer" placeholder="Contract Value" required>
                  </div>
              </div>
              <div class="form-group row form-padding">
              <h3 class="col-sm-8"  style=" text-align: center; color: white; background-color: #404040 ;font-weight: 100;">Document Tracking</h3>
            </div>
            <div class="form-padding form-group row">
              <label for="doc-name" class="col-sm-3 col-form-label text-color">Document Name</label>
              <div class="col-sm-5">
                <input type="text" name="document_name"
                class="form-control" id="doc-name" placeholder="Document Name" >
              </div>
            </div>
                <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">Upload Document</label>
                    <div class="col-sm-5">
                        <input type="file" class="form-control" id="document" name="upload_document"  multiple>
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="status" class="col-sm-3 col-form-label">Submitted</label>
                    <div class="col-sm-5">
                    <label class="radio-inline">
                        <input type="radio" name="optradio" value="Pending">Pending
                      </label>
                        
                        
                      <label class="radio-inline" style="padding-left: 10%;" >
                        <input type="radio" name="optradio" value="Submitted" >Submitted
                      </label>
                      </div>  
                    
                </div>
                <div class="form-padding form-group row">
                  <label for="reason" class="col-sm-3 col-form-label text-color">Reason for pending</label>
                  <div class="col-sm-5">
                    <textarea class="form-control" name="reason"
                    id="reason" placeholder="If No then give reason" ></textarea>
                  </div>
                </div>
                <div class="form-padding form-group row">
                  <label for="Description" class="col-sm-3 col-form-label text-color">Description</label>
                  <div class="col-sm-5">
                    <textarea class="form-control" name="description"
                    id="Description" placeholder="Type here" ></textarea>
                  </div>
                </div>
                <div class="form-group row form-padding" style="margin-left:40%">
  
                    <button type="submit" class="btn btn-primary">Submit</button>
                    
                    </div>
              </form>
	
	
	</div>
</body>
</html>