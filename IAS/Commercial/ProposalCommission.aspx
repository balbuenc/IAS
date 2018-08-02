<%@ Page Title="Comisiones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProposalCommission.aspx.cs" Inherits="IAS.Commercial.ProposalCommission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Comisiones</h2>
    </div>

    <asp:UpdatePanel ID="upnlProposals" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ProposalCommissionListView" runat="server"
                DataKeyNames="Commission"
                DataSourceID="ProposalCommissionDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                            <thead>
                                <th>Comision</th>
                                <th>Forma Pago</th>
                                <th>Tipo</th>
                                <th>Origen</th>
                                <th>% Comision</th>
                                <th>% Agente</th>
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
                            <asp:Label ID="lblCommission" runat="server" Text='<%# Eval("Commission") %>' /></td>
                        <td>
                            <asp:Label ID="lblPaymentTypeID" runat="server" Text='<%# Eval("PaymentType") %>' /></td>
                        <td>
                            <asp:Label ID="lblProposalTypeID" runat="server" Text='<%# Eval("ProposalType") %>' /></td>
                        <td>
                            <asp:Label ID="lblProposalOriginID" runat="server" Text='<%# Eval("ProposalOrigin") %>' /></td>
                        <td>
                            <asp:Label ID="lblBrokerRate" runat="server" Text='<%# Eval("BrokerRate") %>' /></td>
                        <td>
                            <asp:Label ID="lblAgentRate" runat="server" Text='<%# Eval("AgentRate") %>' /></td>
                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtCommission" runat="server" Text='<%# Bind("Commission") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPaymentTypeID" runat="server" Text='<%# Bind("PaymentTypeID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtProposalTypeID" runat="server" Text='<%# Bind("ProposalTypeID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtProposalOriginID" runat="server" Text='<%# Bind("ProposalOriginID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBrokerRate" runat="server" Text='<%# Bind("BrokerRate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtAgentRate" runat="server" Text='<%# Bind("AgentRate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>

                        <td>
                            <asp:TextBox ID="txtCommission" runat="server" Text='<%# Bind("Commission") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <%--<asp:TextBox ID="txtPaymentTypeID" runat="server" Text='<%# Bind("PaymentTypeID") %>' CssClass="form-control" Font-Size="X-Small" /></td>--%>
                            <asp:DropDownList ID="PaymentTypeDDL" runat="server" CssClass="form-control" DataSourceID="PaymentTypesDataSource"
                                DataValueField="PaymentTypeID" DataTextField="PaymentType" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        <td>
                            <%--<asp:TextBox ID="txtProposalTypeID" runat="server" Text='<%# Bind("ProposalTypeID") %>' CssClass="form-control" Font-Size="X-Small" /></td>--%>
                            <asp:DropDownList ID="ProposalTypeDDL" runat="server" CssClass="form-control" DataSourceID="ProposalTypesDataSource"
                                DataValueField="ProposalTypeID" DataTextField="ProposalType" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        <td>
                            <%--<asp:TextBox ID="txtProposalOriginID" runat="server" Text='<%# Bind("ProposalOriginID") %>' CssClass="form-control" Font-Size="X-Small" /></td>--%>
                            <asp:DropDownList ID="ProposalOriginDDL" runat="server" CssClass="form-control" DataSourceID="ProposalOriginsDataSource"
                                DataValueField="ProposalOriginID" DataTextField="ProposalOrigin" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        <td>
                            <asp:TextBox ID="txtBrokerRate" runat="server" Text='<%# Bind("BrokerRate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtAgentRate" runat="server" Text='<%# Bind("AgentRate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ProposalDataPager" runat="server" PagedControlID="ProposalCommissionListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>



            <asp:SqlDataSource ID="ProposalCommissionDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="commercial.sp_get_proposal_commissions" SelectCommandType="StoredProcedure"
                UpdateCommand="commercial.sp_update_proposal_commission" UpdateCommandType="StoredProcedure"
                DeleteCommand="commercial.sp_delete_proposal_commission" DeleteCommandType="StoredProcedure"
                InsertCommand="commercial.sp_insert_proposal_commission" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="Commission" Type="Int64" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Commission" Type="String" />
                    <asp:Parameter Name="PaymentTypeID" Type="Int32" />
                    <asp:Parameter Name="ProposalTypeID" Type="Int32" />
                    <asp:Parameter Name="ProposalOriginID" Type="Int32" />
                    <asp:Parameter Name="BrokerRate" Type="Decimal" />
                    <asp:Parameter Name="AgentRate" Type="Decimal" />
                    <%--<asp:ControlParameter Name="ProposalType" ControlID="ctl00$MainContent$ProposalCommissionListView$ctrl0$ddlProposalType" PropertyName="SelectedValue" />--%>
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Commission" Type="String" />
                    <asp:Parameter Name="PaymentTypeID" Type="Int32" />
                    <asp:Parameter Name="ProposalTypeID" Type="Int32" />
                    <asp:Parameter Name="ProposalOriginID" Type="Int32" />
                    <asp:Parameter Name="BrokerRate" Type="Decimal" />
                    <asp:Parameter Name="AgentRate" Type="Decimal" />
                    <%--<asp:ControlParameter Name="ProposalType" ControlID="ctl00$MainContent$ProposalCommissionListView$ctrl0$ddlProposalType" PropertyName="SelectedValue" />--%>
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="PaymentTypesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                SelectCommand="select PaymentTypeID , PaymentType from commercial.PaymentType order by PaymentType"
                SelectCommandType="Text"></asp:SqlDataSource>

            <asp:SqlDataSource ID="ProposalOriginsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                SelectCommand="select ProposalOriginID, ProposalOrigin from commercial.ProposalOrigin order by ProposalOrigin"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ProposalTypesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[commercial].[sp_get_proposal_types_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
