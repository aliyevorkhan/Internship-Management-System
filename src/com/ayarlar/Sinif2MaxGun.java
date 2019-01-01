package com.ayarlar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Sinif2MaxGun extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sinif2MaxGun = Integer.parseInt(request.getParameter("2_sinif_max_gun"));

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps0 = c.prepareStatement("update ayarlar set 2_sinif_max_gun = ?");
            ps0.setInt(1,sinif2MaxGun);
            ps0.executeUpdate();


            response.sendRedirect("ayar_kisitlama.jsp");

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int min_toplam_gun = Integer.parseInt(request.getParameter("min_toplam_gun"));

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps0 = c.prepareStatement("update ayarlar set min_toplam_gun = ?");
            ps0.setInt(1,min_toplam_gun);
            ps0.executeUpdate();


            response.sendRedirect("ayar_kisitlama.jsp");

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

    }

}
