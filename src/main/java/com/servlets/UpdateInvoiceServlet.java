package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.entities.Opportunity;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateInvoiceServlet
 */
public class UpdateInvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateInvoiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			int note_id=Integer.parseInt(request.getParameter("invoice_id"));
			int po_id=Integer.parseInt(request.getParameter("po_id"));
			String upload_invoice=request.getParameter("upload_invoice");
			String upload_invoice1;
			//String invoice_type=request.getParameter("optradio");
			//String invoice_type1;
			//String invoice_frequency=request.getParameter("invoice_frequency");
			//String invoice_frequency1;
			//String payment_term=request.getParameter("payment_term");
			//int pt1=Integer.parseInt(payment_term);
			//String invoice_date1=request.getParameter("invoice_date");
			//Date invoice_date=new SimpleDateFormat("yyyy-MM-dd").parse(invoice_date1);
			//String invoice_submission_date1=request.getParameter("invoice_submission_date");
			//Date invoice_submission_date=new SimpleDateFormat("yyyy-MM-dd").parse(invoice_submission_date1);
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//Date invoice_date2;
			//Calendar c = Calendar.getInstance();
			/*try{
				   //Setting the date to the given date
				   c.setTime(invoice_submission_date);
				}catch(Exception e){
					e.printStackTrace();
				 }
			c.add(Calendar.DAY_OF_MONTH, pt1 );  
			
			String payment_due_date1 = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
			
			//String payment_due_date1=request.getParameter("payment_due_date");
			
			Date payment_due_date=new SimpleDateFormat("yyyy-MM-dd").parse(payment_due_date1);
			*/
			String payment_received_date1=request.getParameter("payment_received_date");
			if(payment_received_date1.isEmpty()) {
				payment_received_date1="0001-01-01";
			}
			
			 Date payment_received_date=new SimpleDateFormat("yyyy-MM-dd").parse(payment_received_date1);
			
			//Invoice i=new Invoice(upload_invoice,invoice_type,invoice_frequency,payment_term,invoice_date,invoice_submission_date,payment_due_date,payment_received_date,po_id);
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Invoice i=s.get(Invoice.class,note_id);
			if(upload_invoice.isEmpty()) {
				upload_invoice1=i.getUpload_invoice();
			}
			else {
				upload_invoice1=upload_invoice;
			}
			i.setUpload_invoice(upload_invoice1);
			/*if(invoice_type.isEmpty())
			{
				invoice_type1=i.getInvoice_type();
			}
			else {
				invoice_type1=invoice_type;
			}
			i.setInvoice_type(invoice_type1);
			if(invoice_frequency.isEmpty())
			{
				invoice_frequency1=i.getInvoice_frequency();
			}
			else {
				invoice_frequency1=invoice_frequency;
			}
			i.setInvoice_frequency(invoice_frequency1);
			i.setPayment_term(payment_term);
			if(invoice_date1.isEmpty())
			{
				invoice_date2=i.getInvoice_date();
			}
			
			else {
				invoice_date2=invoice_date;
			}
			i.setInvoice_date(invoice_date2);
			if(!invoice_submission_date1.isEmpty())
			{
				i.setInvoice_submission_date(invoice_submission_date);
			}
			i.setPayment_due_date(payment_due_date);
			*/
			
		 i.setPayment_received_date(payment_received_date);
			
			tx.commit();
			s.close();
			response.sendRedirect("all_invoice.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
