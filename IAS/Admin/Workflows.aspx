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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Workflows.aspx.cs" Inherits="IAS.Admin.Workflows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Workflows</h2>
    </div>

    <asp:UpdatePanel ID="WorkflowUPanel" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />

            <asp:ListView ID="WorkflowsListView" runat="server"
                ItemType="IAS.Models.Workflow" DataKeyNames="WorkflowID"
                SelectMethod="GetData"
                UpdateMethod="Update"
                InsertMethod="Insert"
                DeleteMethod="Delete"
                InsertItemPosition="None"
                OnItemCanceling="WorkflowsListView_ItemCanceling"
                OnItemEditing="WorkflowsListView_ItemEditing" OnItemDataBound="WorkflowsListView_ItemDataBound">
                <LayoutTemplate>

                    <table class="table table-striped">

                        <thead>
                            <tr>
                                <th>Nombre del workflow</th>
                                <th>Formulario predeterminado</th>
                                <th>&nbsp;</th>
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
                            <asp:Label ID="lblName" runat="server" Text="<%#:Item.WorkflowName%>" />
                        </td>

                        <td>
                            <asp:Label ID="lblDefaultFormName" runat="server" Text="" />                        
                        </td>

                        <td class="text-right">

                            <asp:HyperLink ID="AlarmsHyperlink" NavigateUrl='<%# "~/Admin/WorkflowStateTransitions.aspx?WorkflowID=" + Item.WorkflowID %>' ImageUrl="~/Images/tasks-diagram-icon.png" runat="server" title="Configuracion de transiciones de estados">Transiciones</asp:HyperLink>&nbsp;&nbsp;
                            <asp:HyperLink ID="StatesFormsHyperlink" NavigateUrl='<%# "~/Admin/WorkflowStateForms.aspx?WorkflowID=" + Item.WorkflowID %>' ImageUrl="~/Images/form-icon.png" runat="server" title="Establecer formularios para los casos segun su estado">Formularios segun estados</asp:HyperLink>&nbsp;&nbsp;
                            <asp:HyperLink ID="TransitionsHyperLink" NavigateUrl='<%# "~/Admin/Alarms.aspx?WorkflowID=" + Item.WorkflowID %>' ImageUrl="~/Images/alert-icon.png" runat="server" title="Definicion de alarmas">Alarmas</asp:HyperLink>  
                            &nbsp;&nbsp;
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" Visible="true" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" Visible="false" />
                        
                        </td>

                    </tr>

                </ItemTemplate>

                <EditItemTemplate>

                    <tr>

                        <td>
                            <asp:Label ID="lblName" runat="server" Text="<%#:Item.WorkflowName%>" />
                        </td>

                        <td>
                             <asp:DropDownList ID="ddlDefaultForm" runat="server" SelectMethod="GetForms"
                                ItemType="IAS.Models.Form" DataTextField="FormName" DataValueField="FormID" CssClass="form-control"
                                SelectedValue="<%# BindItem.DefaultFormID %>" AppendDataBoundItems="true">
                                 <asp:ListItem Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>

                        <td class="text-right" colspan="2">
                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>

                    </tr>

                </EditItemTemplate>

                <InsertItemTemplate>

                    <tr>

                        <td>
                            <asp:TextBox ID="txtWorkflowName" runat="server" Text='<%#: BindItem.WorkflowName%>' CssClass="form-control" />
                        </td>

                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Insertar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <script>
                $("a[title]").tooltip();
            </script>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
