<%@ Page Title="Certificados" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="IAS.Transports.Certificates" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="border-bottom: double; border-bottom-color: aliceblue">
        <div class="row">

        </div>
        <div class="row" >
            
            <div class="col-lg-2">

                <asp:LinkButton ID="AddCertificateBtn"
                    runat="server"
                    CssClass="btn btn-link"
                    PostBackUrl="Certificate.aspx?criteria=Client"
                    ToolTip="Nuevo Certificado">
                                <span class="glyphicon glyphicon-plus"></span>
                </asp:LinkButton>

            </div>

        </div>
    </div>
</asp:Content>
