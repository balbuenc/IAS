<%@ Page Title="" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Collection.aspx.cs" Inherits="IAS.Transports.Collection" %>

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
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
        <div class="row">
            <div class="col-lg-12">
                <h2>Cobranzas</h2>
            </div>
        </div>
        <div class="row">
            <hr />
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:ListView ID="CollectionListView"
                    runat="server"
                    DataKeyNames="CollectionID"
                    DataSourceID="CollectionDataSource"
                    RenderOuterTable="false"
                    InsertItemPosition="LastItem"
                    OnItemCommand="CollectionListView_ItemCommand">
                    <ItemTemplate>

                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                            <div class="col-lg-1">Fecha de pago:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtPaymentDueDate" runat="server" Text='<%# Bind("PaymentDueDate") %>' CssClass="form-control" />
                            </div>
                            <div class="col-lg-1">Nro de recibo:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtReceiptNumber" runat="server" Text='<%# Bind("ReceiptNumber") %>' CssClass="form-control" />
                            </div>
                            <div class="col-lg-1">Monto deuda:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtDebtAmount" runat="server" Text='<%# Bind("DebtAmount") %>' CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px;">
                            <div class="col-lg-1">Pagado:</div>
                            <div class="col-lg-3">
                                <asp:CheckBox ID="chkCollected" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg-1">Fecha:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtCollectedDate" runat="server" Text='<%# Bind("CollectedDate") %>' CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                            <div class="col-lg-1">Moneda</div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control" DataSourceID="CurrencyDataSource"
                                    DataValueField="CurrencyID" DataTextField="Denomination" SelectedValue='<%#string.IsNullOrEmpty( Eval("CurrencyID").ToString())?-1:Eval("CurrencyID") %>' />
                            </div>
                            <div class="col-lg-1">Estado de pago</div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlCollectionState" runat="server" CssClass="form-control" DataSourceID="CollectionStateDataSource"
                                    DataValueField="CollectionStateID" DataTextField="CollectionStateName" SelectedValue='<%#string.IsNullOrEmpty( Eval("CollectionStateID").ToString())?-1:Eval("CollectionStateID") %>' />
                            </div>
                            <div class="col-lg-1">Forma de pago</div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlCollectionMethod" runat="server" CssClass="form-control" DataSourceID="CollectionMethodDataSource"
                                    DataValueField="CollectionMethodID" DataTextField="CollectionMethodName" SelectedValue='<%#string.IsNullOrEmpty( Eval("CollectionMethodID").ToString())?-1:Eval("CollectionMethodID") %>' />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                            <div class="col-lg-1">Nro de poliza</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4" style="padding-top: 5px; padding-bottom: 5px">
                                <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                                <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                            </div>

                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="panel panel-default">

                            <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                <div class="col-lg-1">Fecha de pago:</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtPaymentDueDate" runat="server" Text='<%# Bind("PaymentDueDate") %>' CssClass="form-control" />
                                </div>
                                <div class="col-lg-1">Nro de recibo:</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtReceiptNumber" runat="server" Text='<%# Bind("ReceiptNumber") %>' CssClass="form-control" />
                                </div>
                                <div class="col-lg-1">Monto deuda:</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtDebtAmount" runat="server" Text='<%# Bind("DebtAmount") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row" style="padding-top: 5px; padding-bottom: 5px;">
                                <div class="col-lg-1">Pagado:</div>
                                <div class="col-lg-3">
                                    <asp:CheckBox ID="chkCollected" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-lg-1">Fecha:</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtCollectedDate" runat="server" Text='<%# Bind("CollectedDate") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                <div class="col-lg-1">Moneda</div>
                                <div class="col-lg-3">
                                    <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control" DataSourceID="CurrencyDataSource"
                                        DataValueField="CurrencyID" DataTextField="Denomination" SelectedValue='<%#string.IsNullOrEmpty( Eval("CurrencyID").ToString())?-1:Eval("CurrencyID") %>' />
                                </div>
                                <div class="col-lg-1">Estado de pago</div>
                                <div class="col-lg-3">
                                    <asp:DropDownList ID="ddlCollectionState" runat="server" CssClass="form-control" DataSourceID="CollectionStateDataSource"
                                        DataValueField="CollectionStateID" DataTextField="CollectionStateName" SelectedValue='<%#string.IsNullOrEmpty( Eval("CollectionStateID").ToString())?-1:Eval("CollectionStateID") %>' />
                                </div>
                                <div class="col-lg-1">Forma de pago</div>
                                <div class="col-lg-3">
                                    <asp:DropDownList ID="ddlCollectionMethod" runat="server" CssClass="form-control" DataSourceID="CollectionMethodDataSource"
                                        DataValueField="CollectionMethodID" DataTextField="CollectionMethodName" SelectedValue='<%#string.IsNullOrEmpty( Eval("CollectionMethodID").ToString())?-1:Eval("CollectionMethodID") %>' />
                                </div>
                            </div>
                            <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                <div class="col-lg-1">Objetivo al mes</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtMonthGoal" runat="server" Text='<%# Bind("MonthGoal") %>' CssClass="form-control" />
                                </div>
                                <div class="col-lg-1">Objetivo al año</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtYearGoal" runat="server" Text='<%# Bind("YearGoal") %>' CssClass="form-control" />
                                </div>
                                <div class="col-lg-1">Nro de poliza</div>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4" style="padding-top: 5px; padding-bottom: 5px">
                                    <asp:Button ID="btnActualizar" type="button" CommandName="Update" class="btn btn-primary btn-lg" runat="server" Text="Aceptar"></asp:Button>
                                </div>
                            </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                            <div class="col-lg-1">Fecha de pago:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtPaymentDueDate" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg-1">Nro de recibo:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtReceiptNumber" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg-1">Monto deuda:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtDebtAmount" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px;">
                            <div class="col-lg-1">Pagado:</div>
                            <div class="col-lg-3">
                                <asp:CheckBox ID="chkCollected" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg-1">Fecha:</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtCollectedDate" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                            <div class="col-lg-1">Moneda</div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control" DataSourceID="CurrencyDataSource"
                                    DataValueField="CurrencyID" DataTextField="Denomination" />
                            </div>
                            <div class="col-lg-1">Estado de pago</div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlCollectionState" runat="server" CssClass="form-control" DataSourceID="CollectionStateDataSource"
                                    DataValueField="CollectionStateID" DataTextField="CollectionStateName" />
                            </div>
                            <div class="col-lg-1">Forma de pago</div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlCollectionMethod" runat="server" CssClass="form-control" DataSourceID="CollectionMethodDataSource"
                                    DataValueField="CollectionMethodID" DataTextField="CollectionMethodName" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">

                            <div class="col-lg-1">Nro de poliza</div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtPolicyNumber" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4" style="padding-top: 5px; padding-bottom: 5px">
                                <asp:Button ID="btnInsertar" type="button" CommandName="Insertar" class="btn btn-primary btn-lg" runat="server" Text="Insertar"></asp:Button>
                            </div>
                        </div>
                    </InsertItemTemplate>

                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="msg-box bg-warning alert-danger">No se encontraron datos.</div>
                            </div>
                        </div>
                    </EmptyDataTemplate>

                </asp:ListView>
                <asp:DataPager ID="CollectionDataPager" runat="server" PagedControlID="CollectionListView" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="CollectionDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="[transport].[sp_get_collections_by_CertificateID]" SelectCommandType="StoredProcedure"
        UpdateCommand="[transport].[sp_update_collection]" UpdateCommandType="StoredProcedure"
        InsertCommand="[transport].[sp_insert_collection]" InsertCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CertificateID" QueryStringField="CertificateID" Type="Double" />
        </SelectParameters>

        <InsertParameters>
            <asp:Parameter Name="PaymentDueDate" Type="DateTime" />
            <asp:Parameter Name="ReceiptNumber" Type="Int64" />
            <asp:Parameter Name="DebtAmount" Type="Decimal" />
            <asp:Parameter Name="PaymentNumber" Type="Int32" />
            <asp:Parameter Name="Collected" Type="Boolean" />
            <asp:Parameter Name="CollectedDate" Type="DateTime" />
            <asp:Parameter Name="CurrencyID" Type="Int32" />
            <asp:Parameter Name="CollectionStateID" Type="Int32" />
            <asp:Parameter Name="CollectionMethodID" Type="Int32" />
            <asp:Parameter Name="MonthGoal" Type="Int32" />
            <asp:Parameter Name="YearGoal" Type="Int32" />
            <asp:Parameter Name="PolicyNumber" Type="Int64" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CollectionID" Type="Int64" />
            <asp:Parameter Name="PaymentDueDate" Type="DateTime" />
            <asp:Parameter Name="ReceiptNumber" Type="Int64" />
            <asp:Parameter Name="DebtAmount" Type="Decimal" />
            <asp:Parameter Name="PaymentNumber" Type="Int32" />
            <asp:Parameter Name="Collected" Type="Boolean" />
            <asp:Parameter Name="CollectedDate" Type="DateTime" />
            <asp:Parameter Name="CurrencyID" Type="Int32" />
            <asp:Parameter Name="CollectionStateID" Type="Int32" />
            <asp:Parameter Name="CollectionMethodID" Type="Int32" />
            <asp:Parameter Name="MonthGoal" Type="Int32" />
            <asp:Parameter Name="YearGoal" Type="Int32" />
            <asp:Parameter Name="PolicyNumber" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CollectionMethodDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[get_collection_method_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CollectionStateDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[get_collection_state_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CurrencyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[get_currency_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
