<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.servlets.*"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Opportunity</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
        h3 span {
            font-size: 35px;
        }
        h3 input.search-input {
            width: 300px;
            margin-right: 30px;;
            float: right
        }
        .mt32 {
            margin-top: 32px;
        }
    </style>
<%@include file="all_css_jsp.jsp" %>
</head>
<body >
	<%@include file="navbar.jsp" %>
	<div align="center" style="width:100%" >
	<h3 class="mt32">
	<span>List of Opportunities</span>
	<input type="search" placeholder="Search..." class="form-control search-input" data-table="customers-list"/>
	</h3>
        <table style="width:100%" class="table table-striped mt32 customers-list">
            
            <tr>
            <th></th>
                <th>Ref. ID</th>
                <th>Client</th>
                <th>Document Name</th>
                <th>Due date</th>
                <th>Service type</th>  
                <th>Status</th>
                <th></th>
            </tr>
            <%
   	Session s=FactoryProvider.getFactory().openSession();
   	Query q=s.createSQLQuery("select * from opportunities order by status,reference_number");
   	List<Object[]> list=q.list();
   	for(Object[] note:list)
   	{
   		%>
                <tr>
                <td></td>
                    <td><b><%= note[0] %></b></td>
                    <td><%= note[1] %></td>
                    <td> <%= note[2] %></td>
                    <td><%= note[3] %></td>
                    <td><%= note[4] %></td>
                    <td><%= note[5] %></td>
                    <% int id1=((Integer)note[0]).intValue(); %>
                    <td><% if(note[5].toString().equals("Won")){ %>
                    <a href="add_contract.jsp?note_id=<%= id1 %>"><button class="button0">Add Contract</button></a>&nbsp;<%} %>
                    <a href="edit_opportunity.jsp?note_id=<%= id1 %>"><button class="button1">Update</button></a>&nbsp;
                    <a href="DeleteOpportunityServlet?note_id=<%= id1 %>"><button class="button2">Delete</button></a>
                    </td>
                </tr>
              <% 
   		
   	}
   	
   	s.close();
   	
   	%>  
            
        </table>
        </div>
        <script>
        (function(document) {
            'use strict';

            var TableFilter = (function(myArray) {
                var search_input;

                function _onInputSearch(e) {
                    search_input = e.target;
                    var tables = document.getElementsByClassName(search_input.getAttribute('data-table'));
                    myArray.forEach.call(tables, function(table) {
                        myArray.forEach.call(table.tBodies, function(tbody) {
                            myArray.forEach.call(tbody.rows, function(row) {
                                var text_content = row.textContent.toLowerCase();
                                var search_val = search_input.value.toLowerCase();
                                row.style.display = text_content.indexOf(search_val) > -1 ? '' : 'none';
                            });
                        });
                    });
                }

                return {
                    init: function() {
                        var inputs = document.getElementsByClassName('search-input');
                        myArray.forEach.call(inputs, function(input) {
                            input.oninput = _onInputSearch;
                        });
                    }
                };
            })(Array.prototype);

            document.addEventListener('readystatechange', function() {
                if (document.readyState === 'complete') {
                    TableFilter.init();
                }
            });

        })(document);
    </script>
</body>
</html>