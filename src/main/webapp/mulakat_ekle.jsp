<%--
  Created by IntelliJ IDEA.
  User: Orkhan ALIYEV
  Date: 12/29/2018
  Time: 3:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Ogrenci" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mulakat.MulakatEkle" %>
<%@ page import="java.awt.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Ogrenci> ogrenciler = new MulakatEkle().mulakatEkle();
%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<html>
<head>
    <title>CSS Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }

        table {
            border-collapse: collapse;
            width: 85%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {background-color:#f5f5f5;}
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
    <h2>Mulakat Ekle</h2>
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
        <form action="/mulakatController" method="post">
            <table border=1>
                <thead>
                <tr>
                    <th>Ogrenci numarasi</th>
                    <th>Isim</th>
                    <th>Soyisim</th>
                    <th>Ogretim</th>
                    <th>Mulakat Tarihi</th>
                    <th>Mulakat Saati</th>
                    <th colspan=2>Komisyon uyeleri</th>
                </tr>
                </thead>
                <tbody>


                <%
                    for (Ogrenci ogrenci:ogrenciler) {
                %>
                <tr>
                    <td><%=ogrenci.getOgrenci_no()%></td>
                    <td><%=ogrenci.getIsim()%></td>
                    <td><%=ogrenci.getSoyisim()%></td>
                    <td><%=ogrenci.getOgretim()%></td>
                    <td><input type="date" name="mulakat_tarihi" tabindex="1"></td>
                    <td><input type="time" name="mulakat_saati" tabindex="2"></td>
                    <td><input type="text" name="komisyon_1" placeholder="komisyon uye 1" tabindex="3"></td>
                    <td><input type="text" name="komisyon_2" placeholder="komisyon uye 2" tabindex="4"></td>
                    <td><input type="submit"  class="button button2" value="EKLE" tabindex="5"></td>
                </tr>


                <%
                    }
                %>


                </tbody>
            </table>

            <script type="text/javascript">
                function mulakatSil(){
                    alert("ILGILI MULAKAT SILINDI!");
                }
                function mulakatListele() {
                    alert("MULAKATLAR INDIRILDI!");
                }
            </script>

        </form>

        <form action="/excel_mulakat_listele.jsp" method="post">
                <button onclick="mulakatListele()"  class="button button2" tabindex="6">MULAKAT LISTELE</button>
        </form>
        <form action="/mulakatSil" method="post">
            <input type="text" tabindex="7" name="ogrenci_no" placeholder="Ogrenci Numarasi">
            <button onclick="mulakatSil()" class="button button2" tabindex="8">MULAKAT SIL</button>
        </form>

    </article>


</section>

<footer>
    <p>FOOTER</p>
</footer>





</body>
</html>
