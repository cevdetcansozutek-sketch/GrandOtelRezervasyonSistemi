using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GrandOtel
{
    // DİKKAT: Sınıf isminin "SiteMaster" olması zorunludur.
    // Çünkü Site.Master dosyasının en tepesinde Inherits="GrandOtel.SiteMaster" yazıyor.
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Master page yüklenirken çalışacak kodlar buraya gelir.
            // Şimdilik boş kalması normaldir.
        }
    }
}