<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="CloseClaim.aspx.cs" Inherits="IAS.Claims.CloseClaim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Cierre del Siniestro</h3>
    <div class="container">
        <div class="row">
                    <div class="col-lg-12">
                        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
                    </div>
                </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Button ID="CloseBtn" runat="server" Text="Cerrar Siniestro"  OnClick="CloseBtn_Click"
                    />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="ClaimSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>">
       
    </asp:SqlDataSource>
</asp:Content>
