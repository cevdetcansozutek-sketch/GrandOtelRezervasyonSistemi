<%@ Page Title="İletişim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="GrandOtel.Iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center py-5 bg-light" style="margin-top: 100px;">
        <h2 class="fw-bold display-5">Bize Ulaşın</h2>
        <p class="text-muted">Sorularınız ve rezervasyon talepleriniz için buradayız.</p>
    </div>

    <div class="container mt-5 mb-5">
        <div class="row">
            
            <div class="col-md-5 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4"><i class="fa-solid fa-location-dot text-warning me-2"></i> Adres Bilgileri</h4>
                        
                        <p><strong>Adres:</strong> Grand Cad. No:1, Beşiktaş / İstanbul</p>
                        <p><strong>Telefon:</strong> +90 212 555 00 00</p>
                        <p><strong>E-Mail:</strong> info@grandotel.com</p>

                        <hr />
                        
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3008.9633698339308!2d28.993048515415386!3d41.04798207929665!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab7650656bd63%3A0x8ca058b28c20b6c3!2sBe%C5%9Fikta%C5%9F%2C%20Istanbul!5e0!3m2!1sen!2str!4v1625567891234!5m2!1sen!2str" 
                            width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>

            <div class="col-md-7 mb-4">
                <div class="card border-0 shadow-lg">
                    <div class="card-header bg-warning text-dark fw-bold">
                        <i class="fa-solid fa-envelope me-2"></i> Mesaj Gönder
                    </div>
                    <div class="card-body p-4">
                        
                        <asp:Label ID="lblDurum" runat="server" CssClass="d-block mb-3 fw-bold"></asp:Label>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold small mb-1">Adınız Soyadınız</label>
                                <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="form-control" placeholder="Adınız"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold small mb-1">E-Mail Adresiniz</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="ornek@email.com" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="fw-bold small mb-1">Konu</label>
                            <asp:TextBox ID="txtKonu" runat="server" CssClass="form-control" placeholder="Mesajınızın konusu"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="fw-bold small mb-1">Mesajınız</label>
                            <asp:TextBox ID="txtMesaj" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Bize ne sormak istersiniz?"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnGonder" runat="server" Text="MESAJI GÖNDER" CssClass="btn btn-dark w-100 py-2 fw-bold" OnClick="btnGonder_Click" />

                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>