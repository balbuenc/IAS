<%@ Page Title="" Language="C#" MasterPageFile="~/CaseManagement.Master" AutoEventWireup="true" CodeBehind="ManageCase.aspx.cs" Inherits="IAS.CaseManagment.ManageCase" %>


<%@ Register Src="~/CaseManagment/CaseTransitionManager.ascx" TagPrefix="uc1" TagName="CaseTransitionManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/bootstrap-datepicker.min.js"></script>

    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/bootstrap-datepicker.min.css" rel="stylesheet" />

    <script>
        (function () {
            $(function () {
                var SideBAR;
                SideBAR = (function () {
                    function SideBAR() { }

                    SideBAR.prototype.expandMyMenu = function () {
                        return $("nav.sidebar").removeClass("sidebar-menu-collapsed").addClass("sidebar-menu-expanded");
                    };

                    SideBAR.prototype.collapseMyMenu = function () {
                        return $("nav.sidebar").removeClass("sidebar-menu-expanded").addClass("sidebar-menu-collapsed");
                    };

                    SideBAR.prototype.showMenuTexts = function () {
                        return $("nav.sidebar ul a span.expanded-element").show();
                    };

                    SideBAR.prototype.hideMenuTexts = function () {
                        return $("nav.sidebar ul a span.expanded-element").hide();
                    };

                    SideBAR.prototype.showActiveSubMenu = function () {
                        $("li.active ul.level2").show();
                        return $("li.active a.expandable").css({
                            width: "100%"
                        });
                    };

                    SideBAR.prototype.hideActiveSubMenu = function () {
                        return $("li.active ul.level2").hide();
                    };

                    SideBAR.prototype.adjustPaddingOnExpand = function () {
                        $("ul.level1 li a.expandable").css({
                            padding: "1px 4px 4px 0px"
                        });
                        return $("ul.level1 li.active a.expandable").css({
                            padding: "1px 4px 4px 4px"
                        });
                    };

                    SideBAR.prototype.resetOriginalPaddingOnCollapse = function () {
                        $("ul.nbs-level1 li a.expandable").css({
                            padding: "4px 4px 4px 0px"
                        });
                        return $("ul.level1 li.active a.expandable").css({
                            padding: "4px"
                        });
                    };

                    SideBAR.prototype.ignite = function () {
                        return (function (instance) {
                            return $("#justify-icon").click(function (e) {
                                if ($(this).parent("nav.sidebar").hasClass("sidebar-menu-collapsed")) {
                                    instance.adjustPaddingOnExpand();
                                    instance.expandMyMenu();
                                    instance.showMenuTexts();
                                    instance.showActiveSubMenu();
                                    $(this).css({
                                        color: "#000"
                                    });
                                } else if ($(this).parent("nav.sidebar").hasClass("sidebar-menu-expanded")) {
                                    instance.resetOriginalPaddingOnCollapse();
                                    instance.collapseMyMenu();
                                    instance.hideMenuTexts();
                                    instance.hideActiveSubMenu();
                                    $(this).css({
                                        color: "#FFF"
                                    });
                                }
                                return false;
                            });
                        })(this);
                    };

                    return SideBAR;

                })();
                return (new SideBAR).ignite();
            });

        }).call(this);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid" style="font-family:'Segoe UI'">
       
        <div class="row">
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
        </div>
        <div class="row">
            <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />
            <asp:ListView ID="CollectionsListView" runat="server"
                ItemType="IAS.Models.Collection" DataKeyNames="CollectionID"
                SelectMethod="GetCollectionsForCase"
                OnItemDataBound="CollectionsListView_ItemDataBound">
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
                    <asp:HiddenField ID="txtOuterID" runat="server" Value="<%#:Item.PolicyNumber%>" Visible="True" />
                    <asp:SqlDataSource ID="CollectionSqlDatSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                        SelectCommand="[collection].[sp_get_collections_by_policy]" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
                            <asp:ControlParameter ControlID="txtOuterID" Name="PolicyNumber" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
                                DataKeyNames="CollectionID"
                                DataSourceID="CollectionSqlDatSource">
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
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PaymentNumber") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("ReceiptNumber") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCurrency" runat="server" Text='<%# Eval("Money") %>' />
                                            <asp:Label ID="lblDebtAmount" runat="server" Text='<%#:string.Format("{0:n2}",Eval("DebtAmount")) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPaymentDueDate" runat="server" Text='<%#:string.Format("{0:d}",Eval("PaymentDueDate")) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCollection" runat="server" Text='<%#:string.Format("{0:d}",Eval("CollectionMethod")) %>' />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkCollected" runat="server" Checked='<%# Eval("Collected") %>' Enabled="false" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%#:string.Format("{0:d}",Eval("CollectedDate")) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("CollectionState")%>' />
                                        </td>
                                        <td class="text-right">
                                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" Visible="true" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PaymentNumber")%>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("ReceiptNumber")%>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCurrency" runat="server" Text='<%# Eval("Money") %>' />
                                            <asp:Label ID="lblDebtAmount" runat="server" Text='<%#:string.Format("{0:n2}",Eval("DebtAmount")) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPaymentDueDate" runat="server" Text='<%#:string.Format("{0:d}",Eval("PaymentDueDate")) %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCollection" runat="server" Text='<%#:string.Format("{0:d}",Eval("CollectionMethod")) %>' />
                                        </td>
                                        <td class="text-center">
                                            <asp:CheckBox ID="chkCollected" runat="server" Checked='<%# Eval("Collected") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEffectiveDate" runat="server" Text='<%# Eval("CollectedDate") %>' CssClass="form-control datetime"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCollectionState" ItemType="IAS.Models.CollectionState" SelectMethod="GetCollectionStates"
                                                CssClass="form-control" DataTextField="CollectionStateName" DataValueField="CollectionStateID"
                                                runat="server" SelectedValue='<%# Eval("CollectionStateID") %>'>
                                            </asp:DropDownList>
                                        </td>

                                        <td class="text-right" colspan="2">
                                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                                        </td>
                                    </tr>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <div class="msg-box bg-warning">No hay cuotas Pendientes de gestiòn para la Pòliza.</div>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <script>
            $("a[title]").tooltip();
        </script>
        <asp:HiddenField ID="HiddenField1" runat="server" Value="" />

        <div class="row">
            <uc1:CaseTransitionManager runat="server" ID="CaseTransitionManager" OnCaseStateChanged="CaseTransitionManager_CaseStateChanged" />
        </div>
    </div>
    <div>
        <asp:Button ID="CaseAccountResumeBtn" runat="server" Text="Estado de cuenta" Width="148px" OnClientClick="javascript:OpenPage();" />
    </div>
</asp:Content>
