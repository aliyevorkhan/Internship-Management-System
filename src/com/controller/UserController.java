package com.controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserController extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String un = request.getParameter("uname");
        String pw = request.getParameter("pass");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("select komisyon_no,sifre from komisyon where komisyon_no=? and sifre=?");
            ps.setString(1, un);
            ps.setString(2, pw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", un);

                response.sendRedirect("home.jsp");
                return;
            }
            response.sendRedirect("index.jsp");
            return;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
    }
}}
