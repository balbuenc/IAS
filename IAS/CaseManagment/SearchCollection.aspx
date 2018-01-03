<%@ Page Title="Búsqueda de Cuotas" Language="C#" MasterPageFile="~/CaseManagement.Master" AutoEventWireup="true" CodeBehind="SearchCollection.aspx.cs" Inherits="IAS.CaseManagment.SearchCollection" %>

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
    <div class="container" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
        <div class="row">
            <h3 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">BÚSQUEDA DE CUOTAS</h3>
        </div>
        <div class="row">
            <div class="container-fluid" style="padding-left: 3px; padding-right: 3px;">

                <div class="row">
                    <div class="col-lg-6">
                        <div class='input-group date' id='datetimepicker1'>
                            <input id="dpDueDate" placeholder="Vencimiento" class="form-control" runat="server" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>

                    </div>

                </div>

            </div>
            <hr />
            <div class="container-fluid" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding-left: 15px; padding-right: 15px">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

                <asp:ListView ID="CollectionListView" runat="server"
                    DataKeyNames="CollectionID">

                    <LayoutTemplate>
                        <div class="table responsive">
                            <table class="table table-striped" style="font-size: x-small">
                                <thead>
                                    <th class="visible-lg">ID. CASO</th>
                                    <th>CASO</th>
                                    <th>RIESGO</th>
                                    <th>VENCIMIENTO</th>
                                    <th>MONTO</th>
                                    <th>MONEDA</th>
                                    <th>ESTADO</th>
                                    <th>Póliza</th>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder" />
                                </tbody>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="visible-lg">
                                <%--<asp:Label ID="lblcaseID" runat="server" Text='<%# Eval("caseID") %>' />--%>
                                <%--<a href="ManageCase?CaseID=" + <%# Eval("CaseID") %> title='<%# Eval("caseID") %>' ></a>--%>
                                
                                <asp:HyperLink ID="linkCaseID" runat="server" Text='<%# Eval("caseID") %>' NavigateUrl='<%#String.Format("/CaseManagment/ManageCase.aspx?CaseID={0}"  , Eval("CaseID")).ToString() %>' ></asp:HyperLink>
                            </td>
                            <td>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblPaymentDueDate" runat="server" Text='<%#:String.Format("{0:d}",Eval("PaymentDueDate")) %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblDebtAmount" runat="server" Text='<%#:String.Format("{0:n2}",Eval("DebtAmount")) %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblCurrency" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblCollectionStateName" runat="server" Text='<%# Eval("CollectionStateName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblPoliza" runat="server" Text='<%# Eval("PolicyNumber") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <EmptyDataTemplate>
                        <h5 style="color: lightgray; text-align: center; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"><span class="glyphicon glyphicon-comment"></span>NO SE ENCONTRARON CASOS.</h5>
                    </EmptyDataTemplate>

                </asp:ListView>



            </div>
            <asp:SqlDataSource ID="CollectionDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="[collection].[sp_get_collections_by_duedate]" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dpDueDate" Name="PaymentDueDate" PropertyName="value" Type="DateTime" />
                </SelectParameters>

            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
