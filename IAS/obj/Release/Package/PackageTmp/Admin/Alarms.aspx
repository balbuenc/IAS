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

<%@ Page Title="" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="Alarms.aspx.cs" Inherits="IAS.Admin.Alarms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        
        <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <li class="active">Alarmas</li>
        </ol>

        <h2>Configuración de Alarmas</h2>
        <small>Las alarmas son utilizadas para notificar a ciertos usuarios cuando algun "caso" esta superando el tiempo ideal de procesamiento segun el estado en el que se encuentra.</small>
    
    </div>

    <asp:UpdatePanel ID="AlarmUpdatePanel" runat="server">

        <ContentTemplate>

            <div class="form-group">
                <label>Workflow:</label>
                <asp:DropDownList runat="server" ID="ddlWorkflows" SelectMethod="GetWorkflows" DataTextField="WorkflowName"
                    DataValueField="WorkflowID" AutoPostBack="true" CssClass="form-control" />
            </div>

            <asp:Label ID="ErrorLabel" runat="server" Visible="false" CssClass="msg-box bg-danger" />

            <asp:ListView ID="AlarmsListView" runat="server"
                ItemType="IAS.Models.Alarm" DataKeyNames="AlarmID"
                SelectMethod="GetData"
                UpdateMethod="Update"
                InsertMethod="Insert"
                DeleteMethod="Delete"
                InsertItemPosition="LastItem"
                OnItemCanceling="AlarmsListView_ItemCanceling"
                OnItemEditing="AlarmsListView_ItemEditing" >

                <LayoutTemplate>

                    <div class="table responsive">

                        <table class="table table-striped">

                            <thead>
                                <tr>
                                    <th>Estado</th>
                                    <th>Tiempo para notificación</th>
                                    <th class="text-center">Activo</th>
                                    <th>&nbsp;</th>
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
                            <asp:Label ID="lblState" runat="server" Text="<%#Item.State %>" />
                        </td>

                        <td>
                            <asp:Label ID="lblInterval" runat="server" Text="<%#Item.Interval %>" />
                            hs.
                        </td>

                        <td class="text-center">
                            <asp:CheckBox runat="server" ID="chkState" Checked="<%#BindItem.Active %>" />
                        </td>

                        <td class="text-center">
                            <asp:HyperLink ID="AlarmRolesHyperLink" NavigateUrl='<%# "~/Admin/AlarmRoles.aspx?AlarmID=" + Eval("AlarmID") %>' ImageUrl="~/Images/users-icon.png" runat="server" title="ROLES a notificar cuando se enciende una alarma">Roles asociados</asp:HyperLink>
                            <asp:HyperLink ID="AlarmUsersHyperlink" NavigateUrl='<%# "~/Admin/AlarmUsers.aspx?AlarmID=" + Eval("AlarmID") %>' ImageUrl="~/Images/user-icon.png" runat="server" title="USUARIOS a notificar cuando se enciende una alarma">Usarios asociados</asp:HyperLink>
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
                            <asp:DropDownList ID="ddlState" runat="server" SelectMethod="GetStates"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID"
                                SelectedValue='<%#BindItem.StateID %>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtInterval" runat="server" Text="<%#BindItem.Interval %>" CssClass="form-control" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox runat="server" ID="chkState" Checked="<%#BindItem.Active %>" />
                        </td>
                        <td>&nbsp;</td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>

                <InsertItemTemplate>

                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlState" runat="server" SelectMethod="GetStates"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID"
                                SelectedValue='<%#BindItem.StateID %>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtInterval" runat="server" Text="<%#BindItem.Interval %>" CssClass="form-control" PlaceHolder="Horas (numerico)" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox runat="server" ID="chkState" Checked="<%#BindItem.Active %>" />
                        </td>
                        <td>&nbsp;</td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>

                </InsertItemTemplate>

                <EmptyDataTemplate>

                    <div class="bg-danger">
                        No se encontraron datos para mostrar
                    </div>

                </EmptyDataTemplate>

            </asp:ListView>

            <asp:DataPager ID="AlarmsDataPager" runat="server" PagedControlID="AlarmsListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

             <script>
                 $("a[title]").tooltip();
            </script>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
