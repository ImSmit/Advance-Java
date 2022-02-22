<%-- 
    Document   : updatedata
    Created on : Feb 21, 2022, 10:57:10 PM
    Author     : abc
--%>
<jsp:useBean id="GetSetBeans" class="beans.userdata" scope="session"/>
<jsp:useBean id="manageDBbeans" class="beans.managedb" scope="session"/>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    GetSetBeans.setName(request.getParameter("name"));
    GetSetBeans.setId(id);
    GetSetBeans.setAge(Integer.parseInt(request.getParameter("age")));
    
    
    if(manageDBbeans.update(GetSetBeans)>0)
    {
        response.sendRedirect("viewdata.jsp");
    }
%>