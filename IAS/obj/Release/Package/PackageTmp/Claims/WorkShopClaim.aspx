<%@ Page Title="Gestiòn de Talleres" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="WorkShopClaim.aspx.cs" Inherits="IAS.Claims.WorkShopClaim" %>

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
            <h3>Gestion del taller</h3>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:FormView ID="ClaimDetailsListView"
                    runat="server"
                    DataKeyNames="ClaimID"
                    DataSourceID="siniestroDetalleDataSource"
                    RenderOuterTable="false" DefaultMode="Edit">
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
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Estado de Reparacion: <span class="label label-warning"> Pendiente de Aprobacion </span></h3>
                                        
                                    </div>
                                    <div class="panel-body">
                                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                            <div class="col-lg-1">Nro.</div>
                                            <div class="col-lg-3">
                                                <asp:TextBox ID="txtClaimNumber" runat="server" Text='<%# Bind("ClaimNumber") %>' CssClass="form-control" />
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
                                                    DataValueField="LiquidatorID" DataTextField="Name" SelectedValue='<%#string.IsNullOrEmpty( Eval("LiquidatorID").ToString())?-1:Eval("LiquidatorID") %>' />
                                            </div>
                                            <div class="col-lg-1">Taller</div>
                                            <div class="col-lg-3">
                                                <asp:DropDownList ID="ddlTaller" runat="server" CssClass="form-control" DataSourceID="talleresSqlDataSource"
                                                    DataValueField="WorkShopID" DataTextField="Name" SelectedValue='<%#string.IsNullOrEmpty( Eval("WorkshopID").ToString())?-1:Eval("WorkshopID") %>' />
                                            </div>
                                            <div class="col-lg-1">Experto</div>
                                            <div class="col-lg-3">
                                                <asp:DropDownList ID="ddlExpertoAseguradora" runat="server" CssClass="form-control" DataSourceID="expertosAseguradoraDataSource"
                                                    DataValueField="ContactID" DataTextField="Name" SelectedValue='<%#string.IsNullOrEmpty( Eval("InsuranceExpertID").ToString())?-1:Eval("InsuranceExpertID") %>' />
                                            </div>
                                        </div>

                                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">

                                            <div class="col-lg-1">Aseguradora</div>
                                            <div class="col-lg-3">
                                                <asp:Label ID="lblInsuranceManager" runat="server" Text='<%# Eval("InsuranceManager") %>' />
                                            </div>
                                            <div class="col-lg-1">Perdidas</div>
                                            <div class="col-lg-7">
                                                <asp:TextBox ID="txtLooseDescription" runat="server" Text='<%# Bind("LooseDescription") %>' CssClass="form-control" />
                                            </div>

                                        </div>
                                        <div class="row" style="padding-top: 5px; padding-bottom: 5px">
                                            <div class="col-lg-1">Obs. del Estado</div>
                                            <div class="col-lg-11">
                                                <asp:TextBox ID="txtObservations" runat="server" Text='<%# Bind("Observations") %>' CssClass="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <hr />
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 ">
                                        <button id="ApprovementBtn" type="button" class="btn btn-default btn-lg" runat="server">
                                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Notificar al Cliente
                                        </button>
                                    </div>
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <button id="DisapprovementBT" type="button" class="btn btn-success btn-lg" runat="server">
                                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                            Realizado
                                        </button>
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
    </div>

    <!-- #region Data Sources -->
    <asp:SqlDataSource ID="estadoClienteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_client_status]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="siniestroDetalleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_claim_by_ClaimID]" SelectCommandType="StoredProcedure" UpdateCommand="claim.sp_update_claim" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="liquidadoresDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="claim.get_liquidators_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="talleresSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="claim.sp_get_workshops_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="expertosAseguradoraDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="claim.sp_get_insurance_experts_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <!-- #endregion -->
</asp:Content>
