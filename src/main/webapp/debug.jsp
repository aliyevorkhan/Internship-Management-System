<%@page import="java.sql.*"%>
<html>
<form name="form" method="post" >
    <b>Select a country:</b>&nbsp;</td>
    <select name="sel"><option value=""><---Select---></option>
        <%
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String connectionURL = "jdbc:mysql://localhost:3306/odev";
            Connection connection= DriverManager.getConnection(connectionURL, "root", "1234");
            PreparedStatement psmnt = connection.prepareStatement("select * from konu");
            ResultSet results = psmnt.executeQuery();
            while(results.next()){
                String name = results.getString(1);
        %><option value="<%= name %>"><%=name%></option>
        <%} results.close(); psmnt.close(); %>
    </select><br>
</form>