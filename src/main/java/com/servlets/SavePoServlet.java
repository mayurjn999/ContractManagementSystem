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


import com.entities.purchaseOrder;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SavePoServlet
 */
public class SavePoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SavePoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			
			int reference_number=Integer.parseInt(request.getParameter("reference_number"));
			String upload_po=request.getParameter("upload_po");
			int po_id=Integer.parseInt(request.getParameter("po_id"));
			String start_date1=request.getParameter("start_date");
			Date start_date=new SimpleDateFormat("yyyy-MM-dd").parse(start_date1);
			String end_date1=request.getParameter("end_date");
			Date end_date=new SimpleDateFormat("yyyy-MM-dd").parse(end_date1);
			String po_value=request.getParameter("po_value");
			String contract_period=request.getParameter("contract_period");
			String po_type=request.getParameter("optradio");
			if(end_date.compareTo(start_date) > 0) {
			purchaseOrder po=new purchaseOrder(po_id,upload_po,start_date,end_date,po_value,contract_period,po_type,reference_number);
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(po);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>PO added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_po.jsp'>View all PO</h1>");
			}
			else {
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>PO  not added successfully</h1>");
				out.println("<h3 style='text-align:center;'>End Date should be greater than Start Date</h3>");
				out.println("<h1 style='text-align:center;'><a href='add_po.jsp?note_id="+reference_number +"'>Retry</h1>");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
