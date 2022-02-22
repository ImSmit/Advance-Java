<%-- 
    Document   : update
    Created on : Feb 21, 2022, 10:42:45 PM
    Author     : abc
--%>

<%@page import="beans.userdata"%>
<jsp:useBean id="GetSetBeans" class="beans.userdata" scope="session"/>
<jsp:useBean id="manageDBbeans" class="beans.managedb" scope="session"/>

<%
    userdata ud = new userdata();
    int id = Integer.parseInt(request.getParameter("id"));
    ud = manageDBbeans.fetchdatabyid(id);
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="updatedata.jsp">
            <table border="1" style="text-align: center">
            <tr>
                <td colspan="2"><h1><%= ud.getId()  %></h1><input type="hidden" name="id" value="<%= ud.getId()  %>"/> Update Page </td>     
            </tr>
            <tr>
                <td> Name : </td>
                <td><input type="text" name="name" value="<%= ud.getName()%>"></td>
            </tr>
            <tr>
                <td> Age : </td>
                <td><input type="text" name="age" value="<%= ud.getAge()%>"/></td>
            </tr>
            <tr>
                <td colspan="2"> <button type="submit"> Update Data</button> </td>
            </tr>
        </table>
        </form>
    </body>
</html>
