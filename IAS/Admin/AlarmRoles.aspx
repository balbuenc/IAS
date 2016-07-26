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

<%@ Page Title="" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="AlarmRoles.aspx.cs" Inherits="IAS.Admin.AlarmRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="page-header">

        <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <asp:HyperLink ID="AlarmHyperLink" runat="server">Alarmas</asp:HyperLink>
            <li class="active">Notificación a ROLES</li>
        </ol>

        <h2>Notificación a ROLES</h2>
        <small><u>Alarmas sobre el estado</u>:
           <strong><asp:Label ID="lblTransicion" runat="server" Text=""></asp:Label></strong></small>

    </div>

    <asp:ListView ID="AlarmRolesListView" runat="server"
        ItemType="IAS.Models.ApplicationRole" DataKeyNames="Id"
        SelectMethod="GetData"        
        InsertMethod="Insert"
        DeleteMethod="Delete"
        InsertItemPosition="LastItem"
        OnItemCanceling="AlarmRolesListView_ItemCanceling"
        OnItemEditing="AlarmRolesListView_ItemEditing">

        <LayoutTemplate>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Rol</th>
                        <td>&nbsp;</td>
                    </tr>
                </thead>

                <tbody>
                    <tr runat="server" id="itemPlaceholder" />
                </tbody>

            </table>

        </LayoutTemplate>

        <ItemTemplate>
            <tr>

                <td>
                    <asp:Label ID="lblName" runat="server" Text="<%#Item.Name %>" />
                </td>

                <td>
                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                </td>
                
            </tr>
        </ItemTemplate>
        
        <InsertItemTemplate>
          
            <tr>
                <td>
                    <asp:DropDownList ID="ddlRoles" runat="server" SelectMethod="GetRoles"
                        ItemType="IAS.Models.ApplicationRole" DataTextField="Name" DataValueField="Id" CssClass="form-control" />
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" Text="Insertar" CommandName="Insert" CssClass="btn btn-success" />
                </td>
            </tr>

        </InsertItemTemplate>
    
    </asp:ListView>
    <br />
    <asp:Label ID="ErrorLabel" runat="server" />
</asp:Content>
