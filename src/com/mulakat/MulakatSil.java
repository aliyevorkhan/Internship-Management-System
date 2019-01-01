package com.mulakat;

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

@WebServlet(name = "MulakatSil")
public class MulakatSil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ogrenci_no = request.getParameter("ogrenci_no");

        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps0 = c.prepareStatement("delete from staj_mulakat where ogrenci_no ="+ogrenci_no+" and kabul_edilen_gun is null;");
            ps0.executeUpdate();


            response.sendRedirect("mulakat_ekle.jsp");

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    }
}
