<%-- 
    Document   : delete
    Created on : Feb 21, 2022, 9:18:15 PM
    Author     : abc
--%>

<jsp:useBean id="GetSetBeans" class="beans.userdata" scope="session"/>
<jsp:useBean id="manageDBbeans" class="beans.managedb" scope="session"/>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    
    if(manageDBbeans.delete(id)>0)
    {
     response.sendRedirect("viewdata.jsp");
    }
%>