<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RezervasyonYap.aspx.cs" Inherits="GrandOtel.RezervasyonYap" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
        <div class="row justify-content-center">
            <div class="col-md-8">
                
                <div class="card shadow-lg border-0 mb-4">
                    <div class="card-body text-center bg-dark text-white rounded-top">
                        <h3><i class="fa-solid fa-calendar-check me-2"></i>Rezervasyon Oluştur</h3>
                        <p class="mb-0">Seçtiğiniz Oda: <asp:Label ID="lblOdaAdi" runat="server" Font-Bold="true" ForeColor="#ffc107"></asp:Label></p>
                        <small>Gecelik Fiyat: <asp:Label ID="lblFiyat" runat="server" Text="0"></asp:Label> ₺</small>
                    </div>
                    
                    <div class="card-body p-4">
                        <asp:Label ID="lblMesaj" runat="server" CssClass="text-danger fw-bold mb-3 d-block text-center"></asp:Label>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold">Adınız Soyadınız</label>
                                <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="form-control" placeholder="Örn: Ahmet Yılmaz"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold">Telefon Numaranız</label>
                                <asp:TextBox ID="txtTelefon" runat="server" CssClass="form-control" placeholder="0555 555 55 55"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold">Giriş Tarihi</label>
                                <asp:TextBox ID="txtGiris" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold">Çıkış Tarihi</label>
                                <asp:TextBox ID="txtCikis" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="alert alert-info mt-3">
                            <i class="fa-solid fa-circle-info me-2"></i>
                            Ödeme otele giriş yaptığınızda resepsiyonda alınacaktır. Rezervasyonunuzu onaylamak için aşağıdaki butona basınız.
                        </div>

                        <asp:Button ID="btnRezervasyonYap" runat="server" Text="Rezervasyonu Tamamla" CssClass="btn btn-warning w-100 py-2 fw-bold fs-5" OnClick="btnRezervasyonYap_Click" />
                        
                        <a href="Default.aspx" class="btn btn-link w-100 mt-2 text-decoration-none text-muted">İptal Et ve Ana Sayfaya Dön</a>

                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>