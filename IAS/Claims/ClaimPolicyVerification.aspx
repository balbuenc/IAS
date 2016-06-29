<%@ Page Title="Verficaciòn de Cobertura" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="ClaimPolicyVerification.aspx.cs" Inherits="IAS.Claims.ClaimPolicyVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-2.1.3.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
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
        <br />
        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
            <div class="col-lg-2">Comentarios</div>
            <div class="col-lg-8">
                <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" />
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnCommentAdd" runat="server" Text="Guardar comentario" CssClass="btn btn-default" OnClick="btnCommentAdd_Click"  />
            </div>
        </div>
        <div class="row">
            <br />
            <div class="col-lg-12">
                <asp:GridView ID="grdClaimComments" runat="server" CssClass="table table-hover table-bordered"
                    AutoGenerateColumns="false"
                    DataKeyNames="ClaimCommentID"
                    DataSourceID="claimCommentsDataSource"
                    OnRowUpdated="grdClaimComments_RowUpdated"
                    OnRowUpdating="grdClaimComments_RowUpdating"
                    RowStyle-Font-Size="Small"
                    HeaderStyle-Font-Size="Small">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblClaimCommentID" runat="server" Text='<%# Eval("ClaimCommentID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblClaimCommentID" runat="server" Text='<%# Eval("ClaimCommentID") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comentario">
                            <ItemTemplate>
                                <asp:Label ID="lblComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtComment" CssClass="form-control" runat="server" Text='<%# Eval("Comment") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ClaimID">
                            <ItemTemplate>
                                <asp:Label ID="lblClaimID" runat="server" Text='<%# Eval("ClaimID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtClaimID" CssClass="form-control" runat="server" ReadOnly="true" Text='<%# Eval("ClaimID") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" ReadOnly="true" Text='<%# Eval("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="lblCommentDate" runat="server" Text='<%# Eval("CommentDate") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCommentDate" CssClass="form-control" runat="server" ReadOnly="true" Text='<%# System.DateTime.Now %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar"
                            InsertText="Insertar" NewText="Nuevo" ShowEditButton="True"
                            UpdateText="Actualizar" HeaderText="Acciones" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <!-- #region Data Sources -->
    <asp:SqlDataSource ID="claimCommentsDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[claim].[sp_get_claimComments]" SelectCommandType="StoredProcedure"
        InsertCommand="[claim].[sp_insert_claimComment]" InsertCommandType="StoredProcedure"
        UpdateCommand="[claim].[sp_update_claimComment]" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
            <asp:Parameter Name="UserName" DbType="String" />
            <asp:Parameter Name="CommentDate" DbType="DateTime" />
            <asp:Parameter Name="Comment" DbType="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ClaimCommentID" DbType="Int64" />
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
            <asp:Parameter Name="UserName" DbType="String" />
            <asp:Parameter Name="CommentDate" DbType="DateTime" />
            <asp:Parameter Name="Comment" DbType="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="estadoClienteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_client_status]" SelectCommandType="StoredProcedure">
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
