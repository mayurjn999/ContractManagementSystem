package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Invoice;

import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveInvoiceServlet
 */
public class SaveInvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveInvoiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			
			int po_id=Integer.parseInt(request.getParameter("po_id"));
			String upload_invoice=request.getParameter("upload_invoice");
			
			String invoice_type=request.getParameter("optradio");
			String invoice_frequency=request.getParameter("invoice_frequency");
			String payment_term=request.getParameter("payment_term");
			int pt1=Integer.parseInt(payment_term);
			String invoice_date1=request.getParameter("invoice_date");
			Date invoice_date=new SimpleDateFormat("yyyy-MM-dd").parse(invoice_date1);
			String invoice_submission_date1=request.getParameter("invoice_submission_date");
			Date invoice_submission_date=new SimpleDateFormat("yyyy-MM-dd").parse(invoice_submission_date1);
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			try{
				   //Setting the date to the given date
				   c.setTime(invoice_submission_date);
				}catch(Exception e){
					e.printStackTrace();
				 }
			c.add(Calendar.DAY_OF_MONTH, pt1 );  
			
			String payment_due_date1 = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
			
			//String payment_due_date1=request.getParameter("payment_due_date");
			
			Date payment_due_date=new SimpleDateFormat("yyyy-MM-dd").parse(payment_due_date1);
			String payment_received_date1=request.getParameter("payment_received_date");
			if(payment_received_date1.isEmpty()) {
				payment_received_date1="0001-01-01";
			}
			
			 Date payment_received_date=new SimpleDateFormat("yyyy-MM-dd").parse(payment_received_date1);
			
			Invoice i=new Invoice(upload_invoice,invoice_type,invoice_frequency,payment_term,invoice_date,invoice_submission_date,payment_due_date,payment_received_date,po_id);
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(i);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>Invoice added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_invoice.jsp'>View all Invoice</h1>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
