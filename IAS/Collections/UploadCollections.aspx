<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadCollections.aspx.cs" Inherits="IAS.Collections.UploadCollections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Subir cuotas</h2>
    </div>
        <asp:UpdatePanel ID="upnlCollections" runat="server">

        <ContentTemplate>

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
            </ContentTemplate>
            </asp:UpdatePanel>

</asp:Content>
