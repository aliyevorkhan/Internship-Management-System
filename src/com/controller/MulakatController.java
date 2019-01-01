package com.controller;

import com.model.Ogrenci;
import com.mulakat.MulakatEkle;

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
import java.util.List;

public class MulakatController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Ogrenci> ogrenciler = new MulakatEkle().mulakatEkle();
        String ogrenci_no = ogrenciler.get(0).getOgrenci_no();
        String mulakat_tarihi = request.getParameter("mulakat_tarihi");
        String mulakat_saati = request.getParameter("mulakat_saati");
        String komisyon_1 = request.getParameter("komisyon_1");
        String komisyon_2 = request.getParameter("komisyon_2");
        boolean staj_degerlendirildi_mi = true;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("update staj_mulakat set mulakat_tarihi = ?, mulakat_saati = ?, komisyon_1 = ?, komisyon_2 = ?, staj_degerlendirildi_mi = ? where ogrenci_no = ?");
            ps.setString(1,mulakat_tarihi);
            ps.setString(2,mulakat_saati);
            ps.setString(3,komisyon_1);
            ps.setString(4,komisyon_2);
            ps.setBoolean(5,staj_degerlendirildi_mi);
            ps.setString(6,ogrenci_no);
            ps.executeUpdate();
            response.sendRedirect("mulakat_ekle.jsp");

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }






    }

}
