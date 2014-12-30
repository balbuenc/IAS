<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserStateTransitions.aspx.cs" Inherits="IAS.Admin.UserStateTransitions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script lang="javascript" type="text/javascript">

        $(document).ready(function () {
            $("[id$='chkAllUsers']").on('click', function () {
                $("[id$='chkUser']").attr('checked', this.checked);
            });
        });

        $(document).ajaxComplete(function () {
            $("[id$='chkAllUsers']").on('click', function () {
                $("[id$='chkUser']").attr('checked', this.checked);
            });
        });

    </script>
    <div class="page-header">

        <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <asp:HyperLink ID="TransitionsHyperLink" runat="server">Transiciones de estados</asp:HyperLink>
            <li class="active">Asignacion de Usuarios</li>
        </ol>

        <h2>Asignacion de usuarios</h2>
        <small><u>Transicion de estado</u>:
           <strong><asp:Label ID="lblTransicion" runat="server" Text=""></asp:Label></strong></small>

    </div>
    <asp:UpdatePanel ID="upnlUsers" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="UserStateTransitionListView" runat="server"
                ItemType="IAS.Models.UserStateTransition" DataKeyNames="UserStateTransitionID"
                SelectMethod="GetData">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 25px;">&nbsp;</th>
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
                            <asp:CheckBox CssClass="selectOneUser" ID="chkSelectOneUser" runat="server" ClientIDMode="Static" />
                        </td>
                        <td>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Item.ApplicationUser.FullName %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="msg-box bg-warning">No hay usuarios con permisos a realizar esta transaccion</div>
                </EmptyDataTemplate>
            </asp:ListView>
            <div class="text-right">

                <asp:Button ID="AddButton" runat="server" Text="Asignar" CssClass="btn btn-info" OnClick="AddButton_Click" />
                <asp:Button ID="RemoveButton" runat="server" Text="Quitar" CssClass="btn btn-danger" OnClick="RemoveButton_Click" />

            </div>
            <asp:ListView ID="UsersListView" runat="server"
                ItemType="IAS.Models.ApplicationUser" DataKeyNames="Id"
                SelectMethod="GetUsers"
                CheckBoxes="true">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <%--<th><asp:CheckBox CssClass="selectAllUsers" ID="chkAllUsers" ToolTip="Selecciona todos" ClientIDMode="Static" runat="server" /></th>    --%>
                                    <th style="width: 25px;">&nbsp;</th>
                                    <th>Usuarios sin permisos</th>
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
                            <asp:CheckBox CssClass="selectOneUser" ID="chkSelectOneUser" runat="server" ClientIDMode="Static" />
                        </td>
                        <td>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Item.FullName%>' />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
