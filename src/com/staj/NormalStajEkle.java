package com.staj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import static java.lang.Integer.parseInt;


public class NormalStajEkle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ogrenci_no = request.getParameter("ogrenci_no");
        String isim = request.getParameter("isim");
        String soyisim = request.getParameter("soyisim");
        String sehir = request.getParameter("sehir");
        String kurum = request.getParameter("kurum");
        String konu = request.getParameter("konu");
        String sinif = request.getParameter("sinif");
        String ogretim = request.getParameter("ogretim");
        int toplam_staj_gunu = parseInt(request.getParameter("toplam_staj_gunu"));
        String baslama_tarihi = request.getParameter("baslama_tarihi");
        String bitis_tarihi = request.getParameter("bitis_tarihi");
        boolean staj_degerlendirildi_mi = false;

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            if (sinif.equals("2") && toplam_staj_gunu >25){
                System.out.println("ERROR--SINIF 2 TOPLAM GUN 25DEN FAZLA");
            }
            else if (konu != "ARGE" && toplam_staj_gunu > 40){
                System.out.println("ERROR--KONU ARGE DEGIL TOPLAM GUN 40-DAN FAZLA");
            }
            else {
                PreparedStatement ps0 = c.prepareStatement("insert into ogrenci(ogrenci_no) values (?)");
                ps0.setString(1,ogrenci_no);
                ps0.executeUpdate();

                PreparedStatement ps1 = c.prepareStatement("insert into normal_ogrenci(ogrenci_no, isim, soyisim, ogretim) values (?,?,?,?)");
                ps1.setString(1,ogrenci_no);
                ps1.setString(2,isim);
                ps1.setString(3,soyisim);
                ps1.setString(4,ogretim);

                ps1.executeUpdate();


                PreparedStatement ps2 = c.prepareStatement("insert into staj_mulakat(ogrenci_no, baslama_tarihi, kurum, sehir, bitis_tarihi, toplam_gun, sinif_bilgisi,konu, staj_degerlendirildi_mi) values (?,?,?,?,?,?,?,?,?);");
                ps2.setString(1,ogrenci_no);
                ps2.setString(2,baslama_tarihi);
                ps2.setString(3,kurum);
                ps2.setString(4,sehir);
                ps2.setString(5,bitis_tarihi);
                ps2.setInt(6, toplam_staj_gunu);
                ps2.setString(7,sinif);
                ps2.setString(8,konu);
                ps2.setBoolean(9,staj_degerlendirildi_mi);
                ps2.executeUpdate();

            }
            response.sendRedirect("staj_ekle_normal.jsp");

        }catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
