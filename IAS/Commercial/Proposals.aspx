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

<%@ Page Title="Propuestas Comerciales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proposals.aspx.cs" Inherits="IAS.Commercial.Proposals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Propuestas</h2>
    </div>

    <asp:UpdatePanel ID="upnlProposals" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ProposalListView" runat="server"
                DataKeyNames="ProposalID"
                DataSourceID="ProposalDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                            <thead>
                                <th>Id.</th>
                                <th>Tipo</th>
                                <th>Nro.</th>
                              <%--  <th>Aseguradora</th>--%>
                                <th>Fecha</th>
                                <th>Prima</th>
                                <th>Riesgo</th>
                                <th>Comisión</th>
                                <th>Agente</th>
                                <th>Cliente</th>
                                <th>Nro. Doc.</th>
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
                            <asp:Label ID="lblProposalID" runat="server" Text='<%# Eval("ProposalID") %>' /></td>
                        <td>
                            <asp:Label ID="lblProposalCommision" runat="server" Text='<%# Eval("Commission") %>' /></td>
                        <td>
                            <asp:Label ID="lblProposalNumber" runat="server" Text='<%# Eval("ProposalNumber") %>' /></td>

                       <%-- <td>
                            <asp:Label ID="lblInsuranceManager" runat="server" Text='<%# Eval("InsuranceManager") %>' /></td>--%>
                        <td>
                            <asp:Label ID="lblProposalDate" runat="server" Text='<%#  DateTime.Parse( Eval("ProposalDate").ToString()).ToShortDateString() %>' /></td>
                        <td>
                            <asp:Label ID="lblPremiun" runat="server" Text='<%# Eval("Premiun") %>' /></td>

                        <td>
                            <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                        <td>
                            <asp:Label ID="lblBrokerAmount" runat="server" Text='<%# Eval("BrokerAmount") %>' /></td>
                        <td>
                            <asp:Label ID="lblAgentAmount" runat="server" Text='<%# Eval("AgentAmount") %>' /></td>
                        <td>
                            <asp:Label ID="lblBeneficiary" runat="server" Text='<%# Eval("Beneficiary") %>' /></td>
                        <td>
                            <asp:Label ID="lblDocumentNumber" runat="server" Text='<%# Eval("DocumentNumber") %>' /></td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:label ID="txtProposalID" runat="server" Text='<%# Bind("ProposalID") %>'  Font-Size="X-Small" /></td>
                        <td>
                            <asp:DropDownList ID="ProposalCommisionDDL" runat="server"  DataSourceID="ProposalCommisionDataSource" Enabled="false"
                                SelectedValue='<%# Eval("Commission") %>' 
                                DataValueField="Commission"  DataTextField="Commission" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtProposalNumber" runat="server" Text='<%# Bind("ProposalNumber") %>' Font-Size="X-Small" /></td>
                       <%-- <td>
                            <asp:DropDownList ID="ddlInsuranceManager" runat="server" CssClass="form-control" DataSourceID="InsuranceManagersDataSource"
                                SelectedValue='<%# Eval("InsuranceManagerID") %>' 
                                DataValueField="InsuranceManagerID" DataTextField="InsuranceManager" AppendDataBoundItems="true">
                            </asp:DropDownList>

                        </td>--%>
                        <td>
                            <asp:TextBox ID="txtProposalDate" runat="server" Text='<%# Bind("ProposalDate") %>' Font-Size="X-Small" type="date" /></td>
                        <td>
                            <asp:TextBox ID="txtPremiun" runat="server" Text='<%# Bind("Premiun") %>' Font-Size="X-Small" /></td>
                       
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>'  Font-Size="X-Small" /></td>
                        <td>
                            <asp:Label ID="lblBrokerAmount" runat="server" Text='<%# Eval("BrokerAmount") %>' /></td>
                        <td>
                            <asp:Label ID="lblAgentAmount" runat="server" Text='<%# Eval("AgentAmount") %>' /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiary" runat="server" Text='<%# Bind("Beneficiary") %>' /></td>
                        <td>
                            <asp:TextBox ID="txtDocumentNumber" runat="server" Text='<%# Bind("DocumentNumber") %>' /></td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>

                        <td>
                            <asp:Label ID="txtProposalID" runat="server" Text="#" Font-Size="X-Small" /></td>
                        <td>
                            <asp:DropDownList ID="ProposalCommisionDDL" runat="server" DataSourceID="ProposalCommisionDataSource"
                                DataValueField="Commission" DataTextField="Commission" AppendDataBoundItems="true">
                            </asp:DropDownList>

                        </td>
                        <td>
                            <asp:TextBox ID="txtProposalNumber" runat="server" Text='<%# Bind("ProposalNumber") %>' Font-Size="X-Small" /></td>
                      <%--  <td>
                            <asp:DropDownList ID="ddlInsuranceManager" runat="server" CssClass="form-control" DataSourceID="InsuranceManagersDataSource"
                                DataValueField="InsuranceManagerID" DataTextField="InsuranceManager" AppendDataBoundItems="true">
                            </asp:DropDownList>

                        </td>--%>
                        <td>
                            <asp:TextBox ID="txtProposalDate" runat="server" Text='<%# Bind("ProposalDate") %>' Font-Size="X-Small" type="date" /></td>
                        <td>
                            <asp:TextBox ID="txtPremiun" runat="server" Text='<%# Bind("Premiun") %>'  Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>'  Font-Size="X-Small" /></td>

                        <td>
                            <asp:Label ID="lblBrokerAmount" runat="server" Text="" /></td>
                        <td>
                            <asp:Label ID="lblAgentAmount" runat="server" Text="" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiary" runat="server" Text='<%# Bind("Beneficiary") %>' /></td>
                        <td>
                            <asp:TextBox ID="txtDocumentNumber" runat="server" Text='<%# Bind("DocumentNumber") %>' /></td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="ProposalDataPager" runat="server" PagedControlID="ProposalListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>



            <asp:SqlDataSource ID="ProposalDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="commercial.sp_get_proposals" SelectCommandType="StoredProcedure"
                UpdateCommand="commercial.sp_update_proposal" UpdateCommandType="StoredProcedure"
                DeleteCommand="commercial.sp_delete_proposal" DeleteCommandType="StoredProcedure"
                InsertCommand="commercial.sp_insert_proposal" InsertCommandType="StoredProcedure">

                <DeleteParameters>
                    <asp:Parameter Name="ProposalID" Type="Int64" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProposalID" Type="Int32" />
                    <asp:Parameter Name="ProposalNumber" Type="Int64" />
                    <asp:Parameter Name="EmissionDate" Type="DateTime" />
                    <asp:Parameter Name="ExpirationDate" Type="DateTime" />
                    <asp:Parameter Name="PersonID" Type="Int32" />
                <%--    <asp:ControlParameter Name="InsuranceManagerID" ControlID="ddlInsuranceManager" PropertyName="SelectedValue" />--%>
                    <asp:Parameter Name="ProposalDate" Type="DateTime" />
                    <asp:Parameter Name="Premiun" Type="Decimal" />
                    <asp:Parameter Name="PremiunPlusTax" Type="Decimal" />
                    <asp:Parameter Name="RiskName" Type="String" />

                    <%--<asp:ControlParameter Name="Commission" ControlID="ProposalCommisionDDL" PropertyName="SelectedValue" />--%>
                    <asp:Parameter Name="Commission" Type="Int32" />
                    <asp:Parameter Name="Beneficiary" Type="String" />
                    <asp:Parameter Name="DocumentNumber" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProposalNumber" Type="Int64" />
                    <asp:Parameter Name="EmissionDate" Type="DateTime" />
                    <asp:Parameter Name="ExpirationDate" Type="DateTime" />
                    <asp:Parameter Name="PersonID" Type="Int32" />

                    <%--<asp:ControlParameter Name="InsuranceManagerID" ControlID="ctl00$MainContent$ProposalListView$ctrl0$ddlInsuranceManager" PropertyName="SelectedValue" />--%>

                    <asp:Parameter Name="ProposalDate" Type="DateTime" />
                    <asp:Parameter Name="Premiun" Type="Decimal" />
                    <asp:Parameter Name="PremiunPlusTax" Type="Decimal" />
                    <asp:Parameter Name="RiskName" Type="String" />


                    <asp:ControlParameter Name="Commission" ControlID="ctl00$MainContent$ProposalListView$ctrl0$ProposalCommisionDDL" PropertyName="SelectedValue" />
                      <asp:Parameter Name="Beneficiary" Type="String" />
                    <asp:Parameter Name="DocumentNumber" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="InsuranceManagersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_insurance_managers_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ProposalCommisionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="select Commission from [commercial].[ProposalCommission]" SelectCommandType="Text"></asp:SqlDataSource>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
