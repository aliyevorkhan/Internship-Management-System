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

@WebServlet(name = "MinKabulEdilenGun")
public class MinKabulEdilenGun extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int min_kabul_edilen_gun = Integer.parseInt(request.getParameter("min_kabul_edilen_gun"));

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps0 = c.prepareStatement("update ayarlar set min_kabul_edilen_gun = ?");
            ps0.setInt(1,min_kabul_edilen_gun);
            ps0.executeUpdate();


            response.sendRedirect("ayar_kisitlama.jsp");

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    }

}
