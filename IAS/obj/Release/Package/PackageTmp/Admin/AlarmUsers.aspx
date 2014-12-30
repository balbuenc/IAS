<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlarmUsers.aspx.cs" Inherits="IAS.Admin.AlarmUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">

        <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <asp:HyperLink ID="AlarmHyperLink" runat="server">Alarmas</asp:HyperLink>
            <li class="active">Notificación a USUARIOS</li>
        </ol>

        <h2>Notificación a USUARIOS</h2>
        <small><u>Alarmas sobre el estado</u>:
           <strong>
               <asp:Label ID="lblTransicion" runat="server" Text=""></asp:Label></strong></small>

    </div>

    <asp:ListView ID="AlarmUsersListView" runat="server"
        ItemType="IAS.Models.ApplicationUser" DataKeyNames="Id"
        SelectMethod="GetData"
        InsertMethod="Insert"
        DeleteMethod="Delete"
        InsertItemPosition="LastItem"
        OnItemCanceling="AlarmUsersListView_ItemCanceling"
        OnItemEditing="AlarmUsersListView_ItemEditing">

        <LayoutTemplate>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Usuario</th>
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
                    <asp:Label ID="lblName" runat="server" Text="<%#Item.FullName %>" />
                </td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                </td>

            </tr>
        </ItemTemplate>

        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlUsers" runat="server" SelectMethod="GetUsers"
                        ItemType="IAS.Models.ApplicationUser" DataTextField="FullName" DataValueField="Id" CssClass="form-control" />
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
