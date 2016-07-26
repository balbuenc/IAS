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

<%@ Page Title="Manage Currencies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Currencies.aspx.cs" Inherits="IAS.Admin.Currencies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2>Estados</h2>
    </div>

    <asp:UpdatePanel ID="upnlEstados" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="CurrenciesListView" runat="server"
                ItemType="IAS.Models.Currency" DataKeyNames="CurrencyID"
                SelectMethod="GetCurrencies"
                UpdateMethod="UpdateCurrency"
                InsertMethod="InsertCurrency"
                DeleteMethod="DeleteCurrency"
                InsertItemPosition="LastItem"
                OnItemCanceling="CurrenciesListView_ItemCanceling"
                OnItemEditing="CurrenciesListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Denominación</th>
                                    <th>&nbsp;</th>
                                </tr>
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
                            <asp:Label ID="lblCurrencyCode" runat="server" Text='<%# Item.Code%>' />
                        </td>
                        <td>
                            <asp:Label ID="lblDenomination" runat="server" Text='<%# Item.Denomination%>' />                            
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
                            <asp:TextBox ID="txtCurrencyCode" runat="server" Text='<%# BindItem.Code%>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtDenomination" runat="server" Text='<%# BindItem.Denomination%>' CssClass="form-control" />                            
                        </td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtCurrencyCode" runat="server" Text='<%#: BindItem.Code%>' CssClass="form-control" PlaceHolder="Nueva moneda" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtDenomination" runat="server" Text='<%# BindItem.Denomination%>' CssClass="form-control" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="CurrenciesDataPager" runat="server" PagedControlID="CurrenciesListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
