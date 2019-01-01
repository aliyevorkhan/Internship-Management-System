package com.staj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import static java.lang.Integer.parseInt;


public class DgsStajEkle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ogrenci_no = request.getParameter("ogrenci_no");
        String isim = request.getParameter("isim");
        String soyisim = request.getParameter("soyisim");
        String ogretim = request.getParameter("ogretim");
        String onceki_okul = request.getParameter("onceki_okul");
        int toplam_staj_gunu =(parseInt(request.getParameter("toplam_staj_gunu")))/2;

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps0 = c.prepareStatement("insert into ogrenci(ogrenci_no) values (?)");
            ps0.setString(1,ogrenci_no);
            ps0.executeUpdate();

            PreparedStatement ps = c.prepareStatement("insert into dgsli_ogrenci (ogrenci_no, isim ,soyisim , ogretim ,onceki_okul , toplam_staj_gunu ) values (?,?,?,?,?,?)");

            ps.setString(1,ogrenci_no);
            ps.setString(2,isim);
            ps.setString(3,soyisim);
            ps.setString(4,ogretim);
            ps.setString(5,onceki_okul);
            ps.setInt(6,toplam_staj_gunu);

            ps.executeUpdate();

            response.sendRedirect("staj_ekle_dgs.jsp");

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    }

}
