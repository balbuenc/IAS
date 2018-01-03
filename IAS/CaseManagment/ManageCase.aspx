<%@ Page Title="Gestion de caso" Language="C#" MasterPageFile="~/CaseManagement.Master" AutoEventWireup="true" CodeBehind="ManageCase.aspx.cs" Inherits="IAS.CaseManagment.ManageCase" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-1.12.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />

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

    <div class="container-fluid" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
        <asp:HiddenField ID="hdnCaseID" runat="server" />
        <div class="row">
            <div class="col-lg-12" style="border-bottom: double; border-bottom-color: darkblue; color: darkblue">
                <h4>COBRANZAS | Gestión de Casos</h4>
            </div>
        </div>
        <div class="row">
            <asp:FormView ID="PersonData" runat="server" ItemType="IAS.Models.Person"
                DataKeyNames="PersonID"
                SelectMethod="GetPerson">
                <ItemTemplate>
                    <h4 style="color: dodgerblue">DATOS DEL CLIENTE</h4>

                    <div class="row">
                        <div class="col-lg-3"><u>CLIENTE:</u></div>
                        <div class="col-lg-8" style="color: forestgreen"><%#:Item.FullName %></div>         
                        
                    </div>
                    <div class="row">
                        <div class="col-lg-3"><u>TELÉFONOS:</u></div>
                        <div class="col-lg-3">PARTICULAR:<strong><%#:string.IsNullOrEmpty(Item.MobilePhone )?"nd": Item.HomePhone %></strong></div>
                        <div class="col-lg-3">CELULAR:<strong><%#:string.IsNullOrEmpty(Item.MobilePhone )?"nd": Item.MobilePhone %></strong></div>
                        <div class="col-lg-3">LABORAL:<strong><%#:string.IsNullOrEmpty(Item.BusinessPhone )?"nd": Item.BusinessPhone %></strong></div>
                    </div>
                    <div class="row">
                        <div class="hidden-sm">
                            <div class="col-lg-3"><u>DOCUMENTOS:</u></div>
                            <div class="col-lg-4">R.U.C.:<strong><%#:string.IsNullOrEmpty(Item.DocumentNumber )?"nd": Item.DocumentNumber%></strong></div>
                            <div class="col-lg-4">C.I.:<strong><%#:string.IsNullOrEmpty(Item.DocumentNumber2 )?"nd": Item.DocumentNumber2 %></strong></div>
                        </div>
                    </div>

                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="msg-box bg-info">
                        NO HAY DATOS DEL CLIENTE.
                    </div>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12" style="border-bottom: double; border-bottom-color: darkblue">
            <h4 style="color: dodgerblue">DETALLE DE LA GESTIÓN</h4>
        </div>
    </div>
    <div class="row" id="CaseTransitionDiv">
        <asp:Label ID="Label2" runat="server" Text="" CssClass="msg-box bg-danger" Visible="false"></asp:Label>
        <div class="form-group container-fluid">
            <div class="row">
                <div class="col-sm-9">
                    <label>NUEVO ESTADO:</label>
                    <asp:DropDownList ID="ddlNewState" runat="server" CssClass="form-control"
                        ItemType="IAS.Models.State"
                        SelectMethod="GetNewStates"
                        DataTextField="StateName"
                        DataValueField="StateID"
                        AutoPostBack="True"
                        OnDataBound="ddlNewState_DataBound"
                        OnSelectedIndexChanged="ddlNewState_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="col-sm-3">
                    <label>EFECTIVIDAD:</label>
                    <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="form-control datetime" type="date"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label>COMENTARIOS:</label>
            <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>

        <div class="text-right">
            <asp:Button ID="buttonChangeState" runat="server" Text="Registrar" CssClass="btn btn-info" OnClick="buttonChangeState_Click" />
        </div>

        <%-- <asp:SqlDataSource ID="CaseTransitionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"></asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="PolicyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="select * from dbo.policy where PolicyNumber = @PolicyNumber"
            SelectCommandType="Text">
            <SelectParameters>
                <asp:Parameter Name="PolicyNumber" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="ActivePoliciesByCase" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
            SelectCommand="sp_get_active_policies_by_CaseID"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="CaseID" Name="CaseID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


    <div class="row">
        <div class="col-lg-12" style="border-bottom: double; border-bottom-color: darkblue">
            <h4 style="color: dodgerblue">PÓLIZAS A GESTIONAR</h4>
        </div>
    </div>
    <div class="row" style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: small">
        <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />
        <asp:ListView ID="CollectionsListView" runat="server" DataSourceID="ActivePoliciesByCase"
            DataKeyNames="PolicyNumber"
            OnItemDataBound="CollectionsListView_ItemDataBound">
            <LayoutTemplate>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>NOMBRE DEL RIESGO</th>
                            <th>POLIZA</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <asp:HiddenField ID="txtOuterID" runat="server" Value='<%# Eval("PolicyNumber") %>' Visible="True" />
                <asp:SqlDataSource ID="CollectionSqlDatSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                    SelectCommand="[collection].[sp_get_collections_by_policy]" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
                        <asp:ControlParameter ControlID="txtOuterID" Name="PolicyNumber" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <tr>
                    <td>
                        <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>' />
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
                                            <th>CUOTA</th>
                                            <th>RECIBO</th>
                                            <th>IMPORTE</th>
                                            <th>VENCIMIENTO</th>
                                            <th>METODO DE COBRO</th>
                                            <th class="text-center">COBRADA</th>
                                            <th>FECHA PAGO</th>
                                            <th>ESTADO</th>
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
                                <div class="msg-box bg-warning">NO HAY CUOTAS PENDIENTES DE GESTIÒN PARA LA PÒLIZA.</div>
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


      



</asp:Content>
