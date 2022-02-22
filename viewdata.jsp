<%-- 
    Document   : viewdata
    Created on : Feb 21, 2022, 8:45:45 PM
    Author     : abc
--%>

<%@page import="beans.userdata"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="GetSetBeans" class="beans.userdata" scope="session"/>
<jsp:useBean id="manageDBbeans" class="beans.managedb" scope="session"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Data</title>
    </head>
    <body>
       <table border="1" style="text-align: center">
            <tr>
                <td colspan="7"> View Page </td>     
            </tr>
            <tr>
                <th> Id : </th>
                 <th> Name : </th>
                  <th> Age : </th>
                <th> Delete : </th>
                <th> Edit : </th>
            </tr>
             <%
                 ArrayList<userdata> alldata = new ArrayList<userdata>();
                 alldata = manageDBbeans.fetchdata();
                 for(userdata ud:alldata)
                 {            
            %>
            <tr>
                <td><%= ud.getId()  %></td>
                <td><%= ud.getName()  %></td>
                <td><%= ud.getAge() %></td>
                <td><a href="delete.jsp?id=<%= ud.getId()  %>">Delete</a> </td>
                <td><input type="hidden" name="id" value="<%= ud.getId()  %>"/><a href="update.jsp?id=<%= ud.getId()  %>">Edit</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
