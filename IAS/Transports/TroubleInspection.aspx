<%@ Page Title="" Language="C#" MasterPageFile="~/Transport.Master" AutoEventWireup="true" CodeBehind="TroubleInspection.aspx.cs" Inherits="IAS.Transports.TroubleInspection" %>

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

    <style>
        .ui-autocomplete {
            z-index: 215000000 !important;
        }
    </style>

    <style>
        .modal-wide .modal-dialog {
            left: 10px;
            width: 80%; /* or whatever you wish */
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="font-family: 'Century Gothic', CenturyGothic, AppleGothic, sans-serif; padding-left: 10px; padding-right: 10px; font-size: xx-small">
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>
        <div class="page-header">
            <h3>INSPECCION DE AVERIAS</h3>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Datos del reclamo</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">RECLAMO NRO.</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtClaimNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">ASEGURADO*</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtInsured" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">CERTIFICADO SEGURO N°</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtCertificateNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-1 control-label" for="form-group-input">COMISARIO DE AVERIAS*</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtFailureCommissioner" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-sm-1 control-label" for="form-group-input">CERTIFICADO DE AVERIAS N°*</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtFailureCertificateNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Datos del portuario</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">DEPOSITO PORTUARIO</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtDepositHandBook" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">FECHA DE INSPECCION*</label>
                                <div class="col-sm-6">
                                    <div class='input-group date' id='datetimepicker1'>
                                        <input id="txtInspectionDateHandBook" placeholder="FECHA INSPECCION" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">DIRECCION</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtDirectionHandBook" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">FECHA DE LLEGADA*</label>
                                <div class="col-sm-6">
                                    <div class='input-group date' id='datetimepicker2'>
                                        <input id="txtArrivalDateHandBook" placeholder="FECHA LLEGADA" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">FECHA DE DESCARGA*</label>
                                <div class="col-sm-6">
                                    <div class='input-group date' id='datetimepicker3'>
                                        <input id="txtDownloadDateHandBook" placeholder="FECHA DESCARGA" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">PRESENTES EN VERIFICACION</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtPresentInVerificationHandBook" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">MONTO RECLAMADO</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtClaimAmountHandBook" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">OBSERVACION EN ADUANAS</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtCustomsObservationHandBook" runat="server" TextMode="MultiLine" Height="100px" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Datos del consignatario</div>
                    <div class="panel-body">
                        <div class="form-group">
                              <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">DEPOSITO CONSIGNATARIO</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtDepositConsignee" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">FECHA DE INSPECCION*</label>
                                <div class="col-sm-6">
                                    <div class='input-group date' id='datetimepicker4'>
                                        <input id="txtInspectionDateConsignee" placeholder="FECHA INSPECCION" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">DIRECCION</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtDirectionConsignee" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">FECHA DE LLEGADA*</label>
                                <div class="col-sm-6">
                                    <div class='input-group date' id='datetimepicker5'>
                                        <input id="txtRetirementDateConsignee" placeholder="FECHA LLEGADA" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">FECHA DE DESCARGA*</label>
                                <div class="col-sm-6">
                                    <div class='input-group date' id='datetimepicker6'>
                                        <input id="txtDownloadDateConsignee" placeholder="FECHA DESCARGA" class="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">PRESENTES EN VERIFICACION</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtPresentInVerificationConsignee" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">MONTO RECLAMADO</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtClaimAmountConsignee" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">OBSERVACION EN ADUANAS</label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtCustomsObservationConsignee" runat="server" TextMode="MultiLine" Height="100px" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
