<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoleStateTransitions.aspx.cs" Inherits="IAS.Admin.RoleStateTransitions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script lang="javascript" type="text/javascript">
        $(document).ready(function () {
            $("[id$='chkAllRoles']").on('click', function () {
                $("[id$='chkRole']").attr('checked', this.checked);
            });
        });

        $(document).ajaxComplete(function () {
            $("[id$='chkAllRoles']").on('click', function () {
                $("[id$='chkRole']").attr('checked', this.checked);
            });
        });
    </script>
    <div class="page-header">

        <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <li>
                <asp:HyperLink ID="TransitionsHyperLink" runat="server">Transiciones de estados</asp:HyperLink>
            </li>
            <li class="active">Asignación de ROLES</li>
        </ol>

        <h2>Asignación de ROLES</h2>
        <small><u>Transicion de estado</u>:
           <strong><asp:Label ID="lblTransicion" runat="server" Text=""></asp:Label></strong></small>

    </div>

    <asp:UpdatePanel ID="upnlRoles" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="RoleStateTransitionListView" runat="server"
                ItemType="IAS.Models.RoleStateTransition" DataKeyNames="RoleStateTransitionID"
                SelectMethod="GetData">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="width:25px;">&nbsp;</th>
                                    <th>Usuarios permitidos</th>
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
                            <asp:CheckBox CssClass="selectOneRole" ID="chkSelectOneRole" runat="server" ClientIDMode="Static" />
                        </td>
                        <td>
                            <asp:Label ID="lblRoleName" runat="server" Text='<%# Item.ApplicationRole.Name %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="msg-box bg-warning">No hay roles con permisos a realizar esta transaccion</div>
                </EmptyDataTemplate>
            </asp:ListView>
            <div class="text-right">

                <asp:Button ID="AddButton" runat="server" Text="Asignar" CssClass="btn btn-info" OnClick="AddButton_Click" />
                <asp:Button ID="RemoveButton" runat="server" Text="Quitar" CssClass="btn btn-danger" OnClick="RemoveButton_Click" />

            </div>
            <asp:ListView ID="RolesListView" runat="server"
                ItemType="IAS.Models.ApplicationRole" DataKeyNames="Id"
                SelectMethod="GetRoles"
                CheckBoxes="true">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <%--<th><asp:CheckBox CssClass="selectAllRoles" ID="chkAllRoles" ToolTip="Selecciona todos" ClientIDMode="Static" runat="server" /></th>    --%>
                                    <th style="width:25px;">&nbsp;</th>
                                    <th>Roles sin permisos</th>
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
                            <asp:CheckBox CssClass="selectOneRole" ID="chkSelectOneRole" runat="server" ClientIDMode="Static" />
                        </td>
                        <td>
                            <asp:Label ID="lblRoleName" runat="server" Text='<%# Item.Name%>' />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
