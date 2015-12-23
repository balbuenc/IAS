<%--   
    «Copyright 2014 Balcazz HT, http://www.balcazzht.com»

    This file is part of IAS | Insurance Advanced Services.

    IAS is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    IAS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
--%>

<%@ Page Title="Subir Siniestros" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="UploadClaims.aspx.cs" Inherits="IAS.Claims.UploadClaims" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Subir Siniestros</h2>
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
                        <asp:FileUpload ID="MapfreClaimsFileUp" runat="server" />
                    </th>
                    <th>
                        <asp:Button runat="server" ID="MapfreClaimsFileBtn" Text="Upload" OnClick="MapfreClaimsFileBtn_Click" />
                    </th>
                    <th>
                        <asp:Label runat="server" ID="MapfreClaimsFileStatus" Text="Estado" />

                    </th>
                </tr>
                <tr>
                    <th>Sancor Siniestros</th>
                    <th>
                        <asp:FileUpload ID="SancorClaimsFileUp" runat="server" />
                    </th>
                    <th>
                        <asp:Button runat="server" ID="SancorClaimsFileBtn" Text="Upload" OnClick="SancorClaimsFileBtn_Click" />
                    </th>
                    <th>
                        <asp:Label runat="server" ID="SancorClaimsFileStatus" Text="Estado" />

                    </th>
                </tr>

            </tbody>
        </table>
    </div>

</asp:Content>
