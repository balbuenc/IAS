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

<%@ Page Title="Panel de Control" Language="C#" MasterPageFile="~/CaseManagement.Master" AutoEventWireup="true" CodeBehind="CommercialBoard.aspx.cs" Inherits="IAS.Dashboard.CommercialBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-1.12.4.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>


    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .bs-callout {
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #eee;
            border-left-width: 5px;
            border-radius: 3px;
        }

            .bs-callout h4 {
                margin-top: 0;
                margin-bottom: 5px;
            }

            .bs-callout p:last-child {
                margin-bottom: 0;
            }

            .bs-callout code {
                border-radius: 3px;
            }

            .bs-callout + .bs-callout {
                margin-top: -5px;
            }

        .bs-callout-default {
            border-left-color: #777;
        }

            .bs-callout-default h4 {
                color: #777;
            }

        .bs-callout-primary {
            border-left-color: #428bca;
        }

            .bs-callout-primary h4 {
                color: #428bca;
            }

        .bs-callout-success {
            border-left-color: #5cb85c;
        }

            .bs-callout-success h4 {
                color: #5cb85c;
            }

        .bs-callout-danger {
            border-left-color: #d9534f;
        }

            .bs-callout-danger h4 {
                color: #d9534f;
            }

        .bs-callout-warning {
            border-left-color: #f0ad4e;
        }

            .bs-callout-warning h4 {
                color: #f0ad4e;
            }

        .bs-callout-info {
            border-left-color: #5bc0de;
        }

            .bs-callout-info h4 {
                color: #5bc0de;
            }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>IAS | Tablero de control</h2>
            </div>
        </div>
        <div class="row">
            <div class="bs-callout bs-callout-success">
                <h4>AIB</h4>
                <div class="container-fluid">
                    <hr />
                    <div class="row">

                        <div class="col-lg-4">
                            <h4>Metas</h4>
                            <asp:GridView ID="GoalsGridView" runat="server" DataSourceID="GoalResume" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                Width="300px">
                                <Columns>
                                    <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" />
                                    <asp:BoundField DataField="Amount" HeaderText="Monto" SortExpression="Amount" DataFormatString="{0:C}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                        </div>

                        <div class="col-lg-4">
                            <h4>Cartera</h4>
                            <asp:GridView ID="TotalPoliciesAmountGridView" runat="server" DataSourceID="TotalPoliciesAmount" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                Width="300px">
                                <Columns>

                                    <asp:BoundField DataField="TotalPoliceAmount" HeaderText="Monto" SortExpression="TotalPoliceAmount" DataFormatString="{0:C}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                        </div>

                        <div class="col-lg-4">
                            <h4>Morosidad</h4>
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="Procastination" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                Width="300px">
                                <Columns>
                                    <asp:BoundField DataField="Morozidad" HeaderText="Morosidad" SortExpression="Morozidad" />
                                    <asp:BoundField DataField="DebtAmount" HeaderText="Monto" SortExpression="DebtAmount" DataFormatString="{0:C}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <ul><li><a href="https://app.powerbi.com/groups/me/dashboards/0fa2deb1-7e8b-4c54-a4e3-f3182f602af5" target="_blank">Cobranzas Detalles</a></li></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="bs-callout bs-callout-danger">
                <h4>Broker 2</h4>
                <div class="container-fluid">
                    <hr />
                    <div class="row">

                        <div class="col-lg-4">
                            <h4>Metas</h4>
                            <asp:GridView ID="GridView2" runat="server" DataSourceID="GoalResumeB1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                Width="300px">
                                <Columns>
                                    <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" />
                                    <asp:BoundField DataField="Amount" HeaderText="Monto" SortExpression="Amount" DataFormatString="{0:C}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                        </div>

                        <div class="col-lg-4">
                            <h4>Cartera</h4>
                            <asp:GridView ID="GridView3" runat="server" DataSourceID="TotalPoliciesAmountB1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                Width="300px">
                                <Columns>

                                    <asp:BoundField DataField="TotalPoliceAmount" HeaderText="Monto" SortExpression="TotalPoliceAmount" DataFormatString="{0:C}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                        </div>

                        <div class="col-lg-4">
                            <h4>Morosidad</h4>
                            <asp:GridView ID="GridView4" runat="server" DataSourceID="ProcastinationB1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                Width="300px">
                                <Columns>
                                    <asp:BoundField DataField="Morozidad" HeaderText="Morosidad" SortExpression="Morozidad" />
                                    <asp:BoundField DataField="DebtAmount" HeaderText="Monto" SortExpression="DebtAmount" DataFormatString="{0:C}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="bs-callout bs-callout-warning">
                <h4>Broker 3</h4>
            </div>
        </div>
    </div>
    <%-- AIB --%>
    <asp:SqlDataSource ID="GoalResume" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="SELECT [Moneda], [Amount]  FROM [commercial].[Dash_GetGoalsResume]" SelectCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TotalPoliciesAmount" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="SELECT [dbo].[fn_GetTotalPoliceAmount] (5500) as TotalPoliceAmount" SelectCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Procastination" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="commercial.Dash_GetProcastination" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <%-- Broker 1 --%>
    <asp:SqlDataSource ID="GoalResumeB1" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="SELECT [Moneda], [Amount] * 0.45 as Amount FROM [commercial].[Dash_GetGoalsResume]" SelectCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TotalPoliciesAmountB1" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="SELECT [dbo].[fn_GetTotalPoliceAmount] (5500) * 0.45 as TotalPoliceAmount" SelectCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ProcastinationB1" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="commercial.Dash_GetProcastinationB1" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
