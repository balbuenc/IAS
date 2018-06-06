<%@ Page Title="Nueva renovación" Language="C#" MasterPageFile="~/Task.Master" AutoEventWireup="true" CodeBehind="NewRenovation.aspx.cs" Inherits="IAS.Renovations.NewRenovation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript">

        $(function () {
            $("[id$=txtSearchPolicy]").autocomplete(
                {
                    source: "SearchPolicy.ashx",
                    response: function (event, ui) {

                        if (ui.content.length === 0) {
                            $('#myModalNewPolicy').modal('show');
                        }
                    },
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function (event, ui) {
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearchPolicy]").val(ui.item.Client);
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

    <script>

        function openModalPolizas() {
            $('#myModalPolizas').modal('show');
        }

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
            width: 80%; /* or whatever you wish */
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Búsqueda de Póliza</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtSearchPolicy" runat="server" CssClass="form-control" placeholder="Búsqueda de póliza: CI, Nombre, Apellido, Nro. Póliza"></asp:TextBox>
                        <button style="display: none;" id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </div>
                    <div class="col-lg-2">
                        <a href="NewPolicy.aspx" class="btn btn-default">
                            <span class="glyphicon glyphicon-plus"></span>
                            <span class="glyphicon glyphicon-list-alt"></span>
                        </a>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="form-group-input">Cliente</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblCliente" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="form-group-input">Nro. Documento</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblNroDocumento" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="form-group-input">Póliza</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblPoliza" runat="server"></asp:Label>
                    </div>
                </div>
                <%--  <div class="row">
                    <label class="col-sm-2 control-label" for="form-group-input">Aseguradora</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblAseguradora" runat="server"></asp:Label>
                    </div>
                </div>--%>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Datos de la renovación</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="row">
                        <label class="col-sm-2 control-label" for="form-group-input">Fecha a renovar:</label>
                        <div class="col-sm-4">
                            <div class='input-group date' id='datetimepicker1'>
                                <input id="dpDateRenovation" placeholder="Fecha a renovar" class="form-control" runat="server" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label class="col-sm-2 control-label" for="form-group-input">Asignar gestión a:</label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlUsuario" runat="server" CssClass="form-control" DataValueField="UserID" DataTextField="UserName" DataSourceID="UserSqldataSource" AppendDataBoundItems="true">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="UserSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                                SelectCommand="commercial.sp_get_users" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                <asp:Button ID="registrarRenovacionBtn" runat="server" Enabled="false" Text="Generar Renovación" CssClass="btn btn-primary" OnClick="registrarRenovacionBtn_Click" />
            </div>
        </div>

        <div class="modal fade modal-wide" id="myModalNewPolicy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                        <h4 class="modal-title" id="H5">No existe la póliza</h4>
                    </div>
                    <br />
                    <div class="form-horizontal" role="form">
                        <div class="row" style="padding-left: 20px; padding-right: 20px; font-size: x-small !important;">
                            <div class="col-lg-12">
                                <h4>¿Quisiera dar de alta la póliza?
                                </h4>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="NewPolicy.aspx" class="btn btn-primary">
                                <span>Aceptar</span>
                            </a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $('#datetimepicker1').datetimepicker({
            format: 'DD-MM-YYYY',
            locale: 'es'
        });

    </script>

</asp:Content>
