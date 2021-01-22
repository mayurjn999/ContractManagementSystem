package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="purchaseOrders")
public class purchaseOrder {
	@Id
	private int po_id;
	private String upload_po;
	private Date po_start_date;
	private Date po_end_date;
	private String po_value;
	private String contract_period;
	private String po_type;
	private int reference_number;
	
	public int getReference_number() {
		return reference_number;
	}
	public void setReference_number(int reference_number) {
		this.reference_number = reference_number;
	}
	public int getPo_id() {
		return po_id;
	}
	public void setPo_id(int po_id) {
		this.po_id = po_id;
	}
	public String getUpload_po() {
		return upload_po;
	}
	public void setUpload_po(String upload_po) {
		this.upload_po = upload_po;
	}
	public Date getPo_start_date() {
		return po_start_date;
	}
	public void setPo_start_date(Date po_start_date) {
		this.po_start_date = po_start_date;
	}
	public Date getPo_end_date() {
		return po_end_date;
	}
	public void setPo_end_date(Date po_end_date) {
		this.po_end_date = po_end_date;
	}
	public String getPo_value() {
		return po_value;
	}
	public void setPo_value(String po_value) {
		this.po_value = po_value;
	}
	public String getContract_period() {
		return contract_period;
	}
	public void setContract_period(String contract_period) {
		this.contract_period = contract_period;
	}
	public String getPo_type() {
		return po_type;
	}
	public void setPo_type(String po_type) {
		this.po_type = po_type;
	}
	public purchaseOrder(int po_id,String upload_po, Date po_start_date, Date po_end_date, String po_value,
			String contract_period, String po_type,int reference_number) {
		super();
		this.po_id=po_id;
		this.upload_po = upload_po;
		this.po_start_date = po_start_date;
		this.po_end_date = po_end_date;
		this.po_value = po_value;
		this.contract_period = contract_period;
		this.po_type = po_type;
		this.reference_number= reference_number;
	}
	public purchaseOrder() {
		super();
	}
	
	
	
	
}
