<%@ Page Title="Galeri" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Galeri.aspx.cs" Inherits="GrandOtel.Galeri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center py-5 bg-light">
        <h2 class="fw-bold display-5">Otel Galerisi</h2>
        <p class="text-muted">Konforun ve lüksün fotoğraflarla kanıtı.</p>
    </div>

    <div class="container mb-5 mt-4">
        <div class="row g-4">
            
            <div class="col-md-4">
                <div class="overflow-hidden rounded shadow-lg">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800" class="img-fluid w-100 gallery-img" alt="Otel">
                </div>
            </div>

            <div class="col-md-4">
                <div class="overflow-hidden rounded shadow-lg">
                    <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800" class="img-fluid w-100 gallery-img" alt="Oda">
                </div>
            </div>

            <div class="col-md-4">
                <div class="overflow-hidden rounded shadow-lg">
                    <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800" class="img-fluid w-100 gallery-img" alt="Havuz">
                </div>
            </div>

            <div class="col-md-4">
                <div class="overflow-hidden rounded shadow-lg">
                    <img src="https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800" class="img-fluid w-100 gallery-img" alt="Restoran">
                </div>
            </div>

            <div class="col-md-4">
                <div class="overflow-hidden rounded shadow-lg">
                    <img src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800" class="img-fluid w-100 gallery-img" alt="Lobi">
                </div>
            </div>

            <div class="col-md-4">
                <div class="overflow-hidden rounded shadow-lg">
                    <img src="https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800" class="img-fluid w-100 gallery-img" alt="Manzara">
                </div>
            </div>

        </div>
    </div>

    <style>
        .gallery-img {
            transition: transform 0.4s ease;
            cursor: pointer;
        }
        .gallery-img:hover {
            transform: scale(1.1); /* Üzerine gelince %10 büyür */
        }
    </style>

</asp:Content>