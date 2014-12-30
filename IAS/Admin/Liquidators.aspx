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

<%@ Page Title="Liquidadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Liquidators.aspx.cs" Inherits="IAS.Admin.Liquidators" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Liquidadores</h2>
    </div>

     <asp:UpdatePanel ID="upnlLiquidadores" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="LiquidatorsListView" runat="server"
                ItemType="IAS.Models.Liquidator" DataKeyNames="LiquidatorID"
                SelectMethod="GetLiquidators"
                UpdateMethod="UpdateLiquidator"
                InsertMethod="InsertLiquidator"
                DeleteMethod="DeleteLiquidator"
                InsertItemPosition="LastItem"
                OnItemCanceling="LiquidatorsListView_ItemCanceling"
                OnItemEditing="LiquidatorsListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>                                  
                                    <th>Liquidador</th>
                                    <th>Nro. Registro</th>
                                    <th>Email</th>
                                    <th>Nro. Móvil</th>
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
                            <asp:Label ID="lblResgistryNumber" runat="server" Text='<%# Item.RegistryNumber %>' />    
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Item.Email %>' />    
                        </td>
                        <td>
                            <asp:Label ID="lblMobilePhoneNumber" runat="server" Text='<%# Item.MobilePhoneNumber %>' />    
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
                            <asp:TextBox ID="txtRegistryNUmber" runat="server" Text='<%# BindItem.RegistryNumber%>' CssClass="form-control" />  
                         </td>
                         <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# BindItem.Email%>' CssClass="form-control" />  
                         </td>
                         <td>
                            <asp:TextBox ID="txtMobilePhoneNumber" runat="server" Text='<%# BindItem.MobilePhoneNumber%>' CssClass="form-control" />  
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
                            <asp:TextBox ID="txtRegistryNUmber" runat="server" Text='<%# BindItem.RegistryNumber%>' CssClass="form-control" />  
                         </td>
                         <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# BindItem.Email%>' CssClass="form-control" />  
                         </td>
                         <td>
                            <asp:TextBox ID="txtMobilePhoneNumber" runat="server" Text='<%# BindItem.MobilePhoneNumber%>' CssClass="form-control" />  
                         </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="LiquidatorsDataPager" runat="server" PagedControlID="LiquidatorsListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
