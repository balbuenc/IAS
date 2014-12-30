<%@ Page Title="Manage Collection Methods" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CollectionMethods.aspx.cs" Inherits="IAS.Admin.CollectionMethods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2>Estados</h2>
    </div>

    <asp:UpdatePanel ID="upnlEstados" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="CollectionMethodsListView" runat="server"
                ItemType="IAS.Models.CollectionMethod" DataKeyNames="CollectionMethodID"
                SelectMethod="GetCollectionMethods"
                UpdateMethod="UpdateCollectionMethod"
                InsertMethod="InsertCollectionMethod"
                DeleteMethod="DeleteCollectionMethod"
                InsertItemPosition="LastItem"
                OnItemCanceling="CollectionMethodsListView_ItemCanceling"
                OnItemEditing="CollectionMethodsListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Código</th>
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
                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Item.Code%>' />
                        </td>
                        <td>
                            <asp:Label ID="lblCollectionMethod" runat="server" Text='<%# Item.CollectionMethodName%>' />
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
                            <asp:TextBox ID="txtCodigo" runat="server" Text='<%# BindItem.Code%>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtCollectionMethodName" runat="server" Text='<%# BindItem.CollectionMethodName%>' CssClass="form-control" />
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
                            <asp:TextBox ID="txtCode" runat="server" Text='<%#: BindItem.Code%>' CssClass="form-control" PlaceHolder="Código" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtCollectionMethodName" runat="server" Text='<%#: BindItem.CollectionMethodName%>' CssClass="form-control" PlaceHolder="Descripción" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="CollectionMethodsDataPager" runat="server" PagedControlID="CollectionMethodsListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
