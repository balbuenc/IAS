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

<%@ Page Title="Secciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sections.aspx.cs" Inherits="IAS.Admin.Sections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Secciones</h2>
    </div>

    <asp:UpdatePanel ID="upnlSecciones" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="SectionListView" runat="server"
                DataKeyNames="SectionNumber"
                DataSourceID="SectionDataSource"
                InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <th>Nro. Sección</th>
                                <th>Sección</th>
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
                            <asp:Label ID="lblSectionNumber" runat="server" Text='<%# Eval("SectionNumber") %>' /></td>
                        <td>
                            <asp:Label ID="lblSection" runat="server" Text='<%# Eval("Section") %>' /></td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblSectionNumber" runat="server" Text='<%# Eval("SectionNumber") %>' /></td>
                        <td>
                            <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("Section") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtSectionNumber" runat="server" Text='<%# Bind("SectionNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("Section") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ClaimStatusDataPager" runat="server" PagedControlID="SectionListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="SectionDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="select SectionNumber, Section from dbo.section" SelectCommandType="Text"
        UpdateCommand="update dbo.section set  Section=@Section where SectionNumber=@SectionNumber" UpdateCommandType="Text"
        DeleteCommand="delete from dbo.Section where SectionNumber=@SectionNumber" DeleteCommandType="Text"
        InsertCommand="insert into dbo.Section (SectionNumber, Section) values (@SectionNumber, @Section)" InsertCommandType="Text">

        <DeleteParameters>
            <asp:Parameter Name="SectionNumber" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="SectionNumber" Type="Int32" />
            <asp:Parameter Name="Section" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="SectionNumber" Type="Int32" />
            <asp:Parameter Name="Section" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>



</asp:Content>
