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

<%@ Page Title="Pólizas de Transporte" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Policies.aspx.cs" Inherits="IAS.Transports.Policies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="border-bottom: double; border-bottom-color: aliceblue">

        <div class="row">
            <div class="col-lg-2">
                <asp:LinkButton ID="AddPolicylBtn"
                    runat="server"
                    CssClass="btn btn-link"
                    PostBackUrl="Certificate.aspx?criteria=Client"
                    ToolTip="Nuevo Póliza">
                                <span class="glyphicon glyphicon-plus"></span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="container" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
        <asp:UpdatePanel ID="upnlPolicies" runat="server">
            <ContentTemplate>
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

                <asp:ListView ID="PolicyListView" runat="server"
                    DataKeyNames="PolicyNumber"
                    DataSourceID="PoliciesDataSource"
                    InsertItemPosition="FirstItem">
                    <LayoutTemplate>
                        <div class="table responsive">
                            <table class="table table-striped" style="font-size: x-small">
                                <thead>
                                    <th>Nro. Poliza</th>
                                    <th>Aseguradora</th>
                                    <th>Fecha de Emisión</th>
                                    <th>Fecha de Expiración</th>
                                    <th>Descripción</th>
                                    <th>Estado</th>
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
                                <asp:Label ID="lblInsuranceManagerID" runat="server" Text='<%# Eval("InsuranceManagerID") %>' /></td>
                            <td>
                                <asp:Label ID="lblEmissionDate" runat="server" Text='<%# Eval("EmissionDate") %>' /></td>
                            <td>
                                <asp:Label ID="lblExpirationDate" runat="server" Text='<%# Eval("ExpirationDate") %>' /></td>
                            <td>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' /></td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' /></td>

                            <td>
                                <div class="row">

                                    <asp:LinkButton ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-link">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                    </asp:LinkButton>


                                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar el Siniestro.?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                    </asp:LinkButton>

                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtEmissionDate" runat="server" Text='<%# Bind("EmissionDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtExpirationDate" runat="server" Text='<%# Bind("ExpirationDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control" Font-Size="X-Small" /></td>
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
                                <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtEmissionDate" runat="server" Text='<%# Bind("EmissionDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtExpirationDate" runat="server" Text='<%# Bind("ExpirationDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td>
                                <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                            <td class="text-right">
                                <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                            </td>
                        </tr>
                    </InsertItemTemplate>

                </asp:ListView>

                <asp:DataPager ID="PoliciesDataPager" runat="server" PagedControlID="PolicyListView" PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>

            </ContentTemplate>

        </asp:UpdatePanel>
    </div>

    <asp:SqlDataSource ID="PoliciesDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="[transport].[sp_get_policies]" SelectCommandType="StoredProcedure"
        UpdateCommand="[transport].[sp_update_policy]" UpdateCommandType="StoredProcedure"
        DeleteCommand="[transport].[sp_delete_policy]" DeleteCommandType="StoredProcedure"
        InsertCommand="[transport].[sp_insert_policy]" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int32" />
            <asp:Parameter Name="EmissionDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int32" />
            <asp:Parameter Name="EmissionDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
        </DeleteParameters>

    </asp:SqlDataSource>
</asp:Content>
