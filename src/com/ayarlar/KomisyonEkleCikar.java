package com.ayarlar;

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

@WebServlet(name = "KomısyonEkle")
public class KomisyonEkleCikar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String komisyon_no = request.getParameter("komisyon_no");
        String isim = request.getParameter("isim");
        String soyisim = request.getParameter("soyisim");
        String sifre = request.getParameter("sifre");

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("insert into komisyon (komisyon_no, isim ,soyisim , sifre ) values (?,?,?,?);");
            ps.setString(1,komisyon_no);
            ps.setString(2,isim);
            ps.setString(3,soyisim);
            ps.setString(4,sifre);
            ps.executeUpdate();

            response.sendRedirect("ayar_kom_tanimla.jsp");
        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String komisyon_no = request.getParameter("komisyon_no");

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps0 = c.prepareStatement("delete from komisyon where komisyon_no = ?");
            ps0.setString(1,komisyon_no);
            ps0.executeUpdate();

            response.sendRedirect("ayar_kom_tanimla.jsp");
        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

    }
}
