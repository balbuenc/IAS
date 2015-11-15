<%@ Page Title="Verficaciòn de Cobertura" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="ClaimPolicyVerification.aspx.cs" Inherits="IAS.Claims.ClaimPolicyVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:FormView ID="PersonData" runat="server"
                    DataSourceID="estadoClienteDataSource"
                    DataKeyNames="PersonID"
                    RenderOuterTable="false">
                    <ItemTemplate>
                        <h3>Informacion de Cliente</h3>

                        <div class="containter-fluid" style="padding-left: 20px;">

                            <div class="row">
                                <div class="col-sm-2"><u>Cliente:</u></div>
                                <div class="col-sm-4">
                                    <%#:Eval("Description") %>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2"><u>Telefonos:</u></div>
                                    <div class="col-sm-4">
                                        Particular: <strong><%#:string.IsNullOrEmpty( Eval("telefono_domicilio1").ToString() )?"nd": Eval("telefono_domicilio1")  %> </strong>
                                        Celular: <strong><%#:string.IsNullOrEmpty(Eval("telefono_celular").ToString() )?"nd": Eval("telefono_celular")  %> </strong>
                                        Laboral: <strong><%#:string.IsNullOrEmpty(Eval("telefono_laboral1").ToString() )?"nd": Eval("telefono_laboral1") %> </strong>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-2"><u>Documentos:</u></div>

                                    <div class="col-sm-4">
                                        R.U.C.: <strong><%#:string.IsNullOrEmpty(Eval("numero_documento").ToString() )?"nd": Eval("numero_documento")%> </strong>
                                        C.I.: <strong><%#:string.IsNullOrEmpty(Eval("numero_documento").ToString() )?"nd": Eval("numero_documento") %> </strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="msg-box bg-info">
                                No hay datos de cliente para mostrar.
                            </div>
                        </div>
                        <div class="row">
                            <a href="ClaimSearch.aspx">Buscar Siniestro</a>
                        </div>
                    </EmptyDataTemplate>

                </asp:FormView>
            </div>
        </div>
        <div class="row">
            <hr />
        </div>
        <div class="row">
            <div class="col-lg-12">
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

                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <div class="msg-box bg-warning">No hay cuotas Pendientes para la Pòliza.</div>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <!-- #region Data Sources -->

    <asp:SqlDataSource ID="estadoClienteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_client_status]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CollectionSqlDatSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[collection].[sp_get_collections_by_policy]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />            
            <asp:QueryStringParameter Name="PolicyNumber" QueryStringField="PolicyNumber" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- #endregion -->

</asp:Content>
