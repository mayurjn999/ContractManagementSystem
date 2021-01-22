package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveLoginServlet
 */
public class SaveLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{  
			
			String uname=request.getParameter("uname");
			String password=request.getParameter("password");
			if(uname.equals("fss") && password.equals("admin")) 
			{
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				RequestDispatcher rd=request.getRequestDispatcher("all_opportunity.jsp");  
		        rd.forward(request,response);  
				//out.println("<h1 style='text-align:center;'>Login successfully</h1>");
				//out.println("<h1 style='text-align:center;'><a href='all_opportunity.jsp'>Start Here</h1>");
			  
			}
			else
			{
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
		        rd.forward(request,response);  
				//out.print("<h1 style='text-align:center;'>Login unsuccessfully</h1>");  
				//out.println("<h1 style='text-align:center;'><a href='index.jsp'>Retry</h1>");  
			}
		}catch(Exception e)
		{
			
		}
	}

}
