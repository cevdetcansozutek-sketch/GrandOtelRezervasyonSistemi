using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GrandOtel
{
    public partial class RezervasyonYap : System.Web.UI.Page
    {
        string bgl = WebConfigurationManager.ConnectionStrings["GrandBaglanti"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Eğer linkte oda id'si yoksa Ana Sayfaya at (Hata vermesin)
                if (Request.QueryString["odaId"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    // Odanın bilgilerini ekrana getir
                    OdaBilgileriniGetir(Request.QueryString["odaId"]);
                }
            }
        }

        void OdaBilgileriniGetir(string id)
        {
            using (SqlConnection baglan = new SqlConnection(bgl))
            {
                baglan.Open();
                SqlCommand komut = new SqlCommand("SELECT OdaAdi, Fiyat FROM Tbl_Odalar WHERE OdaID=@p1", baglan);
                komut.Parameters.AddWithValue("@p1", id);
                SqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    lblOdaAdi.Text = dr["OdaAdi"].ToString();
                    lblFiyat.Text = Convert.ToDecimal(dr["Fiyat"]).ToString("N2"); // Kuruşlu format
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnRezervasyonYap_Click(object sender, EventArgs e)
        {
            // 1. BOŞ ALAN KONTROLÜ
            if (txtAdSoyad.Text == "" || txtTelefon.Text == "" || txtGiris.Text == "" || txtCikis.Text == "")
            {
                lblMesaj.Text = "Lütfen tüm alanları doldurunuz!";
                return;
            }

            // 2. TARİH VE FİYAT HESAPLAMA
            DateTime giris = Convert.ToDateTime(txtGiris.Text);
            DateTime cikis = Convert.ToDateTime(txtCikis.Text);

            if (cikis <= giris)
            {
                lblMesaj.Text = "Çıkış tarihi giriş tarihinden sonra olmalıdır!";
                return;
            }

            TimeSpan fark = cikis - giris;
            int gunSayisi = fark.Days;
            decimal gecelikFiyat = Convert.ToDecimal(lblFiyat.Text);
            decimal toplamTutar = gunSayisi * gecelikFiyat;
            string odaId = Request.QueryString["odaId"];

            // 3. VERİTABANINA KAYDETME
            using (SqlConnection baglan = new SqlConnection(bgl))
            {
                baglan.Open();
                string sorgu = @"INSERT INTO Tbl_Rezervasyonlar 
                                (MusteriAdSoyad, Telefon, GirisTarihi, CikisTarihi, OdaID, ToplamTutar, OnayDurumu) 
                                VALUES (@p1, @p2, @p3, @p4, @p5, @p6, 'Onay Bekliyor')";

                SqlCommand komut = new SqlCommand(sorgu, baglan);
                komut.Parameters.AddWithValue("@p1", txtAdSoyad.Text);
                komut.Parameters.AddWithValue("@p2", txtTelefon.Text);
                komut.Parameters.AddWithValue("@p3", giris);
                komut.Parameters.AddWithValue("@p4", cikis);
                komut.Parameters.AddWithValue("@p5", odaId);
                komut.Parameters.AddWithValue("@p6", toplamTutar);

                komut.ExecuteNonQuery();
            }

            // BAŞARILI MESAJI VE YÖNLENDİRME
            Response.Write("<script>alert('Rezervasyonunuz başarıyla alındı! Sizi arayacağız.'); window.location='Default.aspx';</script>");
        }
    }
}