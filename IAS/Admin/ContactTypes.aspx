<%@ Page Title="Tipos de Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactTypes.aspx.cs" Inherits="IAS.Admin.ContactTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Tipos de Contacto</h2>
    </div>

     <asp:UpdatePanel ID="upnlTiposContacto" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ContactTypesListView" runat="server"
                ItemType="IAS.Models.ContactType" DataKeyNames="ContactTypeID"
                SelectMethod="GetContactTypes"
                UpdateMethod="UpdateContactType"
                InsertMethod="InsertContactType"
                DeleteMethod="DeleteContactType"
                InsertItemPosition="LastItem"
                OnItemCanceling="ContactTypesListView_ItemCanceling"
                OnItemEditing="ContactTypesListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  
                                    <th>Tipo Contacto</th>
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
                            <asp:Label ID="lblDenomination" runat="server" Text='<%# Item.Description %>' />                            
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
                            <asp:TextBox ID="txtDenomination" runat="server" Text='<%# BindItem.Description%>' CssClass="form-control" />                            
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
                            <asp:TextBox ID="txtDenomination" runat="server" Text='<%# BindItem.Description%>' CssClass="form-control" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ContactTypesDataPager" runat="server" PagedControlID="ContactTypesListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
