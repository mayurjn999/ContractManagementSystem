<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.servlets.*"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Invoice</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
	Session s=FactoryProvider.getFactory().openSession();
	Invoice i=(Invoice)s.get(Invoice.class, noteId);
	s.close();
   %>
	<div class="container" style="margin-top: 20px;">
		<form action="UpdateInvoiceServlet" method="post">
              <div class="form-group row form-padding" style=" padding-top: 5px;">
                <h3 class="col-sm-8"  style=" text-align: center; color: white; background-color: #404040;font-weight: 100;">Invoice Details</h3>
              </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">Invoice_Id</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="document" name="invoice_id" value="<%= noteId %>" required readonly>
                    </div>
                </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">PO_Id</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="document" name="po_id" value="<%= i.getPo_id() %>" required readonly>
                    </div>
                </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label" >Upload Invoice (Optional)</label>
                    <div class="col-sm-5">
                        <input type="file" class="form-control" id="document" name="upload_invoice"  >
                    </div>
                </div>
                
                
                <div class="form-group row form-padding">
                    <label for="payeddate" class="col-sm-3 col-form-label">Payment received date (Optional)</label>
                    <div class="col-sm-5">
                        <input type="date" name="payment_received_date"
                        class="form-control" id="payeddate">
                    </div>
                </div> 
                                 
                <div class="form-group row form-padding" style="margin-left:40%">
  
                    <button type="submit" class="btn btn-primary">Submit</button>
                    
                    </div>
              </form>
	
	
	</div>
</body>
</html>