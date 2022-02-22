<%-- 
    Document   : insertdata
    Created on : Feb 21, 2022, 8:36:56 PM
    Author     : abc
--%>

<jsp:useBean id="GetSetBeans" class="beans.userdata" scope="session"/>
<jsp:useBean id="manageDBbeans" class="beans.managedb" scope="session"/>

<%
    GetSetBeans.setName(request.getParameter("name"));
    GetSetBeans.setAge(Integer.parseInt(request.getParameter("age")));
    
    if(manageDBbeans.insert(GetSetBeans)>0)
    {
        response.sendRedirect("viewdata.jsp");
    }
%>