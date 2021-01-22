package com.servlets;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Contract;

import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateContractServlet
 */
public class UpdateContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateContractServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			int reference_number=Integer.parseInt(request.getParameter("reference_number"));
			String received_date1=request.getParameter("received_date");
			Date received_date;
			String client_name=request.getParameter("client_name");
			String start_date1=request.getParameter("start_date");
			Date start_date;
			String end_date1=request.getParameter("end_date");
			Date end_date;
			String contract_type=request.getParameter("contract_type");
			String contract_value=request.getParameter("contract_value");
			 
			 
			String document_name=request.getParameter("document_name");
			String doc1;
			String submit_status=request.getParameter("optradio");
			String reason=request.getParameter("reason");
			String reason1;
			String description=request.getParameter("description");
			String description1;
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Contract c=s.get(Contract.class, reference_number);
			if(start_date1.isEmpty()) {
				start_date=c.getStart_date();
			}
			else {
				start_date=new SimpleDateFormat("yyyy-MM-dd").parse(start_date1);
			}
			if(end_date1.isEmpty()) {
				end_date=c.getEnd_date();
			}
			else {
				end_date=new SimpleDateFormat("yyyy-MM-dd").parse(end_date1);
			}
			if(received_date1.isEmpty()) {
				received_date=c.getReceived_date();
			}
			else {
				received_date=new SimpleDateFormat("yyyy-MM-dd").parse(received_date1);
			}
			if(document_name.isEmpty()) {
				doc1=c.getDocument_name();
			}
			else {
				doc1=document_name;
			}
			if(reason.isEmpty()) {
				reason1=c.getReason();
			}
			else {
				reason1=reason;
			}
			if(description.isEmpty()) {
				description1=c.getDescription();
			}
			else {
				description1=description;
			}
			c.setClient_name(client_name);
			c.setReceived_date(received_date);
			c.setStart_date(start_date);
			c.setEnd_date(end_date);
			c.setContract_type(contract_type);
			c.setContract_value(contract_value);
			c.setDocument_name(doc1);
			c.setSubmit_status(submit_status);
			c.setReason(reason1);
			c.setDescription(description1);
			tx.commit();
			s.close();
			response.sendRedirect("all_contract.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
