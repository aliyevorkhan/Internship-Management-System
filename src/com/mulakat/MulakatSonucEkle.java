package com.mulakat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import static java.lang.Integer.parseInt;

@WebServlet(name = "MulakatSonucEkle")
public class MulakatSonucEkle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ogrenci_no = request.getParameter("ogrenci_no");
        double devam = (double) parseInt(request.getParameter("devam"));
        double calisma = (double)parseInt(request.getParameter("calisma"));
        double isi_vaktinde_yapma = (double)parseInt(request.getParameter("isi_vaktinde_yapma"));
        double amire_davranis = (double)parseInt(request.getParameter("amirine_karsi_davranis"));
        double is_arkadaslarina_davranis =(double) parseInt(request.getParameter("arkadaslarina_karsi_davranis"));
        double proje = (double)parseInt(request.getParameter("proje"));
        double duzen = (double)parseInt(request.getParameter("duzen"));
        double mulakat = (double)parseInt(request.getParameter("mulakat"));
        double sunum = (double)parseInt(request.getParameter("sunum"));
        double icerik = (double)parseInt(request.getParameter("icerik"));
        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("update staj_mulakat set devam = ?, calisma = ?, isi_vaktinde_yapma = ?, amire_davranis = ?, is_arkadaslarina_davranis = ?, proje = ?, duzen = ?, mulakat = ?, icerik = ?, sunum = ? where ogrenci_no = ?;");
            ps.setInt(1, (int) devam);
            ps.setInt(2, (int) calisma);
            ps.setInt(3, (int) isi_vaktinde_yapma);
            ps.setInt(4, (int) amire_davranis);
            ps.setInt(5, (int) is_arkadaslarina_davranis);
            ps.setInt(6, (int) proje);
            ps.setInt(7, (int) duzen);
            ps.setInt(8, (int) mulakat);
            ps.setInt(9, (int) icerik);
            ps.setInt(10, (int) sunum);
            ps.setString(11,ogrenci_no);
            ps.executeUpdate();

        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        int toplam_gun = 0;
        int kabul_edilen_gun;
        devam = ((devam *4)/100);
        calisma = ((calisma *4)/100);
        isi_vaktinde_yapma = ((isi_vaktinde_yapma *4)/100);
        amire_davranis = ((amire_davranis *4)/100);
        is_arkadaslarina_davranis = ((is_arkadaslarina_davranis *4)/100);
        proje = ((proje *15)/100);
        duzen = ((duzen *5)/100);
        sunum = ((sunum *5)/100);
        icerik = ((icerik *15)/100);
        mulakat = ((mulakat*40)/100);

        double toplam = (devam + calisma + isi_vaktinde_yapma + amire_davranis+is_arkadaslarina_davranis+proje+duzen +sunum +icerik + mulakat);

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/odev", "root", "1234"); // gets a new connection

            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select toplam_gun from staj_mulakat where ogrenci_no = " + ogrenci_no +";");

            while (rs.next()){
                toplam_gun = rs.getInt(1);
            }
            kabul_edilen_gun = (int) ((toplam * toplam_gun)/100);

            PreparedStatement ps = c.prepareStatement("update staj_mulakat set kabul_edilen_gun = ? where ogrenci_no = ?;");
            ps.setInt(1,kabul_edilen_gun);
            ps.setString(2,ogrenci_no);
            ps.executeUpdate();

            PreparedStatement ps1 = c.prepareStatement("update normal_ogrenci set toplam_staj_gunu = ? where ogrenci_no = ?;");
            ps1.setInt(1,kabul_edilen_gun);
            ps1.setString(2,ogrenci_no);
            ps1.executeUpdate();
            response.sendRedirect("mulakat_sonuc_ekle.jsp");


        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }



    }


}
