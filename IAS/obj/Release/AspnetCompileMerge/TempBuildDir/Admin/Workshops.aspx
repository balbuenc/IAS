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

<%@ Page Title="Talleres" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkShops.aspx.cs" Inherits="IAS.Admin.WorkShops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Talleres</h2>
    </div>

     <asp:UpdatePanel ID="upnlTalleres" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="WorkShopsListView" runat="server"
                ItemType="IAS.Models.WorkShop" DataKeyNames="WorkshopID"
                SelectMethod="GetWorkShops"
                UpdateMethod="UpdateWorkShop"
                InsertMethod="InsertWorkShop"
                DeleteMethod="DeleteWorkShop"
                InsertItemPosition="LastItem"
                OnItemCanceling="WorkShopsListView_ItemCanceling"
                OnItemEditing="WorkShopsListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>                                  
                                    <th>Taller</th>
                                    <th>Dirección</th>
                                    <th>Telefono</th>
                                    <th>Nro. Móvil</th>
                                    <th>Email</th>
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
                            <asp:Label ID="lblName" runat="server" Text='<%# Item.Name %>' />                                                     
                        </td>
                        <td>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Item.Address %>' />    
                        </td>
                        <td>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Item.PhoneNumber %>' />    
                        </td>
                         <td>
                            <asp:Label ID="lblMobilePhoneNumber" runat="server" Text='<%# Item.MobilePhoneNumber %>' />    
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Item.Email %>' />    
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
                            <asp:TextBox ID="txtName" runat="server" Text='<%# BindItem.Name%>' CssClass="form-control" />                                                       
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# BindItem.Address%>' CssClass="form-control" />  
                         </td>
                        <td>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# BindItem.PhoneNumber %>' CssClass="form-control" />  
                         </td>
                        <td>
                            <asp:TextBox ID="txtMobilePhoneNumber" runat="server" Text='<%# BindItem.MobilePhoneNumber%>' CssClass="form-control" />  
                         </td>
                         <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# BindItem.Email%>' CssClass="form-control" />  
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
                            <asp:TextBox ID="txtName" runat="server" Text='<%# BindItem.Name%>' CssClass="form-control" />                                                       
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# BindItem.Address%>' CssClass="form-control" />  
                         </td>
                        <td>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# BindItem.PhoneNumber %>' CssClass="form-control" />  
                         </td>
                        <td>
                            <asp:TextBox ID="txtMobilePhoneNumber" runat="server" Text='<%# BindItem.MobilePhoneNumber%>' CssClass="form-control" />  
                         </td>
                         <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# BindItem.Email%>' CssClass="form-control" />  
                         </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="WorkShopsDataPager" runat="server" PagedControlID="WorkShopsListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
