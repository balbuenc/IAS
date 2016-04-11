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


<%@ Page Title="Paises" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Countries.aspx.cs" Inherits="IAS.Admin.Countries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Paises</h2>
    </div>

    <asp:UpdatePanel ID="upnlPaises" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="CountryListView" runat="server"
                DataKeyNames="CountryID"
                DataSourceID="CountryDataSource"
                InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <th>Id. Pais</th>
                                <th>Pais</th>
                                <th>Símbolo</th>
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
                            <asp:Label ID="lblCountryID" runat="server" Text='<%# Eval("CountryID") %>' /></td>
                        <td>
                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>' /></td>
                        <td>
                            <asp:Label ID="lblSymbol" runat="server" Text='<%# Eval("Symbol") %>' /></td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtCountryID" runat="server" Text='<%# Bind("CountryID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSymbol" runat="server" Text='<%# Bind("Symbol") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblCountryID" runat="server" Text="" CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSymbol" runat="server" Text='<%# Bind("Symbol") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ContriesDataPager" runat="server" PagedControlID="CountryListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="CountryDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="select CountryID, Country, Symbol from dbo.country" SelectCommandType="Text"
        UpdateCommand="update dbo.country set  Country=@Country, Symbol=@Symbol where CountryID=@CountryID" UpdateCommandType="Text"
        DeleteCommand="delete from dbo.country where CountryID=@CountryID" DeleteCommandType="Text"
        InsertCommand="insert into dbo.country (Country, Symbol) values (@Country, @Symbol)" InsertCommandType="Text">

        <DeleteParameters>
            <asp:Parameter Name="CountryID" Type="Int32" />
          
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CountryID" Type="Int32" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Symbol" Type="String" />
        </UpdateParameters>
        <InsertParameters>
             <asp:Parameter Name="CountryID" Type="Int32" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Symbol" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>


</asp:Content>
