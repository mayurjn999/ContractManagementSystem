package com.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="opportunities")
public class Opportunity 
{
	@Id
	private int reference_number;
	private String client_name;
	private String service_type;
	private Date due_date;
	@Column(length=100)
	private String doc;
	private String status;
	public int getReference_number() {
		return reference_number;
	}
	public void setReference_number(int reference_number) {
		this.reference_number = reference_number;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Opportunity(int reference_number, String client_name, String service_type, Date due_date, String doc,
			String status) {
		super();
		this.reference_number = reference_number;
		this.client_name = client_name;
		this.service_type = service_type;
		this.due_date = due_date;
		this.doc = doc;
		this.status = status;
	}
	public Opportunity()
	{
		super();
	}
	
	
}
