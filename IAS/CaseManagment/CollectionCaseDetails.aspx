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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CollectionCaseDetails.aspx.cs" Inherits="IAS.CaseManagment.CollectionCaseDetails" %>

<%@ Register Src="~/CaseManagment/CaseData.ascx" TagPrefix="uc1" TagName="CaseData" %>
<%@ Register Src="~/CaseManagment/CaseTransitionManager.ascx" TagPrefix="uc1" TagName="CaseTransitionManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">
      

        function OpenPage() {

            var prodId = getParameterByName('CaseID');

            var url = "http://aibsql.cloudapp.net/ReportServer/Pages/ReportViewer.aspx?%2fIAS_SSRS%2fEstadoCuenta&rs:Command=Render&CaseID=" + prodId;

        window.open(url);

        }

        function getParameterByName(name) {
            var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
            return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
        }

</script>
    <asp:UpdatePanel ID="caseInfoPanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

            <uc1:CaseData runat="server" ID="CaseData" />

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:FormView ID="PersonData" runat="server" ItemType="IAS.Models.Person"
        DataKeyNames="PersonID"
        SelectMethod="GetPerson"
        RenderOuterTable="false">
        <ItemTemplate>
            <h3>Informacion de cobranzas</h3>

            <div class="containter-fluid" style="padding-left: 20px;">

                <div class="row">
                    <div class="col-sm-2"><u>Cliente:</u></div>
                    <div class="col-sm-4">
                        <%#:Item.FullName %>
                    </div>
                    <div class="row">
                        <div class="col-sm-2"><u>Telefonos:</u></div>
                        <div class="col-sm-4">
                            Particular: <strong><%#:string.IsNullOrEmpty(Item.MobilePhone )?"nd": Item.HomePhone %> </strong>
                            Celular: <strong><%#:string.IsNullOrEmpty(Item.MobilePhone )?"nd": Item.MobilePhone %> </strong>
                            Laboral: <strong><%#:string.IsNullOrEmpty(Item.BusinessPhone )?"nd": Item.BusinessPhone %> </strong>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-sm-2"><u>Documentos:</u></div>
                        
                            <div class="col-sm-4">
                            R.U.C.: <strong><%#:string.IsNullOrEmpty(Item.DocumentNumber )?"nd": Item.DocumentNumber%> </strong>
                            C.I.: <strong><%#:string.IsNullOrEmpty(Item.DocumentNumber2 )?"nd": Item.DocumentNumber2 %> </strong>
                        
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <div class="msg-box bg-info">
                No hay datos de cobranzas para mostrar
            </div>
        </EmptyDataTemplate>

    </asp:FormView>

    <asp:UpdatePanel ID="WorkflowUPanel" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />

            <asp:ListView ID="CollectionsListView" runat="server"
                ItemType="IAS.Models.Collection" DataKeyNames="CollectionID"
                SelectMethod="GetCollectionsForCase">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nombre del riesgo</th>
                                <th>Poliza</th>
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
                            <asp:Label ID="lblRiskName" runat="server" Text="<%#:Item.RiskName%>" />
                        </td>
                        <td>
                            <asp:Label ID="lblPolicyNumber" runat="server" Text="<%#:Item.PolicyNumber%>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListView ID="DetailListView" runat="server"
                                ItemType="IAS.Models.Collection" DataKeyNames="CollectionID"
                                SelectMethod="GetOverdueInvoices"
                                UpdateMethod="UpdatePayment"
                                OnItemEditing="DetailListView_ItemEditing"
                                OnItemCanceling="DetailListView_ItemCanceling"
                                OnItemUpdated="DetailListView_ItemUpdated" >
                                <LayoutTemplate>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Cuota</th>
                                                <th>Recibo</th>
                                                <th>Importe</th>
                                                <th>Vencimiento</th>
                                                <th>Metodo de cobro</th>
                                                <th class="text-center">Cobrada</th>
                                                <th>Fecha pago</th>
                                                <th>Estado</th>
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
                                            <asp:Label ID="Label1" runat="server" Text="<%#:Item.PaymentNumber%>" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblReceiptNumber" runat="server" Text="<%#:Item.ReceiptNumber%>" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCurrency" runat="server" Text='<%# Item.Money %>' />
                                            <asp:Label ID="lblDebtAmount" runat="server" Text='<%#:string.Format("{0:n2}",Item.DebtAmount) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPaymentDueDate" runat="server" Text='<%#:string.Format("{0:d}",Item.PaymentDueDate) %>'  />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCollection" runat="server" Text='<%#:string.Format("{0:d}",Item.CollectionMethod) %>'  />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkCollected" runat="server" Checked="<%# Item.Collected %>" Enabled="false" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%#:string.Format("{0:d}",Item.CollectedDate) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="<%#:Item.CollectionState%>" />
                                        </td>
                                        <td class="text-right">                                            
                                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" Visible="true" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="<%#:Item.PaymentNumber%>" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblReceiptNumber" runat="server" Text="<%#:Item.ReceiptNumber%>" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCurrency" runat="server" Text="<%# Item.Money %>" />
                                            <asp:Label ID="lblDebtAmount" runat="server" Text='<%#:string.Format("{0:n2}",Item.DebtAmount) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPaymentDueDate" runat="server" Text='<%#:string.Format("{0:d}",Item.PaymentDueDate) %>'/>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCollection" runat="server" Text='<%#:string.Format("{0:d}",Item.CollectionMethod) %>'  />
                                        </td>
                                        <td class="text-center">
                                            <asp:CheckBox ID="chkCollected" runat="server" Checked="<%# BindItem.Collected %>"  />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEffectiveDate" runat="server" Text="<%# BindItem.CollectedDate %>" CssClass="form-control datetime"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCollectionState" ItemType="IAS.Models.CollectionState" SelectMethod="GetCollectionStates"
                                                CssClass="form-control" DataTextField="CollectionStateName" DataValueField="CollectionStateID"
                                                runat="server" SelectedValue="<%# BindItem.CollectionStateID %>">
                                            </asp:DropDownList>
                                        </td>

                                        <td class="text-right" colspan="2">
                                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                                        </td>
                                    </tr>
                                </EditItemTemplate>
                            </asp:ListView>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>

            <script>
                $("a[title]").tooltip();
            </script>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:UpdatePanel ID="trasicionManagerPanel" runat="server">

        <ContentTemplate>

            <uc1:CaseTransitionManager runat="server" ID="CaseTransitionManager" OnCaseStateChanged="CaseTransitionManager_CaseStateChanged" />

        </ContentTemplate>
        
    </asp:UpdatePanel>
    <div>
            <asp:Button ID="CaseAccountResumeBtn" runat="server" Text="Estado de cuenta" Width="148px" OnClientClick="javascript:OpenPage();" />
    </div>



</asp:Content>
