<%@ Page Title="" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="IAS.Transports.Certificate" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Certificado</h2>
    </div>

    <asp:UpdatePanel ID="upnlCollections" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="input-group">
                            <span class="input-group-btn">
                                <button id="searchBox" class="btn btn-default" runat="server" type="button" onserverclick="searchBox_ServerClick">Buscar</button>
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
                        <div class="col-sm-10">
                            <asp:Label ID="lblCliente" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label" for="form-group-input">Nro Documento</label>
                        <div class="col-sm-10">
                            <asp:Label ID="lblNroDocumento" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 control-label" for="form-group-input">Poliza</label>
                        <div class="col-sm-10">
                            <asp:Label ID="lblPoliza" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="modal fade modal-wide1" id="myModalPolizas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                <h4 class="modal-title" id="H5">Seleccionar póliza</h4>
                            </div>
                            <br />
                            <div class="form-horizontal" role="form">
                                <div class="row" style="padding-left: 20px; padding-right: 20px; font-size: x-small !important;">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="gridClients" AutoGenerateColumns="false" EmptyDataText="Sin registros" runat="server" CssClass="table table-hover"
                                            OnRowCommand="gridClients_RowCommand">
                                            <Columns>
                                                <asp:BoundField HeaderText="Nro Póliza" DataField="detail" />
                                                <asp:BoundField HeaderText="Nro documento" DataField="numero_documento" />
                                                <asp:BoundField HeaderText="Cliente" DataField="cliente" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkSeleccionar" runat="server" CausesValidation="False" CommandArgument='<%# Eval("detail") + "|" + Eval("numero_documento") + "|" + Eval("cliente") + "|" + Eval("id_persona") + "|" + Eval("nro_poliza") %>'
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
