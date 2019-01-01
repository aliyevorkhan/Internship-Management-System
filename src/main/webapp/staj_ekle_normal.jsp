<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Aliyev Orkhan
  Date: 12/12/2018
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<head>
    <title>Staj ekle normal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
    * {
        box-sizing: border-box;
    }
    input {
        width: 260px;
        height: 30px;
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
    select{
        border: 2px solid #ccc;
        border-radius: 4px;
        /*margin:4px;*/
        background: rgb(255, 255, 255);
        font-size: 16px;
        width: 260px;
        height: 100%;
        color:black;
        text-shadow:0 1px 0 rgba(0,0,0,0.4);
    }
    /*input:focus{
        width: 30%;
    }*/
    .button {
        background-color: #002147; /* Green */
        border: none;
        border-radius: 4px;
        color: white;
        padding: 8px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 4px 2px;
        cursor: pointer;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
    }

    fieldset{
        height: 16%;
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
        padding: 15px;
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
        height: 50%; /* only for demonstration, should be removed */
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
            height: 100%;
        }
    }

</style>
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
    <h2>NORMAL ÖĞRENCİ STAJI EKLEME</h2>
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
        <div>
            <form action="/normalStajEkle" method="post">
                <fieldset>
                    <input placeholder="Öğrenci numarası" type="text" tabindex="1" name="ogrenci_no" required autofocus>
                </fieldset>
                <fieldset>
                    <input placeholder="Isim" type="text" tabindex="2" name="isim" required>
                </fieldset>
                <fieldset>
                <input placeholder="Soyisim" type="text" tabindex="3" name="soyisim" required>
            </fieldset>
                <fieldset>
                <select name="ogretim" tabindex="4">
                    <option value="1">1. Ogretim</option>
                    <option value="2">2. Ogretim</option>
                </select>
            </fieldset>
                <fieldset>
                    <input placeholder="Kurum" type="text" tabindex="5" name="kurum" required>
                </fieldset>
                <fieldset>
                    <input placeholder="Şehir" type="text" tabindex="6" name="sehir" required>
                </fieldset>
                <fieldset>
                    <select name="konu" tabindex="7">
                            <option value=""><--------------KONU--------------></option>
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

                    </select>
                </fieldset>
                <fieldset>
                    <input placeholder="Toplam Gün" type="number" tabindex="8" min="15" max="60" name="toplam_staj_gunu" required>
                </fieldset>
                <fieldset>
                    <input placeholder="Sınıf" type="number" tabindex="9" name="sinif" min="2" required>
                </fieldset>
                <fieldset>
                    <input placeholder="Başlama Tarihi" type="date" tabindex="10" name="baslama_tarihi" required>
                </fieldset>
                <fieldset>
                    <input placeholder="Bitiş Tarihi" type="date" tabindex="11" name="bitis_tarihi" required>
                </fieldset>
                <fieldset>
                    <button class="button button2" name="staj_ekle_normal"  tabindex="12" type="submit" >EKLE</button>
                </fieldset>

            </form>
        </div>
    </article>
</section>

<footer>
    <p>FOOTER</p>
</footer>

</body>
</html>
