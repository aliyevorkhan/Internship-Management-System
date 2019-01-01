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

@WebServlet(name = "KonuEkleCikar")
public class KonuEkleCikar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String konu_ismi = request.getParameter("konu_ismi");
        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("insert into konu (konu_ismi) values (?);");
            ps.setString(1,konu_ismi);
            ps.executeUpdate();

            response.sendRedirect("ayar_kisitlama.jsp");
        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String konu_ismi = request.getParameter("konu_ismi");
        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("delete from konu where konu_ismi='"+konu_ismi+"';");
            ps.executeUpdate();

            response.sendRedirect("ayar_kisitlama.jsp");
        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    }
}
