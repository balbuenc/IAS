<%@ Page Title="Administración de Cumplimiento" Language="C#" MasterPageFile="~/CaseManagement.Master" AutoEventWireup="true" CodeBehind="ManageCumpliment.aspx.cs" Inherits="IAS.Collections.ManageCumpliment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px; padding-right: 10px; font-family: 'Segoe UI'; font-size: smaller">
        <div class="row">
            <div class="col-lg-8">
                <h3>Administración de Reportes de cumplimiento</h3>
            </div>
            <div class="col-lg-2">
                <h4>Objetivo</h4>
                <h4><span class="label label-success">
                    <asp:Label ID="txtObjetivo" runat="server" Text="0"></asp:Label></span></h4>
            </div>
            <div class="col-lg-2">
                <h4>Devolver</h4>
                <h4><span class="label label-danger">
                    <asp:Label ID="txtDevolver" runat="server" Text="0"></asp:Label></span></h4>
            </div>
        </div>

        <hr style="margin-top: 7px; margin-bottom: 5px; border-color: #3d4247; border-width: 2px" />
        <div class="row">
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control" DataValueField="UserID"
                    DataTextField="UserName" DataSourceID="UserSqldataSource" AppendDataBoundItems="true">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlPeriod" runat="server" CssClass="form-control" DataValueField="Period" DataTextField="Period" DataSourceID="PeriodSqldataSource"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlInsuranceManager" runat="server" CssClass="form-control" DataValueField="InsuranceManagerID" DataTextField="InsuranceManager"
                    DataSourceID="InsuranceManagerSqldataSource"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control" DataValueField="CurrencyID" DataTextField="Currency"
                    DataSourceID="CurrencySqldataSource"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlResult" runat="server" CssClass="form-control" DataValueField="CollectionManagementResultID" DataTextField="Result"
                    DataSourceID="ResultSqlDataSource"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            </div>


            <div class="col-lg-2" style="padding-top: 5px; display: -webkit-box">
                <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>

               <%-- <button id="btnNewTask" runat="server" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </button>--%>


            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>
        <hr style="margin-top: 7px; margin-bottom: 5px; border-color: #3d4247; border-width: 2px" />
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="40" AllowSorting="True" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
                    BorderWidth="1px" CellPadding="3" DataKeyNames="CollectionID,PolicyNumber" DataSourceID="CumplimentSqlDataSource" GridLines="Horizontal" Width="100%"
                    OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <%--<asp:BoundField DataField="CollectionID" HeaderText="ID" ReadOnly="True" SortExpression="CollectionID" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:BoundField>--%>
                        <asp:TemplateField>
                            <HeaderTemplate>ID</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCollectionID" runat="server" Text='<%# Eval("CollectionID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>Póliza</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>Recibo</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("ReceiptNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>Cuota</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPaymentNumber" runat="server" Text='<%# Eval("PaymentNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>Vencimiento</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPaymentDueDate" runat="server" Text='<%# string.Format("{0:d}", Eval("PaymentDueDate")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>Monto</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDebtAmount" runat="server" Text='<%# Eval("DebtAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>Riesgo</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Resultado
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblResult" runat="server" Text='<%# Eval("Result") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlResultEdit" runat="server" DataSourceID="ResultEditSqlDataSource"
                                    DataTextField="FullResult" DataValueField="CollectionStateID">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit" ShowHeader="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnedit" runat="server"
                                    CommandName="Edit" Text="Editar"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnupdate" runat="server"
                                    CommandName="Commit" Text="Aplicar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                <asp:LinkButton ID="btncancel" runat="server"
                                    CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </div>
        </div>
    </div>



    <!-- #region DATASOURCES -->


    <asp:SqlDataSource ID="UserSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[collection].[sp_get_users]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="PeriodSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="select distinct(left(date,6)) as period from collection.CollectionDWH order by 1 desc " SelectCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="InsuranceManagerSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="select InsuranceManagerID, InsuranceManager from dbo.InsuranceManagers order by InsuranceManagerID " SelectCommandType="Text"></asp:SqlDataSource>

    <asp:SqlDataSource ID="CurrencySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="select CurrencyID, Denomination as Currency from dbo.Currency order by 1 " SelectCommandType="Text"></asp:SqlDataSource>

    <asp:SqlDataSource ID="CumplimentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[collection].[sp_get_month_cumpliment_details_filtered]" SelectCommandType="StoredProcedure">

        <SelectParameters>
            <asp:ControlParameter ControlID="ddlUser" Name="UserID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPeriod" Name="period" PropertyName="SelectedValue" DbType="Int32" />
            <asp:ControlParameter ControlID="ddlInsuranceManager" Name="InsuranceManagerID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlCurrency" Name="CurrencyID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlResult" Name="CollectionManagementResultID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ResultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[collection].[sp_get_management_resuts]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ResultEditSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="select cr.CollectionStateID , upper(mr.Result) + ' (' + cs.CollectionStateName + ')' as FullResult , mr.Result from CollectionResult cr inner join CollectionManagementResult mr on cr.CollectionManagementResultID = mr.CollectionManagementResultID inner join CollectionState cs on cr.CollectionStateID = cs.CollectionStateID order by mr.Result " SelectCommandType="Text"></asp:SqlDataSource>



    <!-- #endregion -->



</asp:Content>
