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

<%@ Page Title="Certificados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="IAS.Transport.Admin.Certificates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Certificados</h2>
    </div>

    <asp:UpdatePanel ID="upnlCertificates" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="CertificateListView" runat="server"
                DataKeyNames="CertificateID"
                DataSourceID="CertificateDataSource"
                InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small">
                            <thead>
                                <th>CertificateID</th>
                                <th>CertificateNumber</th>
                                <th>PersonID</th>
                                <th>InsuranceManagerID</th>
                                <th>PolicyNumber</th>
                                <th>BeneficiaryID</th>
                                <th>PartnerID</th>
                                <th>PartnerAmmountPercent</th>
                                <th>ContactID</th>
                                <th>RiskName</th>
                                <th>PackageCount</th>
                                <th>Origin</th>
                                <th>Destination</th>
                                <th>TransportationMethodID</th>
                                <th>Description</th>
                                <th>Premium</th>
                                <th>PremiunmPlusTax</th>
                                <th>CapitalAmount</th>
                                <th>Rate</th>
                                <th>SpendingPercent</th>
                                <th>Spending</th>
                                <th>ComissionASSAPercent</th>
                                <th>ComissionAdviserPercent</th>
                            </thead>
                            <tbody>
                                <tr runat="server" id="itemPlaceholder" />
                            </tbody>
                        </table>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblCertificateID" runat="server" Text='<%# Eval("CertificateID") %>' /></td>
                        <td>
                            <asp:Label ID="lblCertificateNumber" runat="server" Text='<%# Eval("CertificateNumber") %>' /></td>
                        <td>
                            <asp:Label ID="lblPersonID" runat="server" Text='<%# Eval("PersonID") %>' /></td>
                        <td>
                            <asp:Label ID="lblInsuranceManagerID" runat="server" Text='<%# Eval("InsuranceManagerID") %>' /></td>
                        <td>
                            <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>' /></td>
                        <td>
                            <asp:Label ID="lblBeneficiaryID" runat="server" Text='<%# Eval("BeneficiaryID") %>' /></td>
                        <td>
                            <asp:Label ID="lblPartnerID" runat="server" Text='<%# Eval("PartnerID") %>' /></td>
                        <td>
                            <asp:Label ID="lblPartnerAmmountPercent" runat="server" Text='<%# Eval("PartnerAmmountPercent") %>' /></td>
                        <td>
                            <asp:Label ID="lblContactID" runat="server" Text='<%# Eval("ContactID") %>' /></td>
                        <td>
                            <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                        <td>
                            <asp:Label ID="lblPackageCount" runat="server" Text='<%# Eval("PackageCount") %>' /></td>
                        <td>
                            <asp:Label ID="lblOrigin" runat="server" Text='<%# Eval("Origin") %>' /></td>
                        <td>
                            <asp:Label ID="lblDestination" runat="server" Text='<%# Eval("Destination") %>' /></td>
                        <td>
                            <asp:Label ID="lblTransportationMethodID" runat="server" Text='<%# Eval("TransportationMethodID") %>' /></td>
                        <td>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' /></td>
                        <td>
                            <asp:Label ID="lblPremium" runat="server" Text='<%# Eval("Premium") %>' /></td>
                        <td>
                            <asp:Label ID="lblPremiunmPlusTax" runat="server" Text='<%# Eval("PremiunmPlusTax") %>' /></td>
                        <td>
                            <asp:Label ID="lblCapitalAmount" runat="server" Text='<%# Eval("CapitalAmount") %>' /></td>
                        <td>
                            <asp:Label ID="lblRate" runat="server" Text='<%# Eval("Rate") %>' /></td>
                        <td>
                            <asp:Label ID="lblSpendingPercent" runat="server" Text='<%# Eval("SpendingPercent") %>' /></td>
                        <td>
                            <asp:Label ID="lblSpending" runat="server" Text='<%# Eval("Spending") %>' /></td>
                        <td>
                            <asp:Label ID="lblComissionASSAPercent" runat="server" Text='<%# Eval("ComissionASSAPercent") %>' /></td>
                        <td>
                            <asp:Label ID="lblComissionAdviserPercent" runat="server" Text='<%# Eval("ComissionAdviserPercent") %>' /></td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtCertificateID" runat="server" Text='<%# Bind("CertificateID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCertificateNumber" runat="server" Text='<%# Bind("CertificateNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPersonID" runat="server" Text='<%# Bind("PersonID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiaryID" runat="server" Text='<%# Bind("BeneficiaryID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerID" runat="server" Text='<%# Bind("PartnerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerAmmountPercent" runat="server" Text='<%# Bind("PartnerAmmountPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtContactID" runat="server" Text='<%# Bind("ContactID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPackageCount" runat="server" Text='<%# Bind("PackageCount") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtOrigin" runat="server" Text='<%# Bind("Origin") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtDestination" runat="server" Text='<%# Bind("Destination") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtTransportationMethodID" runat="server" Text='<%# Bind("TransportationMethodID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPremium" runat="server" Text='<%# Bind("Premium") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPremiunmPlusTax" runat="server" Text='<%# Bind("PremiunmPlusTax") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCapitalAmount" runat="server" Text='<%# Bind("CapitalAmount") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRate" runat="server" Text='<%# Bind("Rate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSpendingPercent" runat="server" Text='<%# Bind("SpendingPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSpending" runat="server" Text='<%# Bind("Spending") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtComissionASSAPercent" runat="server" Text='<%# Bind("ComissionASSAPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtComissionAdviserPercent" runat="server" Text='<%# Bind("ComissionAdviserPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblCertificateID" runat="server" Text="" CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCertificateNumber" runat="server" Text='<%# Bind("CertificateNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPersonID" runat="server" Text='<%# Bind("PersonID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiaryID" runat="server" Text='<%# Bind("BeneficiaryID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerID" runat="server" Text='<%# Bind("PartnerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerAmmountPercent" runat="server" Text='<%# Bind("PartnerAmmountPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtContactID" runat="server" Text='<%# Bind("ContactID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPackageCount" runat="server" Text='<%# Bind("PackageCount") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtOrigin" runat="server" Text='<%# Bind("Origin") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtDestination" runat="server" Text='<%# Bind("Destination") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtTransportationMethodID" runat="server" Text='<%# Bind("TransportationMethodID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPremium" runat="server" Text='<%# Bind("Premium") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPremiunmPlusTax" runat="server" Text='<%# Bind("PremiunmPlusTax") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCapitalAmount" runat="server" Text='<%# Bind("CapitalAmount") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRate" runat="server" Text='<%# Bind("Rate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSpendingPercent" runat="server" Text='<%# Bind("SpendingPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSpending" runat="server" Text='<%# Bind("Spending") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtComissionASSAPercent" runat="server" Text='<%# Bind("ComissionASSAPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtComissionAdviserPercent" runat="server" Text='<%# Bind("ComissionAdviserPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

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

    <asp:SqlDataSource ID="CertificateDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="[transport].[sp_get_certificates]" SelectCommandType="StoredProcedure"
        UpdateCommand="[transport].[sp_update_certificate]" UpdateCommandType="StoredProcedure"
        DeleteCommand="[transport].[sp_delete_certificate]" DeleteCommandType="StoredProcedure"
        InsertCommand="[transport].[sp_insert_certificate]" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="CertificateNumber" Type="Int32" />
            <asp:Parameter Name="PersonID" Type="Int32" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int32" />
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
            <asp:Parameter Name="BeneficiaryID" Type="Int32" />
            <asp:Parameter Name="PartnerID" Type="Int32" />
            <asp:Parameter Name="PartnerAmmountPercent" Type="Decimal" />
            <asp:Parameter Name="ContactID" Type="Int32" />
            <asp:Parameter Name="RiskName" Type="String" />
            <asp:Parameter Name="PackageCount" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CertificateID" Type="Int32" />
            <asp:Parameter Name="CertificateNumber" Type="Int32" />
            <asp:Parameter Name="PersonID" Type="Int32" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int32" />
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
            <asp:Parameter Name="BeneficiaryID" Type="Int32" />
            <asp:Parameter Name="PartnerID" Type="Int32" />
            <asp:Parameter Name="PartnerAmmountPercent" Type="Decimal" />
            <asp:Parameter Name="ContactID" Type="Int32" />
            <asp:Parameter Name="RiskName" Type="String" />
            <asp:Parameter Name="PackageCount" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="CertificateID" Type="Int32" />
        </DeleteParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="CountriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[get_countries_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
