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

<%@ Page Title="Pólizas" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="Policies.aspx.cs" Inherits="IAS.Admin.Policies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Pólizas</h2>
    </div>

    <asp:UpdatePanel ID="upnlPolicies" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="PolicyListView" runat="server"
                DataKeyNames="PolicyNumber"
                DataSourceID="PolicyDataSource"
                InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small">
                            <thead>
                                <th>Nro.</th>
                                <th>Sección</th>
                                <th>Aseguradora</th>
                                <th>Emisión</th>
                                <th>Vencimiento</th>
                                <th>Tomador</th>
                                <th>Estado</th>
                                <th>Póliza</th>
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
                            <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>' /></td>
                        <td>
                            <asp:Label ID="lblSectionNumber" runat="server" Text='<%# Eval("SectionNumber") %>' /></td>
                        <td>
                            <asp:Label ID="lblInsuranceManager" runat="server" Text='<%# Eval("InsuranceManager") %>' /></td>
                        <td>
                            <asp:Label ID="lblEmissionDate" runat="server" Text='<%#:string.Format("{0:d}", Eval("EmissionDate")) %>' /></td>
                        <td>
                            <asp:Label ID="lblExpirationDate" runat="server" Text='<%#:string.Format("{0:d}",  Eval("ExpirationDate")) %>' /></td>
                        <td>
                            <asp:Label ID="lblBeneficiary" runat="server" Text='<%# Eval("Beneficiary") %>' /></td>

                        <td>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' /></td>
                        <td>
                            <asp:HyperLink ID="linkABM" runat="server" Text="Póliza" NavigateUrl='<%#   Eval("Policy") %>'></asp:HyperLink>
                        </td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSectionNumber" runat="server" Text='<%# Bind("SectionNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtEmissionDate" runat="server" Text='<%# Bind("EmissionDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                      
                        <td>
                            <asp:TextBox ID="txtExpirationDate" runat="server" Text='<%# Bind("ExpirationDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiary" runat="server" Text='<%# Bind("Beneficiary") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" Font-Size="X-Small" /></td>


                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSectionNumber" runat="server" Text='<%# Bind("SectionNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtEmissionDate" runat="server" Text='<%# Bind("EmissionDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtExpirationDate" runat="server" Text='<%# Bind("ExpirationDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiary" runat="server" Text='<%# Bind("Beneficiary") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" Font-Size="X-Small" /></td>


                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="PliciesDataPager" runat="server" PagedControlID="PolicyListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="PolicyDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="sp_get_policies" SelectCommandType="StoredProcedure"
        UpdateCommand="sp_update_policy" UpdateCommandType="StoredProcedure"
        DeleteCommand="sp_delete_policy" DeleteCommandType="StoredProcedure"
        InsertCommand="sp_insert_policy" InsertCommandType="StoredProcedure">

        <DeleteParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int64"/>
            <asp:Parameter Name="SectionNumber" Type="Int64" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int64" />
            <asp:Parameter Name="EmissionDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="PersonID" Type="Int64" />
            <asp:Parameter Name="Coverage" Type="Decimal" />
            <asp:Parameter Name="RiskName" Type="String" />
            <asp:Parameter Name="PaymentsNumber" Type="Int64" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Premium" Type="Decimal" />
            <asp:Parameter Name="Beneficiary" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int64" />
            <asp:Parameter Name="SectionNumber" Type="Int64" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int64" />
            <asp:Parameter Name="EmissionDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="PersonID" Type="Int64" />
            <asp:Parameter Name="Coverage" Type="Decimal" />
            <asp:Parameter Name="RiskName" Type="String" />
            <asp:Parameter Name="PaymentsNumber" Type="Int64" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Premium" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>




</asp:Content>
