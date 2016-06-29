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

<%@ Page Title="Certificados" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="IAS.Transports.Certificates" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="border-bottom: double; border-bottom-color: aliceblue">

        <div class="row">
            <div class="col-lg-2">
                <asp:LinkButton ID="AddCertificateBtn"
                    runat="server"
                    CssClass="btn btn-link"
                    PostBackUrl="Certificate.aspx?criteria=Client&mode=insert"
                    ToolTip="Nuevo Certificado">
                                <span class="glyphicon glyphicon-plus"></span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
        <asp:UpdatePanel ID="upnlCertificates" runat="server">
            <ContentTemplate>
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

                <asp:ListView ID="CertificateListView" runat="server"
                    DataKeyNames="CertificateID"
                    DataSourceID="CertificateDataSource"
                    OnItemCommand="CertificateListView_ItemCommand">
                    <LayoutTemplate>
                        <div class="table responsive">
                            <table class="table table-striped" style="font-size: x-small">
                                <thead>
                                    <th class="visible-lg">ID</th>
                                    <th>Nro. Cert.</th>
                                    <th>Póliza</th>
                                    <th>Cliente</th>
                                    <th class="visible-lg">Cant. Paquetes</th>
                                    <th class="visible-lg">Origen</th>
                                    <th class="visible-lg">Destino</th>
                                    <th class="visible-lg">Monto Aegurado</th>
                                    <th>Prima</th>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder" />
                                </tbody>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="visible-lg">
                                <asp:Label ID="lblCertificateID" runat="server" Text='<%# Eval("CertificateID") %>' /></td>
                            <td>
                                <asp:Label ID="lblCertificateNumber" runat="server" Text='<%# Eval("CertificateNumber") %>' /></td>
                            <td>
                                <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>' /></td>
                            <td>
                                <asp:Label ID="lblBeneficiary" runat="server" Text='<%# Eval("Beneficiary") %>' /></td>

                            <td class="visible-lg">
                                <asp:Label ID="lblPackageCount" runat="server" Text='<%# Eval("PackageCount") %>' /></td>
                            <td class="visible-lg">
                                <asp:Label ID="lblOrigin" runat="server" Text='<%# Eval("Origin") %>' /></td>
                            <td class="visible-lg">
                                <asp:Label ID="lblDestination" runat="server" Text='<%# Eval("Destination") %>' /></td>
                            <td class="visible-lg">
                                <asp:Label ID="lblCapitalAmount" runat="server" Text='<%# Eval("CapitalAmount") %>' /></td>
                            <td>
                                <asp:Label ID="lblPremiunmPlusTax" runat="server" Text='<%# Eval("PremiunmPlusTax") %>' /></td>

                            <td>
                                <div class="row">

                                    <asp:LinkButton ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CommandArgument='<%# Eval("CertificateID") %>' CssClass="btn btn-link">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                    </asp:LinkButton>


                                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar el Certificado.?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                    </asp:LinkButton>

                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <EmptyDataTemplate>
                        <h4 style="color: lightgray; text-align: center"><span class="glyphicon glyphicon-comment"></span>No se encontraron Certificados.</h4>
                    </EmptyDataTemplate>

                </asp:ListView>

                <asp:DataPager ID="CertificatesDataPager" runat="server" PagedControlID="CertificateListView" PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>

            </ContentTemplate>

        </asp:UpdatePanel>
    </div>
    <asp:SqlDataSource ID="CertificateDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="[transport].[sp_get_certificates]" SelectCommandType="StoredProcedure"
        DeleteCommand="[transport].[sp_delete_certificate]" DeleteCommandType="StoredProcedure">


        <DeleteParameters>
            <asp:Parameter Name="CertificateID" Type="Int32" />
        </DeleteParameters>

    </asp:SqlDataSource>



</asp:Content>
