<%@ Page Title="Ana Sayfa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GrandOtel._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* 1. LÜKS KARŞILAMA ALANI */
        .hero-header {
            position: relative;
            /* Yüksek Kaliteli Havuz Görseli */
            background-image: url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1920&auto=format&fit=crop');
            background-size: cover;
            background-position: center center;
            background-attachment: fixed; /* Resmi arkada sabitler (Parallax) */
            height: 85vh; /* Ekranın %85'ini kaplar */
            min-height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        /* 2. KARARTMA FİLTRESİ (Yazılar okunsun diye) */
        .hero-overlay {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* %50 Siyahlık */
        }

        /* 3. YAZI VE BUTONLAR */
        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 5rem;
            font-weight: 900;
            text-shadow: 2px 2px 20px rgba(0,0,0,0.8);
            margin-bottom: 10px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .hero-subtitle {
            font-size: 1.5rem;
            font-weight: 300;
            margin-bottom: 40px;
            text-shadow: 1px 1px 10px rgba(0,0,0,0.8);
        }

        /* Sarı Keşfet Butonu */
        .btn-kesfet {
            background-color: #ffc107;
            color: #000;
            padding: 15px 50px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 50px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.4);
        }

        .btn-kesfet:hover {
            background-color: #ffdb4d;
            transform: translateY(-5px); /* Hafif yukarı kalkar */
            box-shadow: 0 10px 20px rgba(255, 193, 7, 0.6);
            color: #000;
        }
    </style>

    <div class="hero-header">
        <div class="hero-overlay"></div>
        <div class="hero-content container">
            <h1 class="hero-title">GRAND OTEL</h1>
            <p class="hero-subtitle">Hayallerinizin ötesinde, konforun zirvesinde.</p>
            <a href="#odalarimiz" class="btn-kesfet">ODALARI İNCELE <i class="fa-solid fa-arrow-down ms-2"></i></a>
        </div>
    </div>


    <div id="odalarimiz" class="text-center py-5 bg-light">
        <h2 class="fw-bold text-dark display-6">Konaklama Seçeneklerimiz</h2>
        <p class="text-muted lead">Size en uygun odayı seçin ve tatilin keyfini çıkarın.</p>
    </div>


    <div class="container mb-5 mt-4">
        <div class="row">

            <asp:Repeater ID="rptOdalar" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 border-0 shadow-lg">
                            
                            <div style="height: 250px; overflow: hidden;">
                                <img src='<%# Eval("Resim") %>' class="card-img-top" alt="Oda Görseli" style="height: 100%; object-fit: cover; transition: 0.5s;" onmouseover="this.style.transform='scale(1.1)'" onmouseout="this.style.transform='scale(1)'" onerror="this.src='https://via.placeholder.com/500x250?text=Resim+Yok'">
                            </div>
                            
                            <div class="card-body text-center p-4">
                                <h4 class="card-title fw-bold mt-2"><%# Eval("OdaAdi") %></h4>
                                
                                <p class="card-text text-muted small">
                                    <%# Eval("Aciklama").ToString().Length > 100 ? Eval("Aciklama").ToString().Substring(0, 100) + "..." : Eval("Aciklama") %>
                                </p>
                                
                                <h3 class="text-warning fw-bold my-3">
                                    <%# Eval("Fiyat", "{0:N0}") %> ₺ <span class="fs-6 text-muted">/ Gece</span>
                                </h3>
                                
                                <a href="RezervasyonYap.aspx?odaId=<%# Eval("OdaID") %>" class="btn btn-dark w-100 py-3 rounded-pill fw-bold">HEMEN REZERVASYON YAP</a>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>

</asp:Content>