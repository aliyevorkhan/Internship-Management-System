package com.mulakat;

import com.model.Ogrenci;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MulakatEkle {
    public List<Ogrenci> mulakatEkle(){
        List<Ogrenci> ogrenciler = new ArrayList<Ogrenci>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            Statement statement = c.createStatement();
            ResultSet rs = statement.executeQuery("select n.ogrenci_no, n.isim, n.soyisim, n.ogretim from normal_ogrenci n, staj_mulakat s where staj_degerlendirildi_mi = false && n.ogrenci_no = s.ogrenci_no limit 1;");

            while (rs.next()) {
                Ogrenci ogrenci = new Ogrenci();
                ogrenci.setOgrenci_no(rs.getString("ogrenci_no"));
                ogrenci.setIsim(rs.getString("isim"));
                ogrenci.setSoyisim(rs.getString("soyisim"));
                ogrenci.setOgretim(rs.getString("ogretim"));
                ogrenciler.add(ogrenci);

                System.out.println(ogrenciler);
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return ogrenciler;
    }
}
