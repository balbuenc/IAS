<%@ Page Title="Nuevo siniestro" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="Claim.aspx.cs" Inherits="IAS.Transports.Claim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="/Scripts/bootstrap-datepicker.min.js"></script>
    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

    <script>

        function openModalPolizas() {
            $('#myModalPolizas').modal('show');
        }

    </script>
    <script type="text/javascript">
        $(function () {
            $("[id$=txtSearch]").autocomplete(
                {
                    source: "SearchCertificate.ashx",
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function (event, ui) {
                        $("[id$=txtSearch]").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearch]").val(ui.item.Client);

                            var d = ui.item.Client.split('|');
                            $("[id$=hifCertificateID]").text(d[1]);
                            $("[id$=btnSearch]").click();
                            return false;
                        }
                    }
                })
                .autocomplete("instance")._renderItem = function (ul, item) {

                    return $("<li>")
                      .append("<div>" + item.Client + "</div>")
                      .appendTo(ul);
                };
        });

    </script>
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
            left: 10px;
            width: 80%; /* or whatever you wish */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

                                <div class="col-lg-1">Cliente</div>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:HiddenField ID="hifCertificateID" runat="server" />
                                </div>
                                <div class="col-lg-1" hidden="hidden">
                                    <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="searchBox_ServerClick">
                                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    </button>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Cliente</label>
                                <div class="col-sm-10">
                                    <asp:Label ID="lblClient" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Nro Documento</label>
                                <div class="col-sm-10">
                                    <asp:Label ID="lblDocumentNumber" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Poliza</label>
                                <div class="col-sm-10">
                                    <asp:Label ID="lblPolicyNumber" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-heading">Datos del Siniestro</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">Fecha del reclamo</label>
                                <div class="col-sm-3">
                                    <div class='input-group date' id='datetimepicker1'>
                                        <input id="dp1" placeholder="Fecha siniestro" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">CRT N°</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtCrtNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">Consignatario</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtBeneficiary" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">Transportista</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtCarrier" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">Mercaderia</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtCommodity" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">Factura Nro</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtInvoiceNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">Valor Factura</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtInvoiceAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
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
                                <label class="col-sm-1 control-labelContacto" for="form-group-input">Contacto</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">Telefono</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">Ubicación</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <br />
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">Observación</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtObservations" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <hr />
        </div>
        <div class="row">
            <div class="col-lg-2 col-lg-offset-10">
                <asp:Button ID="registrarSiniestroBtn" runat="server" Text="Generar Siniestro" CssClass="btn btn-primary" OnClick="registrarSiniestroBtn_Click" />
            </div>
        </div>
    </div>
    <!-- #SQL Data Sources -->
    <asp:SqlDataSource ID="clientesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="sp_obtener_persona_para_siniestros" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <script type="text/javascript">

        $('#datetimepicker1').datetimepicker({
            format: 'DD-MM-YYYY',
            locale: 'es'
        });

    </script>
</asp:Content>
