<%@ Page Title="Subir Siniestros" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="UploadClaims.aspx.cs" Inherits="IAS.Claims.UploadClaims" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Subir cuotas</h2>
    </div>
      

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Siniestros</th>
                                    <th>Archivo (.csv)</th>
                                    <th>&nbsp;</th>
                                   
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>Mapfre Siniestros</th>
                                <th>
                                    <asp:FileUpload ID="MapfreClaimsFileUp" runat="server"   />
                                </th>
                                <th>
                                <asp:Button runat="server" id="MapfreClaimsFileBtn" text="Upload"  OnClick="MapfreClaimsFileBtn_Click" />
                                    </th>
                                <th>
                                    <asp:Label runat="server" id="MapfreClaimsFileStatus" text="Estado" />

                                </th>
                            </tr>
                                <tr>
                                <th>Sancor Siniestros</th>
                                <th>
                                    <asp:FileUpload ID="SancorClaimsFileUp" runat="server" />
                                </th>
                                     <th>
                                <asp:Button runat="server" id="SancorClaimsFileBtn" text="Upload"  OnClick="SancorClaimsFileBtn_Click"/>
                                    </th>
                                     <th>
                                    <asp:Label runat="server" id="SancorClaimsFileStatus" text="Estado" />

                                </th>
                            </tr>
                               
                            </tbody>
                            </table>
                </div>
           
</asp:Content>
