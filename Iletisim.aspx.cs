using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace GrandOtel
{
    public partial class Iletisim : System.Web.UI.Page
    {
        string bgl = WebConfigurationManager.ConnectionStrings["GrandBaglanti"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            // Boş alan kontrolü
            if (txtAdSoyad.Text == "" || txtEmail.Text == "" || txtMesaj.Text == "")
            {
                lblDurum.Text = "Lütfen tüm alanları doldurunuz.";
                lblDurum.CssClass = "alert alert-danger d-block";
                return;
            }

            using (SqlConnection baglan = new SqlConnection(bgl))
            {
                baglan.Open();
                string sorgu = "INSERT INTO Tbl_Mesajlar (Gonderen, Email, Konu, Mesaj, Tarih) VALUES (@p1, @p2, @p3, @p4, @p5)";
                SqlCommand komut = new SqlCommand(sorgu, baglan);

                komut.Parameters.AddWithValue("@p1", txtAdSoyad.Text);
                komut.Parameters.AddWithValue("@p2", txtEmail.Text);
                komut.Parameters.AddWithValue("@p3", txtKonu.Text);
                komut.Parameters.AddWithValue("@p4", txtMesaj.Text);
                komut.Parameters.AddWithValue("@p5", DateTime.Now);

                komut.ExecuteNonQuery();
            }

            // Başarılı mesajı
            lblDurum.Text = "Mesajınız başarıyla gönderildi! En kısa sürede dönüş yapacağız.";
            lblDurum.CssClass = "alert alert-success d-block";

            // Kutuları temizle
            txtAdSoyad.Text = "";
            txtEmail.Text = "";
            txtKonu.Text = "";
            txtMesaj.Text = "";
        }
    }
}