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
            <h3>Informacion de Cliente</h3>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:FormView ID="PersonData" runat="server"
                    DataSourceID="estadoClienteDataSource"
                    DataKeyNames="PersonID"
                    RenderOuterTable="false">
                    <ItemTemplate>
                        <div class="containter">
                            <div class="form-horizontal" style="font-size: small">
                                <div class="row">
                                    <div class="col-lg-2"><u>Cliente:</u></div>
                                    <div class="col-lg-4"><%#:Eval("Description") %></div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2"><u>Telefonos:</u></div>
                                    <div class="col-lg-10">
                                        Particular: <strong><%#:string.IsNullOrEmpty( Eval("telefono_domicilio1").ToString() )?"nd": Eval("telefono_domicilio1")  %> </strong>
                                        Celular: <strong><%#:string.IsNullOrEmpty(Eval("telefono_celular").ToString() )?"nd": Eval("telefono_celular")  %> </strong>
                                        Laboral: <strong><%#:string.IsNullOrEmpty(Eval("telefono_laboral1").ToString() )?"nd": Eval("telefono_laboral1") %> </strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="msg-box bg-warning alert-danger">No hay Datos del Cliente para Mostrar.</div>
                                </div>
                            </div>
                        </div>
                    </EmptyDataTemplate>

                </asp:FormView>
            </div>
        </div>
        <div class="row">
            <hr />
        </div>
        <div class="row" style="font-size: small">
            <div class="form-inline" role="form">
                <div class="form-group">
                    <label for="nroPoliza">Nro. Póliza:</label>
                    <label id="lblPolicyNumber" runat="server"></label>
                </div>
                <div class="form-group col-lg-offset-4">
                    <label for="acciones">Verificación:</label>
                </div>
                <button type="submit" class="btn btn-success" runat="server" onserverclick="RegistrarSiniestro">Con Cobertura</button>
                <button type="submit" class="btn btn-danger" runat="server" onserverclick="CierreSiniestro">Sin Cobertura</button>
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
                        <table class="table table-striped" style="font-size: x-small">
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
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="msg-box bg-warning alert-danger">La Pòliza no posee cuotas vencidas.</div>
                            </div>
                        </div>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <!-- #region Data Sources -->

    <asp:SqlDataSource ID="estadoClienteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_client_status]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
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
