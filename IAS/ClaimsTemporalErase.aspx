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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimsTemporalErase.aspx.cs" Inherits="IAS.ClaimsTemporalErase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="tab-pane fade in active" id="collections">

        <div class="panel-heading">Siniestros Asignados a mi</div>

        <div class="text-left">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlDateInterval" runat="server" CssClass="form-control" AutoPostBack="true">
                                <asp:ListItem Selected="True" Value="Today">Hoy</asp:ListItem>
                                <asp:ListItem Value="CurrentWeek">Semana actual</asp:ListItem>
                                <asp:ListItem Value="NextWeek">Próxima semana</asp:ListItem>
                                <asp:ListItem Value="CurrentMonth">Mes actual</asp:ListItem>
                                <asp:ListItem Value="Oldest">Vencidos</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCasePriority" runat="server" CssClass="form-control" AutoPostBack="true"
                                SelectMethod="GetCasePriorities" DataTextField="PriorityName" DataValueField="CasePriorityID"
                                AppendDataBoundItems="true">
                                <asp:ListItem Text="Todas" Value="0" />
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" AutoPostBack="true"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="panel-body">

            <asp:UpdatePanel ID="ClaimsCaseListUPanel" runat="server">

                <ContentTemplate>

                    <asp:ListView ID="MyClaimsCasesListView" runat="server"
                        SelectMethod="GetMyCases"
                        ItemType="IAS.Models.Case"
                        DataKeyNames="CaseID"
                        OnItemCommand="MyClaimsCasesListView_ItemCommand"
                        AllowSorting="true">

                        <LayoutTemplate>

                            <div class="table responsive">

                                <table class="table table-striped">

                                    <thead>
                                        <tr>
                                            <th>Rpt.</th>
                                            <th>
                                                <asp:LinkButton ID="FactionListViewName" runat="server" CommandName="Sort"
                                                    CommandArgument="Description">Cliente</asp:LinkButton></th>
                                            <th>Prioridad</th>
                                            <th>Estado</th>
                                            <%--<th>Vencimiento</th>--%>
                                            <th>
                                                <asp:LinkButton ID="FactionListViewDueDate" runat="server" CommandName="Sort"
                                                    CommandArgument="EffectiveDate">Vencimiento</asp:LinkButton></th>

                                            <th></th>
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
                                    <a href="http://aibsql.cloudapp.net/ReportServer/Pages/ReportViewer.aspx?%2fIAS_SSRS%2fHistoricoCaso&rs:Command=Render&CaseID=<%# Item.CaseID %>" target="_blank">#</a>
                                </td>
                                <td>
                                    <asp:Label ID="lblCaseDescription" runat="server" Text='<%# Item.Description %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblCasePriority" runat="server" Text='<%# Item.CasePriority.PriorityName %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblEstado" runat="server" Text='<%#  Item.CurrentState.StateName %>' />
                                </td>
                                <td>
                                    <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# String.Format("{0:d}", Item.EffectiveDate )           %>' />
                                </td>
                                <td class="text-right">
                                    <asp:Button ID="ChangeUserButton" runat="server" Text="Tranferir caso" CommandName="ChangeUser" CommandArgument="<%# Item.CaseID %>" CssClass="btn btn-default" />
                                    <asp:Button ID="EditButton" runat="server" Text="Gestionar" CommandName="OpenCase" CommandArgument="<%# Item.CaseID %>" CssClass="btn btn-info" />
                                </td>
                            </tr>

                        </ItemTemplate>

                        <EmptyDataTemplate>
                            <div class="msg-box bg-warning">No hay Siniestros asignados a mi usuario</div>
                        </EmptyDataTemplate>

                    </asp:ListView></ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>
    </form>
</body>
</html>
