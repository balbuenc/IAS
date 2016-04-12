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

<%@ Page Title="Asociados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Partners.aspx.cs" Inherits="IAS.Admin.Partners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Asociados</h2>
    </div>

    <asp:UpdatePanel ID="upnlPartners" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="PartnerListView" runat="server"
                DataKeyNames="PartnerID"
                DataSourceID="PartnerDataSource"
                InsertItemPosition="LastItem"
                OnItemCommand="PartnerListView_ItemCommand">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small">
                            <thead>
                                <th>ID.</th>
                                <th>Asociado</th>
                                <th>Pais</th>
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
                            <asp:Label ID="lblPartnerID" runat="server" Text='<%# Eval("PartnerID") %>' /></td>
                        <td>
                            <asp:Label ID="lblPartner" runat="server" Text='<%# Eval("Partner") %>' /></td>
                        <td>
                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>' /></td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPartnerID" runat="server" Text='<%# Bind("PartnerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartner" runat="server" Text='<%# Bind("Partner") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" DataSourceID="CountriesDataSource"
                                DataValueField="CountryID" DataTextField="Country" AppendDataBoundItems="true"
                                SelectedValue='<%#string.IsNullOrEmpty( Eval("CountryID").ToString())?-1:Eval("CountryID") %>'>
                            </asp:DropDownList>
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
                            <asp:Label ID="lblPartnerID" runat="server" Text="" CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartner" runat="server" Text='<%# Bind("Partner") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" DataSourceID="CountriesDataSource"
                                DataValueField="CountryID" DataTextField="Country" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="PartnersDataPager" runat="server" PagedControlID="PartnerListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="PartnerDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="[dbo].[sp_get_partners]" SelectCommandType="StoredProcedure"
        UpdateCommand="[dbo].[sp_update_partner]" UpdateCommandType="StoredProcedure"
        DeleteCommand="delete from dbo.Partner where PartnerID=@PartnerID " DeleteCommandType="Text"
        InsertCommand="[dbo].[sp_insert_partner]" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Partner" />
            <asp:Parameter Name="CountryID" />
        </InsertParameters>
        <UpdateParameters>
             <asp:Parameter Name="PartnerID" />
             <asp:Parameter Name="Partner" />
            <asp:Parameter Name="CountryID" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="PartnerID" Type="Int32" />
        </DeleteParameters>
       
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="CountriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[get_countries_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
