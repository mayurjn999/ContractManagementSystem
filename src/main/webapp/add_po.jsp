<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.servlets.*"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*" %>
<%@ page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Purchase Order</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
	Session s=FactoryProvider.getFactory().openSession();
	Contract c=(Contract)s.get(Contract.class, noteId);
	Date dateBefore = c.getStart_date();
	Date dateAfter = c.getEnd_date();
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
    String min = dateFormat.format(dateBefore); 
    String max = dateFormat.format(dateAfter);
	s.close();
   %>
	<div class="container" style="margin-top: 20px;">
		<form action="SavePoServlet" method="post"> 
              <div class="form-group row form-padding" style=" padding-top: 5px;">
                <h3 class="col-sm-8"  style=" text-align: center; color: white; background-color: #404040;font-weight: 100;">PO Details</h3>
              </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">Reference Number</label>
                    <div class="col-sm-5">
                        <input type="text" name="reference_number" value="<%= noteId %>"
                        class="form-control" id="document"  required readonly >
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label">PO_ID</label>
                    <div class="col-sm-5">
                        <input type="text" name="po_id"
                        class="form-control" id="document"  >
                    </div>
                </div>
              <div class="form-group row form-padding">
                    <label for="doc" class="col-sm-3 col-form-label" hidden>Upload PO</label>
                    <div class="col-sm-5">
                        <input type="file" name="upload_po"
                        class="form-control" id="document" hidden >
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="postartdate" class="col-sm-3 col-form-label">PO Start Date</label>
                    <div class="col-sm-5">
                        <input type="date" 
                        class="form-control" id="postartdate" name="start_date" min="<%= min %>" max="<%= max %>" required>
                    </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="polastdate" class="col-sm-3 col-form-label">PO End Date</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="poenddate" name="end_date" min="<%= min %>" max="<%= max %>" required>
                    </div>
                </div>
                <div class="form-padding form-group row">
                  <label for="povalue" class="col-sm-3 col-form-label text-color">PO Value</label>
                  <div class="col-sm-5">
                    <input type="text" name="po_value"
                    class="form-control" id="povalue" placeholder="Enter po value" required>
                  </div>
                </div><div class="form-padding form-group row">
                  <label for="contractperiod" class="col-sm-3 col-form-label text-color" hidden>Contract Period</label>
                  <div class="col-sm-5">
                    <input type="text" name="contract_period" value="From : <%=min%> To : <%=max %>"
                    class="form-control" id="contractperiod" placeholder="Enter contract period" required readonly hidden>
                  </div>
                </div>
                <div class="form-group row form-padding">
                    <label for="potype" class="col-sm-3 col-form-label">Type of PO</label>
                    <div class="col-sm-5">
                    <label class="radio-inline">
                        <input type="radio" name="optradio" value="Full" >Full
                      </label>
                                              
                      <label class="radio-inline" style="padding-left: 10%;" >
                        <input type="radio" name="optradio"  value="Part">Part
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