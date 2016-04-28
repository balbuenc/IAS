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

<%@ Page Title="Estados del Siniestro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimsStatus.aspx.cs" Inherits="IAS.Admin.ClaimsStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modal-wide1 .modal-dialog {
            width: 80%; /* or whatever you wish */
        }
    </style>
    <div class="page-header">
        <h2>Estado del Siniestro</h2>
    </div>

    <asp:UpdatePanel ID="upnlEstadosSiniestros" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ClaimStatusListView" runat="server"
                ItemType="IAS.Models.ClaimStatu" DataKeyNames="ClaimStatusID"
                SelectMethod="GetClaimStatus"
                UpdateMethod="UpdateClaimStatus"
                InsertMethod="InsertClaimStatus"
                DeleteMethod="DeleteClaimStatus"
                InsertItemPosition="LastItem"
                OnItemCanceling="ClaimStatusListView_ItemCanceling"
                OnItemEditing="ClaimStatusListView_ItemEditing"
                OnItemCommand="ClaimStatusListView_ItemCommand">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Estado</th>
                                    <th>Form</th>
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
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Item.Status %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblForm" runat="server" Text='<%# Item.Form %>' />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="SubStatusButton" runat="server" Text="Sub estados" CommandName="SubStatus" CommandArgument='<%# Item.ClaimStatusID %>' CssClass="btn btn-warning" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>

                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# BindItem.Status %>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtForm" runat="server" Text='<%# BindItem.Form %>' CssClass="form-control" />
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
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# BindItem.Status%>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtForm" runat="server" Text='<%# BindItem.Form%>' CssClass="form-control" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ClaimStatusDataPager" runat="server" PagedControlID="ClaimStatusListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

            <div class="modal fade modal-wide1" id="myModalSubStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                            <h4 class="modal-title" id="H5">Lista de Sub-Estados</h4>
                        </div>
                        <br />
                        <div class="form-horizontal" role="form">
                            <div class="row" style="padding-left: 20px; padding-right: 20px; font-size: x-small !important;">
                                <div class="col-lg-12">
                                   <%-- <asp:ListView ID="ClaimSubStatusListView" runat="server"
                                        DataKeyNames="ClaimStatusID"
                                        SelectMethod="GetClaimStatus"
                                        UpdateMethod="UpdateClaimStatus"
                                        InsertMethod="InsertClaimStatus"
                                        DeleteMethod="DeleteClaimStatus"
                                        InsertItemPosition="LastItem"
                                        OnItemCanceling="ClaimStatusListView_ItemCanceling"
                                        OnItemEditing="ClaimStatusListView_ItemEditing"
                                        OnItemCommand="ClaimStatusListView_ItemCommand">
                                        <LayoutTemplate>
                                            <div class="table responsive">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Estado</th>
                                                            <th>Form</th>
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
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Item.Status %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblForm" runat="server" Text='<%# Item.Form %>' />
                                                </td>
                                                <td class="text-right">
                                                    <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                                                    <asp:Button ID="SubStatusButton" runat="server" Text="Sub estados" CommandName="SubStatus" CommandArgument='<%# Item.ClaimStatusID %>' CssClass="btn btn-warning" />
                                                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <tr>

                                                <td>
                                                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# BindItem.Status %>' CssClass="form-control" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtForm" runat="server" Text='<%# BindItem.Form %>' CssClass="form-control" />
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
                                                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# BindItem.Status%>' CssClass="form-control" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtForm" runat="server" Text='<%# BindItem.Form%>' CssClass="form-control" />
                                                </td>
                                                <td class="text-right">
                                                    <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                                                </td>
                                            </tr>
                                        </InsertItemTemplate>

                                    </asp:ListView>--%>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        function openModalSubStatus() {
            $('#myModalSubStatus').modal('show');
        }

    </script>

</asp:Content>
