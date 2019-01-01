<%@ page import="java.sql.Connection" %>
<%@ page import="java.beans.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: Orkhan ALIYEV
  Date: 12/31/2018
  Time: 1:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MULAKAT LISTELE</title>
</head>
<body>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "odev";
    String userid = "root";
    String password = "1234";

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    java.sql.Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("index.jsp");
    }
%>
<%
    String kullanici = (String) session.getAttribute("username");
%>
<table border=1>
    <thead>
    <tr>
        <th>Ogrenci numarasi</th>
        <th>Isim</th>
        <th>Soyisim</th>
        <th>Ogretim</th>
        <th>Mulakat Tarihi</th>
        <th>Mulakat Saati</th>
        <th>Komisyon uye 1</th>
        <th>Komisyon uye 2</th>
    </tr>

        <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select s.ogrenci_no, n.isim, n.soyisim, n.ogretim, s.mulakat_tarihi, s.mulakat_saati, s.komisyon_1, s.komisyon_2 from normal_ogrenci n , staj_mulakat s where s.ogrenci_no = n.ogrenci_no and kabul_edilen_gun is null;");
            while(resultSet.next()){
    %>

    <tr>
        <td><%=resultSet.getString("ogrenci_no") %></td>
        <td><%=resultSet.getString("isim") %></td>
        <td><%=resultSet.getString("soyisim") %></td>
        <td><%=resultSet.getString("ogretim") %></td>
        <td><%=resultSet.getString("mulakat_tarihi")%></td>
        <td><%=resultSet.getString("mulakat_saati")%></td>
        <td><%=resultSet.getString("komisyon_1")%></td>
        <td><%=resultSet.getString("komisyon_2")%></td>
    </tr>
        <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
        <%
        response.setContentType("application/vnd.ms-exel");
        response.setHeader("Content-Disposition", "inline; filename=mulakat-listele-excel.xls");
    %>
</table>
</body>
</html>
