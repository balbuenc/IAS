<%@ Page Title="Destino de Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDestinations.aspx.cs" Inherits="IAS.Admin.ContactDestinations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Destinos de Contacto</h2>
    </div>

     <asp:UpdatePanel ID="upnlDestinosContacto" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ContactDestinationsListView" runat="server"
                ItemType="IAS.Models.ContactDestination" DataKeyNames="ContactDestinationID"
                SelectMethod="GetContactDestinations"
                UpdateMethod="UpdateContactDestination"
                InsertMethod="InsertContactDestination"
                DeleteMethod="DeleteContactDestination"
                InsertItemPosition="LastItem"
                OnItemCanceling="ContactDestinationsListView_ItemCanceling"
                OnItemEditing="ContactDestinationsListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  
                                    <th>Destino</th>
                                    <th>Activo</th>
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
                        <td>
                        <asp:Label ID="lblActive" runat="server" Text='<%# Item.Active %>' />    
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
                        <td>
                        <asp:TextBox ID="txtActive" runat="server" Text='<%# BindItem.Active%>' CssClass="form-control" />  
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
                         <td>
                           <asp:TextBox ID="txtActive" runat="server" Text='<%# BindItem.Active%>' CssClass="form-control" /> 
                             </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ContactDestinationsDataPager" runat="server" PagedControlID="ContactDestinationsListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
