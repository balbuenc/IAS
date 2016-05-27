<%@ Page Title="" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="IAS.Transports.Certificate" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style>
        #contenido {
            margin: 0 10px;
        }

        #header {
            padding-top: 5px;
            height: 50px;
            padding-right: 10px;
        }

        .modal-wide1 .modal-dialog {
            width: 80%; /* or whatever you wish */
        }
    </style>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Certificado</h2>
    </div>

    <asp:UpdatePanel ID="upnlCollections" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="gridClients" />
        </Triggers>
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12" style="font-size: small">
                        <div class="panel panel-default">
                            <div class="panel-heading">Datos del Cliente</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-1"></div>
                                        <div class="col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <button id="searchBox" class="btn btn-primary" runat="server" type="button" onserverclick="searchBox_ServerClick">Buscar</button>
                                                </span>
                                                <input type="text" class="form-control" id="txtSearchClient" runat="server"
                                                    placeholder="Buscar Cliente..."
                                                    onkeydown="if (window.event.keyCode == 13) 
                                                            {
                                                                event.returnValue=false; 
                                                                event.cancel = true;
                                                                searchRecords();
                                                            }" />
                                                <div class="input-group-btn">
                                                    <button type="button" id="criteriaBtn" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" runat="server">Cliente<span class="caret"></span></button>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="?criteria=Client">Cliente</a></li>
                                                        <li><a href="?criteria=ClientDocumentNumber">Nro. Documento</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div id="divClientData" runat="server" style="border: solid 1px #000000;" visible="false">
                                        <div class="row">
                                            <label class="col-sm-2 control-label" for="form-group-input">Cliente</label>
                                            <div class="col-sm-6">
                                                <asp:Label ID="lblCliente" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-2 control-label" for="form-group-input">Razón social</label>
                                            <div class="col-sm-6">
                                                <asp:Label ID="lblRazonSocial" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-2 control-label" for="form-group-input">Nro Documento</label>
                                            <div class="col-sm-6">
                                                <asp:Label ID="lblNroDocumento" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12" style="font-size: small">
                        <div class="panel panel-default">
                            <div class="panel-heading">Datos del Cliente</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Nro certificado</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtCertificateNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Porcentaje partner</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtPartnerAmmountPercent" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Riesgo</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtRiskName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12" style="font-size: small">
                        <div class="panel panel-default">
                            <div class="panel-heading">Datos del seguro</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Gerente de Seguros</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlInsuranceManager" runat="server" CssClass="form-control" DataSourceID="insuranceManagerDataSource"
                                                DataValueField="InsuranceManagerID" DataTextField="InsuranceManager">
                                            </asp:DropDownList>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Asociado</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlPartners" runat="server" CssClass="form-control" DataSourceID="partnersDataSource"
                                                DataValueField="PartnerID" DataTextField="Partner">
                                            </asp:DropDownList>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Nro Poliza</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlPolicy" runat="server" CssClass="form-control" DataSourceID="policyDataSource"
                                                DataValueField="PolicyNumber" DataTextField="Description">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Contacto</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlContact" runat="server" CssClass="form-control" DataSourceID="contactDataSource"
                                                DataValueField="ContactID" DataTextField="Contact">
                                            </asp:DropDownList>
                                        </div>

                                        <label class="col-sm-1 control-label" for="form-group-input">Metodo de transporte</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlTransportationMethod" runat="server" CssClass="form-control" DataSourceID="transportationMethodDataSource"
                                                DataValueField="TransportationMethodID" DataTextField="Method">
                                            </asp:DropDownList>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Cantidad Paquetes</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtPackageCount" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Origen</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtOrigin" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Destino</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Descripción</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Prima</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtPremium" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Prima impuesto plus</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtPremiunmPlusTax" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <label class="col-sm-1 control-label" for="form-group-input">Monto de capital</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtCapitalAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Tarifa</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtRate" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Porcentaje del gasto</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtSpendingPercent" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Gasto</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtSpending" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Porcentaje comisión ASSAP</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtComissionASSAPercent" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Porcentaje comisión del asesor</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtComissionAdviserPercent" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12" style="font-size: small">
                        <div class="panel panel-default">
                            <div class="panel-heading">Datos de comisiones</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Gerente de Seguros</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddlAgent" runat="server" CssClass="form-control" DataSourceID="agentDataSource"
                                                DataValueField="AgentID" DataTextField="Agent">
                                            </asp:DropDownList>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Porcentaje comisión</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtComissionPercent" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Monto comisión</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtComissionAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-1 control-label" for="form-group-input">Porcentaje comisión vendedor</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtComissionSellerPercent" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-sm-1 control-label" for="form-group-input">Monto comisión vendedor</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txtComissionSellerAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <asp:Button ID="btnGuardar" runat="server" CssClass=" btn btn-primary" Text="Guardar" OnClick="btnGuardar_Click" />
                    </div>
                </div>
                <div class="modal fade modal-wide1" id="myModalClients" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                <h4 class="modal-title" id="myModalLabel">Seleccionar póliza</h4>
                            </div>
                            <br />
                            <div class="form-horizontal" role="form">
                                <div class="row" style="padding-left: 20px; padding-right: 20px; font-size: x-small !important;">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="gridClients" AutoGenerateColumns="false" EmptyDataText="Sin registros" runat="server" CssClass="table table-hover"
                                            OnRowCommand="gridClients_RowCommand">
                                            <Columns>
                                                <asp:BoundField HeaderText="Nro documento" DataField="numero_documento" />
                                                <asp:BoundField HeaderText="Cliente" DataField="cliente" />
                                                <asp:BoundField HeaderText="Razón social" DataField="razon_social" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkSeleccionar" runat="server" CausesValidation="False" CommandArgument='<%# Eval("numero_documento") + "|" + Eval("cliente") + "|" + Eval("razon_social") + "|" + Eval("id_persona") %>'
                                                            CommandName="seleccionar" Text="Seleccionar" ToolTip="Seleccionar">
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SQL Data Sources -->
                <asp:SqlDataSource ID="clientesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="sp_obtener_persona_para_siniestros" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="insuranceManagerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_insurance_managers_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="agentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[transport].[sp_get_agent_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="policyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[transport].[sp_get_policy_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="contactDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[transport].[sp_get_contact_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="transportationMethodDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_transportation_method_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="partnersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_partners_ddl]" SelectCommandType="StoredProcedure">
                    <%--<SelectParameters>
                        <asp:Parameter Name="CountryID" DbType="Int32" />
                    </SelectParameters>--%>
                </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function openModalClients() {
            $('#myModalClients').modal('show');
        }
    </script>
</asp:Content>
