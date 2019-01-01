package com.model;

public class Ogrenci {
    String ogrenci_no;
    String isim;
    String soyisim;
    String ogretim;

    public String getOgrenci_no() {
        return ogrenci_no;
    }

    public void setOgrenci_no(String ogrenci_no) {
        this.ogrenci_no = ogrenci_no;
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public String getSoyisim() {
        return soyisim;
    }

    public void setSoyisim(String soyisim) {
        this.soyisim = soyisim;
    }

    public String getOgretim() {
        return ogretim;
    }

    public void setOgretim(String ogretim) {
        this.ogretim = ogretim;
    }

    @Override
    public String toString() {
        return "Ogrenci{" +
                "ogrenci_no='" + ogrenci_no + '\'' +
                ", isim='" + isim + '\'' +
                ", soyisim='" + soyisim + '\'' +
                ", ogretim='" + ogretim + '\'' +
                '}';
    }
}
