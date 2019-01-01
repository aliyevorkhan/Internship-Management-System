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
    <title>Report Biten</title>
</head>
<body>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "odev";
    String userid = "root";
    String password = "1234";

    int min_kabul_edilen_gun= (int) session.getAttribute("min_kabul_edilen_gun");

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
        <th>Toplam Gun</th>
    </tr>
        <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select ogrenci_no, isim, soyisim, ogretim, toplam_staj_gunu from normal_ogrenci where toplam_staj_gunu>=" +min_kabul_edilen_gun +";");
            while(resultSet.next()){
    %>
        <%
        response.setContentType("application/vnd.ms-exel");
        response.setHeader("Content-Disposition", "inline; filename=yil-excel.xls");
    %>
    <tr>
        <td><%=resultSet.getString("ogrenci_no") %></td>
        <td><%=resultSet.getString("isim") %></td>
        <td><%=resultSet.getString("soyisim") %></td>
        <td><%=resultSet.getString("ogretim") %></td>
        <td><%=resultSet.getInt("toplam_staj_gunu") %></td>
    </tr>
        <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
