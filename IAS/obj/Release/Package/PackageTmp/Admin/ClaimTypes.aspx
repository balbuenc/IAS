<%@ Page Title="" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="ClaimTypes.aspx.cs" Inherits="IAS.Admin.ClaimTypes" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Tipos de coberturas</h2>
    </div>

    <asp:UpdatePanel ID="upnlClaimType" runat="server">
        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ClaimTypesListView" runat="server"
                ItemType="IAS.Models.ClaimType" DataKeyNames="ClaimTypeID"
                SelectMethod="GetClaimTypes"
                UpdateMethod="UpdateClaimType"
                InsertMethod="InsertClaimType"
                DeleteMethod="DeleteClaimType"
                InsertItemPosition="LastItem"
                OnItemCanceling="ClaimTypesListView_ItemCanceling"
                OnItemEditing="ClaimTypesListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Descripción</th>
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
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Item.Description %>' />
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
                            <asp:TextBox ID="txtClaymTypeDescripcion" runat="server" Text='<%# BindItem.Description %>' CssClass="form-control" />
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
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%#: BindItem.Description %>' CssClass="form-control" PlaceHolder="Nueva covertura" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>
            </asp:ListView>
            <asp:DataPager ID="ClaimTypesDataPager" runat="server" PagedControlID="ClaimTypesListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
