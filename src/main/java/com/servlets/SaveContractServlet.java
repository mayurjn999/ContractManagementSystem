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

import com.entities.Contract;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveContractServlet
 */
public class SaveContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveContractServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			int reference_number=Integer.parseInt(request.getParameter("reference_number"));
			String received_date1=request.getParameter("received_date");
			Date received_date=new SimpleDateFormat("yyyy-MM-dd").parse(received_date1);
			String client_name=request.getParameter("client_name");
			String start_date1=request.getParameter("start_date");
			Date start_date=new SimpleDateFormat("yyyy-MM-dd").parse(start_date1);
			String end_date1=request.getParameter("end_date");
			Date end_date=new SimpleDateFormat("yyyy-MM-dd").parse(end_date1);
			String contract_type=request.getParameter("contract_type");
			String contract_value=request.getParameter("contract_value");
			 
			 
			String document_name=request.getParameter("document_name");
			String submit_status=request.getParameter("optradio");
			String reason=request.getParameter("reason");
			String description=request.getParameter("description");
			if(end_date.compareTo(start_date) > 0) {
			Contract c=new Contract(reference_number,received_date,client_name,start_date,end_date,contract_type,contract_value,document_name,submit_status,reason,description);
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(c);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>Contract added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_contract.jsp'>View all Contracts</h1>");
			}
			else {
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>Contract  not added successfully</h1>");
				out.println("<h3 style='text-align:center;'>End Date should be greater than Start Date</h3>");
				out.println("<h1 style='text-align:center;'><a href='add_contract.jsp?note_id="+reference_number +"'>Retry</h1>");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
