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

import com.entities.Opportunity;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateOpportunityServlet
 */
public class UpdateOpportunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOpportunityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{
			int reference_number=Integer.parseInt(request.getParameter("reference_number"));
			String client_name=request.getParameter("client_name");
			String service_type=request.getParameter("service_type");
			String due_date1=request.getParameter("due_date");
			
			//Date due_date=new SimpleDateFormat("yyyy-MM-dd").parse(due_date1);
			//System.out.println(due_date1);
			Date due_date;
			 
			String doc=request.getParameter("doc");
			String doc1;
			String status=request.getParameter("optradio");
			//Opportunity o=new Opportunity(reference_number,client_name,service_type,due_date,doc,status);
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Opportunity note=s.get(Opportunity.class, reference_number);
			if(due_date1.isEmpty()) {
				due_date=note.getDue_date();
			}
			else {
				due_date=new SimpleDateFormat("yyyy-MM-dd").parse(due_date1);
			}
			if(doc.isEmpty()) {
				doc1=note.getDoc();
			}
			else {
				doc1=doc;
			}
			note.setClient_name(client_name);
			note.setService_type(service_type);
			note.setDue_date(due_date);
			note.setDoc(doc1);
			note.setStatus(status);
			tx.commit();
			s.close();
			response.sendRedirect("all_opportunity.jsp");
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
