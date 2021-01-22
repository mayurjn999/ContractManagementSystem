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
	purchaseOrder p=(purchaseOrder)s.get(purchaseOrder.class, noteId);
	Date dateBefore = p.getPo_start_date();
	Date dateAfter = p.getPo_end_date();
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
    String min = dateFormat.format(dateBefore); 
    String max = dateFormat.format(dateAfter);
	s.close();
   %>
	<div class="container" style="margin-top: 20px;">
		<form action="SaveInvoiceServlet" method="post">
              <div class="form-group row form-padding" style=" padding-top: 5px;">
                <h3 class="col-sm-8"  style=" text-align: center; color: white; background-color: #404040;font-weight: 100;">Invoice Details</h3>
              </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">PO_Id</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="document" name="po_id" value="<%= noteId %>" required readonly>
                    </div>
                </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label" >Upload Invoice (Optional)</label>
                    <div class="col-sm-5">
                        <input type="file" class="form-control" id="document" name="upload_invoice"  >
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="type" class="col-sm-3 col-form-label">Invoice Type</label>
                    <div class="col-sm-5">
                    <label class="radio-inline">
                        <input type="radio" name="optradio" value="Advanced Invoice">Advanced Invoice
                      </label>
                                              
                      <label class="radio-inline" style="padding-left: 10%;" >
                        <input type="radio" name="optradio" value="Post Invoice" >Post Invoice
                      </label>
                      </div>  
                </div> 
                <div class="form-group row form-padding">
                    <label for="type" class="col-sm-3 col-form-label">Invoice Frequency</label>
                    <div class="col-sm-5">
                        <input list="frequency" name="invoice_frequency">
                      <datalist id="frequency">
                        <option value="Monthly" >
                        <option value="Quarterly">
                        <option value="Half-yearly">
                        <option value="Yearly">
                        
                      </datalist>
                    </div>
                  </div>              
                  <div class="form-padding form-group row">
                    <label for="terms" class="col-sm-3 col-form-label text-color">Payment terms</label>
                    <div class="col-sm-5">
                      <input type="text" name="payment_term"
                      class="form-control" id="terms" placeholder="Number of days" required>
                    </div>
                  </div>
                  <div class="form-group row form-padding">
                    <label for="invoicedate" class="col-sm-3 col-form-label">Invoice date</label>
                    <div class="col-sm-5">
                        <input type="date" name="invoice_date" min="<%= min %>" max="<%= max %>"
                        class="form-control" id="invoicedate"  required>
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="submissiondate" class="col-sm-3 col-form-label">Invoice submission date</label>
                    <div class="col-sm-5">
                        <input type="date" name="invoice_submission_date" min="<%= min %>" max="<%= max %>"
                        class="form-control" id="submissiondate"  required>
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="duedate" class="col-sm-3 col-form-label" hidden>Payment due date</label>
                    <div class="col-sm-5">
                        <input type="date" name="payment_due_date"
                        class="form-control" id="duedate"  disabled hidden>
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