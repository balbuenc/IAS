<%@ Page Title="Certificados" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="IAS.Transports.Certificates" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="border-bottom:double; border-bottom-color: aliceblue">
        <div class="row">
            <div class="col-lg-1">
                <span class="glyphicon glyphicon-wrench"></span>
            </div>
            <div class="col-lg-2">
                <h5>Certificado
                <asp:LinkButton ID="AddCertificateBtn" 
                                runat="server" 
                                CssClass="btn btn-link" 
                                PostBackUrl="Certificate.aspx?criteria=Client">
                                <span class="glyphicon glyphicon glyphicon-plus"></span>
                </asp:LinkButton>
                </h5>
            </div>

        </div>
    </div>
</asp:Content>
