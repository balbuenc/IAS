<%@ Page Title="Estados del Siniestro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimsStatus.aspx.cs" Inherits="IAS.Admin.ClaimsStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                OnItemEditing="ClaimStatusListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>                                  
                                    <th>Estado</th>
                                    
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

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>                      
                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# BindItem.Status%>' CssClass="form-control" />                                                       
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

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
