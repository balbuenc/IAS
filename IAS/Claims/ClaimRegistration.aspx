<%@ Page Title="Registro de Siniestros" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="ClaimRegistration.aspx.cs" Inherits="IAS.Claims.ClaimRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <link href="../Content/bootstrap-datepicker.min.css" rel="stylesheet" />

    <script>       

        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var checkin = $('#dpd1').datepicker({
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() > checkout.date.valueOf()) {
                var newDate = new Date(ev.date)
                newDate.setDate(newDate.getDate() + 1);
                checkout.setValue(newDate);
            }
            checkin.hide();
            $('#dpd2')[0].focus();
        }).data('datepicker');
        var checkout = $('#dpd2').datepicker({
            onRender: function (date) {
                return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            checkout.hide();
        }).data('datepicker');
    </script>
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
            <h3>Datos del Siniestro</h3>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:FormView ID="ClaimDetailsListView"
                    runat="server"
                    DataKeyNames="ClaimID"
                    DataSourceID="siniestroDetalleDataSource"
                    RenderOuterTable="false" DefaultMode="Edit" OnItemCommand="ClaimDetailsListView_ItemCommand">
                    <ItemTemplate>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="container">
                            <div class="form-horizontal" style="font-size: small">
                                <div class="row alert-info" style="padding-top: 10px; padding-bottom: 10px">
                                    <div class="col-lg-4">Id. Caso:<asp:Label ID="CaseIDLabel" runat="server" Text='<%# Bind("CaseID") %>' /></div>
                                    <div class="col-lg-4">Id. Siniestro:<asp:Label ID="ClaimIDLabel" runat="server" Text='<%# Bind("ClaimID") %>' /></div>
                                    <div class="col-lg-4">Nro. Poliza:<asp:Label ID="PolicyNumberLabel" runat="server" Text='<%# Bind("PolicyNumber") %>' /></div>
                                </div>

                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-2 col-lg-offset-10">
                                        <asp:Button ID="UpdateButtonUp" runat="server" Text="Registrar Siniestro" CommandName="Save" CssClass="btn btn-primary" />
                                    </div>
                                </div>

                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Nro.</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtClaimNumber" runat="server" Text='<%# Bind("ClaimNumber") %>' CssClass="form-control" />
                                    </div>
                                    <div class="col-lg-1">Registrado</div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="lblRegistryDate" runat="server" Text='<%# DateTime.Parse( Eval("RegistryDate").ToString()).ToShortDateString() %>' />
                                    </div>
                                    <div class="col-lg-1">Cierre</div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="lblCloseDate" runat="server" Text='<%#:string.IsNullOrEmpty( Eval("CloseDate").ToString())?"nd": DateTime.Parse( Eval("CloseDate").ToString()).ToShortDateString()  %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Riesgo</div>
                                    <div class="col-lg-11">
                                        <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Liquidador</div>
                                    <div class="col-lg-3">
                                        <asp:DropDownList ID="ddlLiquidador" runat="server" CssClass="form-control" DataSourceID="liquidadoresDataSource"
                                            DataValueField="LiquidatorID" DataTextField="Name"  AppendDataBoundItems="true"
                                            SelectedValue='<%#string.IsNullOrEmpty( Eval("LiquidatorID").ToString()) ? -1 : Eval("LiquidatorID") %>'>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-1">Taller</div>
                                    <div class="col-lg-3">
                                        <asp:DropDownList ID="ddlTaller" runat="server" CssClass="form-control" DataSourceID="talleresSqlDataSource" 
                                            DataValueField="WorkShopID" DataTextField="Name" SelectedValue='<%#string.IsNullOrEmpty( Eval("WorkshopID").ToString())?-1:Eval("WorkshopID") %>' />
                                    </div>
                                    <div class="col-lg-1">Contacto</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtContactName" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Fecha</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtClaimDate" runat="server" Text='<%#:string.IsNullOrEmpty( Eval("ClaimDate").ToString())?"nd": DateTime.Parse( Eval("ClaimDate").ToString()).ToShortDateString()  %>' CssClass="form-control" />
                                    </div>
                                    <div class="col-lg-1">Tipo</div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ClaimType") %>' />
                                    </div>
                                    <div class="col-lg-1">Experto</div>
                                    <div class="col-lg-3">
                                        <asp:DropDownList ID="ddlExpertoAseguradora" runat="server" CssClass="form-control" DataSourceID="expertosAseguradoraDataSource"
                                            DataValueField="ContactID" DataTextField="Name" SelectedValue='<%#string.IsNullOrEmpty( Eval("InsuranceExpertID").ToString())?-1:Eval("InsuranceExpertID") %>' />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Sección</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("Section") %>' CssClass="form-control" />
                                    </div>
                                    <div class="col-lg-1">Aseguradora</div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="lblInsuranceManager" runat="server" Text='<%# Eval("InsuranceManager") %>'  />
                                    </div>
                                    <div class="col-lg-1">Dir. Siniestro</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtClaimAddress" runat="server" Text='<%# Bind("ClaimAddress") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Desc. Siniestro</div>
                                    <div class="col-lg-11">
                                        <asp:TextBox ID="txtClaimDescription" runat="server" Text='<%# Bind("ClaimDescription") %>' TextMode="MultiLine" Height="100px" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Hora Siniestro</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtClaimTime" runat="server" Text='<%# Bind("ClaimTime") %>' CssClass="form-control" />
                                    </div>
                                    <div class="col-lg-1">Otro Vehiculo</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtOtherVehicleDescription" runat="server" Text='<%# Bind("OtherVehicleDescription") %>' CssClass="form-control" />
                                    </div>
                                    <div class="col-lg-1">Matricula Otro</div>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtOtherVehiclePatentNumber" runat="server" Text='<%# Bind("OtherVehiclePatentNumber") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Perdidas</div>
                                    <div class="col-lg-11">
                                        <asp:TextBox ID="txtLooseDescription" runat="server" Text='<%# Bind("LooseDescription") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-1">Obs. del Estado</div>
                                    <div class="col-lg-11">
                                        <asp:TextBox ID="txtObservations" runat="server" Text='<%# Bind("Observations") %>' TextMode="MultiLine" Height="100px" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                    <div class="col-lg-2 col-lg-offset-10">
                                        <asp:Button ID="UpdateButton" runat="server" Text="Registrar Siniestro" CommandName="Save" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>

                    <InsertItemTemplate>
                    </InsertItemTemplate>

                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="msg-box bg-warning alert-danger">No se encontraron detalle del Siniestro.</div>
                            </div>
                        </div>
                    </EmptyDataTemplate>

                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />

                </asp:FormView>
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
    <asp:SqlDataSource ID="siniestroDetalleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_claim_by_ClaimID]" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="liquidadoresDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="claim.get_liquidators_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="talleresSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="claim.sp_get_workshops_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="expertosAseguradoraDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="claim.sp_get_insurance_experts_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <!-- #endregion -->
</asp:Content>
