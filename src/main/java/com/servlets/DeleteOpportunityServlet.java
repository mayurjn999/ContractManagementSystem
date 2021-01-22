package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Opportunity;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteOpportunityServlet
 */
public class DeleteOpportunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOpportunityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Opportunity note=(Opportunity)s.get(Opportunity.class, noteId);
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_opportunity.jsp");
		}
		catch(Exception e)
		{
			
		}
	}

	
	

}
