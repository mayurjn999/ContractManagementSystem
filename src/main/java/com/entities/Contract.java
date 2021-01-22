package com.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contracts")
public class Contract 
{
	@Id
	private int reference_number;
	private Date received_date;
	private String client_name;
	private Date start_date;
	private Date end_date;
	private String contract_type;
	private String contract_value;
	private String document_name;
	private String submit_status;
	@Column(length=500)
	private String reason;
	@Column(length=500)
	private String description;
	public int getReference_number() {
		return reference_number;
	}
	public void setReference_number(int reference_number) {
		this.reference_number = reference_number;
	}
	public Date getReceived_date() {
		return received_date;
	}
	public void setReceived_date(Date received_date) {
		this.received_date = received_date;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getContract_type() {
		return contract_type;
	}
	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}
	public String getContract_value() {
		return contract_value;
	}
	public void setContract_value(String contract_value) {
		this.contract_value = contract_value;
	}
	public String getDocument_name() {
		return document_name;
	}
	public void setDocument_name(String document_name) {
		this.document_name = document_name;
	}
	public String getSubmit_status() {
		return submit_status;
	}
	public void setSubmit_status(String submit_status) {
		this.submit_status = submit_status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Contract(int reference_number, Date received_date, String client_name, Date start_date, Date end_date,
			String contract_type, String contract_value, String document_name, String submit_status, String reason,
			String description) {
		super();
		this.reference_number = reference_number;
		this.received_date = received_date;
		this.client_name = client_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.contract_type = contract_type;
		this.contract_value = contract_value;
		this.document_name = document_name;
		this.submit_status = submit_status;
		this.reason = reason;
		this.description = description;
	}
	public Contract()
	{
		super();
		
	}
	
}
