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
    public partial class _Default : Page
    {
        // Bağlantı cümlesini al
        string bgl = WebConfigurationManager.ConnectionStrings["GrandBaglanti"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OdalarGetir();
            }
        }

        void OdalarGetir()
        {
            // Veritabanına bağlan ve odaları çek
            using (SqlConnection baglan = new SqlConnection(bgl))
            {
                baglan.Open();

                // Tbl_Odalar tablosundaki her şeyi al
                SqlCommand komut = new SqlCommand("SELECT * FROM Tbl_Odalar", baglan);
                SqlDataReader dr = komut.ExecuteReader();

                // Listeye (Repeater) bağla
                rptOdalar.DataSource = dr;
                rptOdalar.DataBind();
            }
        }
    }
}