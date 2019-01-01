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
    <title>Report Yil</title>
</head>
<body>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "odev";
    String userid = "root";
    String password = "1234";
    String yil= (String) session.getAttribute("yil");

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
        <th>Kurum</th>
        <th>Toplam Gun</th>
        <th>Kabul edilen gun</th>
    </tr>
        <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement = connection.createStatement();
            String sql ="select s.ogrenci_no, n.isim, n.soyisim, s.kurum, s.toplam_gun, s.kabul_edilen_gun from normal_ogrenci n , staj_mulakat s where s.ogrenci_no = n.ogrenci_no and mulakat_tarihi between "+"'"+yil+"-01-01" + "'" + " and "+"'" + yil + "-12-31"+"'"+";";
            resultSet = statement.executeQuery(sql);
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
        <td><%=resultSet.getString("kurum") %></td>
        <td><%=resultSet.getInt("toplam_gun") %></td>
        <td><%=resultSet.getInt("kabul_edilen_gun") %></td>
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
