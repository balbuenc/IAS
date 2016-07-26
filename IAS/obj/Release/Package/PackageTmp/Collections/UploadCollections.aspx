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

<%@ Page Title="" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="UploadCollections.aspx.cs" Inherits="IAS.Collections.UploadCollections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Subir cuotas</h2>
    </div>
      

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Cuotas</th>
                                    <th>Archivo (.csv)</th>
                                    <th>&nbsp;</th>
                                   
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>Mapfre vencidos</th>
                                <th>
                                    <asp:FileUpload ID="MapfreExpiredUp" runat="server"   />
                                </th>
                                <th>
                                <asp:Button runat="server" id="MapfreExpireBtn" text="Upload" onclick="MapfreExpireBtn_Click" />
                                    </th>
                                <th>
                                    <asp:Label runat="server" id="MapfreExpiredStatus" text="Estado" />

                                </th>
                            </tr>
                                <tr>
                                <th>Mapfre a vencer</th>
                                <th>
                                    <asp:FileUpload ID="MapfreToExpireUp" runat="server" />
                                </th>
                                     <th>
                                <asp:Button runat="server" id="MapfreToExpireBtn" text="Upload" onclick="MapfreToExpireBtn_Click" />
                                    </th>
                                     <th>
                                    <asp:Label runat="server" id="MapfreToExpireStatus" text="Estado" />

                                </th>
                            </tr>
                                <tr>
                                <th>Sancor</th>
                                <th>
                                    <asp:FileUpload ID="Sancor" runat="server" />
                                </th>
                                     <th>
                                <asp:Button runat="server" id="SancorBtn" text="Upload" onclick="SancorBtn_Click" />
                                    </th>
                                    <th>
                                    <asp:Label runat="server" id="SancorStatus" text="Estado" />

                                </th>
                            </tr>
                            </tbody>
                            </table>
                </div>
           

</asp:Content>
