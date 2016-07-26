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

<%@ Page Title="" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true"
    CodeBehind="WorkflowStateTransitions.aspx.cs" Inherits="IAS.Admin.WorkflowStateTransitions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="page-header">

        <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <li class="active">Transiciones estados</li>
        </ol>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10">
                    <h2>Transiciones de estados</h2>
                    <small>Las transiciones definen los posibles cambios de estados a ser realizados por los usuarios a partir de un estado inical de un Workflow en particular</small>
                </div>
                <div class="col-md-2 text-right" style="padding-top:30px;">
                    <button class="btn btn-default" id="showChartButton">Ver diagrama</button>
                </div>
            </div>
        </div>

    </div>

    <asp:UpdatePanel ID="TransitionUpdatePanel" runat="server">

        <ContentTemplate>

            <div class="form-group">
                <label>Workflow:</label>
                <asp:DropDownList runat="server" ID="ddlWorkflows" SelectMethod="GetWorkflows" DataTextField="WorkflowName"
                    DataValueField="WorkflowID" AutoPostBack="true" CssClass="form-control" />
            </div>

            <asp:Label ID="ErrorLabel" runat="server" Visible="false" CssClass="msg-box bg-danger" />

            <asp:ListView ID="WorkflowStateTransitionsListView" runat="server" EnableViewState="true"
                ItemType="IAS.Models.WorkflowStateTransition" DataKeyNames="WorkflowStateTransitionID"
                SelectMethod="GetData"
                UpdateMethod="Update"
                InsertMethod="Insert"
                DeleteMethod="Delete"
                InsertItemPosition="LastItem"
                OnItemCanceling="WorkflowStateTransitionsListView_ItemCanceling"
                OnItemEditing="WorkflowStateTransitionsListView_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Estado inicial</th>
                                <th>Estado final</th>
                                <th>Permitir agendar</th>
                                <th colspan="2">&nbsp;</th>
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
                            <asp:Label ID="lblInitialState" runat="server" Text="<%#Item.InicialState %>" />
                        </td>
                        <td>
                            <asp:Label ID="lblFinal" runat="server" Text="<%#Item.FinalState %>" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkEditableEffectiveDate" Checked="<%#Item.EditableEffectiveDate %>" Enabled="false" runat="server" />
                        </td>
                        <td class="text-center">
                            <asp:HyperLink ID="WorkflowTransitionRolesHyperLink" NavigateUrl='<%# "~/Admin/RoleStateTransitions.aspx?WorkflowStateTransitionID=" + Item.WorkflowStateTransitionID %>' ImageUrl="~/Images/users-icon.png" runat="server" title="ROLES habilitados a realizar el cambio de estado">Roles asociados</asp:HyperLink>
                            <asp:HyperLink ID="WorkflowTransitionUsersHyperlink" NavigateUrl='<%# "~/Admin/UserStateTransitions.aspx?WorkflowStateTransitionID=" + Item.WorkflowStateTransitionID %>' ImageUrl="~/Images/user-icon.png" runat="server" title="USUARIOS habilitados a realizar el camvio de estado">Usuarios asociados</asp:HyperLink>
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
                            <asp:DropDownList ID="ddlInitialState" runat="server" SelectMethod="GetStates"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID"
                                SelectedValue='<%#BindItem.InitialStateID %>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlFinalState" runat="server" SelectMethod="GetStates"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID"
                                SelectedValue='<%#BindItem.FinalStateID %>' CssClass="form-control" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkEditableEffectiveDate" Checked="<%# BindItem.EditableEffectiveDate %>" runat="server" />
                        </td>
                        <td>&nbsp;</td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>

                    </tr>
                </EditItemTemplate>

                <EmptyDataTemplate>
                    No se encontraron datos para mostrar
                </EmptyDataTemplate>

                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlInitialState" runat="server" SelectMethod="GetStates"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID"
                                SelectedValue='<%#BindItem.InitialStateID %>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlFinalState" runat="server" SelectMethod="GetStates"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID"
                                SelectedValue='<%#BindItem.FinalStateID %>' CssClass="form-control" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkEditableEffectiveDate" Checked="<%# BindItem.EditableEffectiveDate %>" runat="server" />
                        </td>
                        <td>&nbsp;</td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Adicionar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="TransitionDataPager" runat="server" PagedControlID="WorkflowStateTransitionsListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <div id="chartWindow" class="modal fade modal-lg" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="form-group">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Diagrama de transicion de estados</h4>
                    </div>
                    <div class="modal-body">
                        <iframe src="StatesTransitionsChart.aspx" style="width: auto; height: 480px; border: 0;"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("a[title]").tooltip();
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $("a[title]").tooltip();
        });

        $('#showChartButton').click(function (e) {
            e.preventDefault();
            $('#chartWindow').on('shown.bs.modal', function () {
                $('iframe')
                    .attr("src", "StatesTransitionsChart.aspx?WorkflowID=" + $("#<%= this.ddlWorkflows.ClientID %>").val())
                    .css("width", "100%");
            });
            $('#chartWindow').modal({ show: true })
        });

    </script>

</asp:Content>
