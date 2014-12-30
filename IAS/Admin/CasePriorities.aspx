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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CasePriorities.aspx.cs" Inherits="IAS.Admin.CasePriorities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Prioridades de casos</h2>
    </div>

    <asp:UpdatePanel ID="upnlEstados" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="CasePrioritiesListView" runat="server"
                ItemType="IAS.Models.CasePriority" DataKeyNames="CasePriorityID"
                SelectMethod="GetCasePriorities"
                UpdateMethod="UpdateCasePriority"
                InsertMethod="InsertCasePriority"
                DeleteMethod="DeleteCasePriority"
                InsertItemPosition="LastItem"
                OnItemCanceling="CasePrioritiesListView_ItemCanceling"
                OnItemEditing="CasePrioritiesListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Prioridad</th>
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
                            <asp:Label ID="lblPriorityName" runat="server" Text='<%# Item.PriorityName%>' />
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
                            <asp:TextBox ID="txtPriority" runat="server" Text='<%# BindItem.PriorityName%>' CssClass="form-control" />
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
                            <asp:TextBox ID="txtPriority" runat="server" Text='<%# BindItem.PriorityName%>' CssClass="form-control" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Insertar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

        </ContentTemplate>

    </asp:UpdatePanel>


</asp:Content>
