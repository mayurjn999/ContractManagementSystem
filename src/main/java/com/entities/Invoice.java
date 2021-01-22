package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Invoice")
public class Invoice 
{
	@Id
	private int invoice_id;
	private String upload_invoice;
	private String invoice_type;
	private String invoice_frequency;
	private String payment_term;
	private Date invoice_date;
	private Date invoice_submission_date;
	private Date payment_due_date;
	private Date payment_received_date;
	private int po_id;
	
	
	
	public int getPo_id() {
		return po_id;
	}
	public void setPo_id(int po_id) {
		this.po_id = po_id;
	}
	public String getUpload_invoice() {
		return upload_invoice;
	}
	public void setUpload_invoice(String upload_invoice) {
		this.upload_invoice = upload_invoice;
	}
	public String getInvoice_type() {
		return invoice_type;
	}
	public void setInvoice_type(String invoice_type) {
		this.invoice_type = invoice_type;
	}
	public String getInvoice_frequency() {
		return invoice_frequency;
	}
	public void setInvoice_frequency(String invoice_frequency) {
		this.invoice_frequency = invoice_frequency;
	}
	public String getPayment_term() {
		return payment_term;
	}
	public void setPayment_term(String payment_term) {
		this.payment_term = payment_term;
	}
	public Date getInvoice_date() {
		return invoice_date;
	}
	public void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
	}
	public Date getInvoice_submission_date() {
		return invoice_submission_date;
	}
	public void setInvoice_submission_date(Date invoice_submission_date) {
		this.invoice_submission_date = invoice_submission_date;
	}
	public Date getPayment_due_date() {
		return payment_due_date;
	}
	public void setPayment_due_date(Date payment_due_date) {
		this.payment_due_date = payment_due_date;
	}
	public Date getPayment_received_date() {
		return payment_received_date;
	}
	public void setPayment_received_date(Date payment_received_date) {
		this.payment_received_date = payment_received_date;
	}
	public int getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(int invoice_id) {
		this.invoice_id = invoice_id;
	}
	
	public Invoice(String upload_invoice, String invoice_type, String invoice_frequency, String payment_term,
			Date invoice_date, Date invoice_submission_date, Date payment_due_date, Date payment_received_date,int po_id) {
		super();
		this.invoice_id=new Random().nextInt(10000);
		this.upload_invoice = upload_invoice;
		this.invoice_type = invoice_type;
		this.invoice_frequency = invoice_frequency;
		this.payment_term = payment_term;
		this.invoice_date = invoice_date;
		this.invoice_submission_date = invoice_submission_date;
		this.payment_due_date = payment_due_date;
		this.payment_received_date = payment_received_date;
		this.po_id = po_id;
	}
	
	public Invoice()
	{
		super();
	}

}
