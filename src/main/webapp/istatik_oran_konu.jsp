<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Aliyev Orkhan
  Date: 12/12/2018
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<html>
<head>
    <title>istatik oran konu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }
        table {
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {background-color:#f5f5f5;}
        input {
            width: 130px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            background-position: 10px 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
            -webkit-transition: width 0.4s ease-in-out; /*safari icin*/
            transition: width 0.4s ease-in-out;
        }

        .button {
            background-color: #002147; /* Green */
            border: none;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 4px 2px;
            cursor: pointer;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
        }

        .button2:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        }
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Style the header */
        header {
            background-color: #002147;
            padding: 5px;
            text-align: center;
            font-size: 15px;
            color: white;
        }

        /* Create two columns/boxes that floats next to each other */
        nav {
            float: left;
            width: 15%;
            height: 100%; /* only for demonstration, should be removed */
            background: #222;
            padding: 20px;
            color: white;
        }

        /* Style the list inside the menu */
        nav ul {
            list-style-type: none;
            padding: 0;
        }

        article {
            float: left;
            padding: 20px;
            width: 85%;
            background-color: white;
            height: 100%; /* only for demonstration, should be removed */
        }

        /* Clear floats after the columns */
        section:after {
            content: "";
            display: table;
            clear: both;

        }

        /* Style the footer */
        footer {
            background-color: #002147;
            padding: 10px;
            text-align: center;
            color: white;
        }

        /* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
        @media (max-width: 600px) {
            nav, article {
                width: 100%;
                height: auto;
            }
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("index.jsp");
    }
%>
<%
    String kullanici = (String) session.getAttribute("username");
%>

<header>
    <h2>KONU DAĞILIMI</h2>
</header>

<section>
    <nav>
        <ul>
            <a href="home.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Ana Sayfa</a>
            <a href="staj_goruntule.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Staj görüntüle</a>
            <br>
            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button">Staj Ekle<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="staj_ekle_dgs.jsp" class="w3-bar-item w3-button">DGS ve Yatay gecişli</a>
                    <a href="staj_ekle_normal.jsp" class="w3-bar-item w3-button">Normal</a>
                </div>
            </div>

            <br>

            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button">Mulakat<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="mulakat_ekle.jsp" class="w3-bar-item w3-button">Mulakat Ekle</a>
                    <a href="mulakat_sonuc_ekle.jsp" class="w3-bar-item w3-button">Sonuç ekle</a>
                    <a href="mulakat_sonuc_goruntule.html" class="w3-bar-item w3-button">Sonuç görüntüle</a>

                </div>
            </div>

            <br>

            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button">Istatiksel Oran<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="istatik_oran_il.jsp" class="w3-bar-item w3-button">İl bazında başarı</a>
                    <a href="istatik_oran_konu.jsp" class="w3-bar-item w3-button">Konu dağılımı ve başarı</a>
                </div>
            </div>

            <br>
            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button" >Ayarlar<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="ayar_kom_tanimla.jsp" class="w3-bar-item w3-button">Komisyon tanımla</a>
                    <a href="ayar_kisitlama.jsp" class="w3-bar-item w3-button">Kısıtlama ayarları</a>
                </div>
            </div>



        </ul>
    </nav>
    <article>
        <h2>KONU BAŞLIKLARINA GÖRE KONU DAĞILIMI</h2>
        <table border=1>
            <thead>
            <tr>
                <th>Konu</th>
                <th>Başarı oranı</th>
            </tr>
                <%
            try{
                connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                statement=connection.createStatement();
                String sql ="select konu , (sum(kabul_edilen_gun)/sum(toplam_gun))*100 as basari_orani  from staj_mulakat group by konu;";
                resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
        %>

            <tr>
                <td><%=resultSet.getString("konu") %></td>
                <td><%=resultSet.getString("basari_orani") %></td>
            </tr>
                <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </table>


    </article>
</section>

<footer>
    <p>FOOTER</p>
</footer>

</body>
</html>
