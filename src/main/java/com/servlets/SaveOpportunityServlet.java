package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class SaveOpportunityServlet
 */
public class SaveOpportunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaveOpportunityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			int reference_number=Integer.parseInt(request.getParameter("reference_number"));
			String client_name=request.getParameter("client_name");
			String service_type=request.getParameter("service_type");
			String due_date1=request.getParameter("due_date");
			Date due_date=new SimpleDateFormat("yyyy-MM-dd").parse(due_date1);
			//System.out.println(due_date1);
			 
			 
			String doc=request.getParameter("doc");
			String status=request.getParameter("optradio");
			Opportunity o=new Opportunity(reference_number,client_name,service_type,due_date,doc,status);
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(o);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>Opportunity added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_opportunity.jsp'>View all Opportunity</h1>");
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
