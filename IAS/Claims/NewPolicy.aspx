<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="NewPolicy.aspx.cs" Inherits="IAS.Claims.NewPolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>


    <script type="text/javascript">
        $(function () {
            $("[id$=txtSearchPerson]").autocomplete(
                {
                    source: "SearchPerson.ashx",
                    response: function (event, ui) {
                        // ui.content is the array that's about to be sent to the response callback.
                        if (ui.content.length === 0) {
                            $('#myModalNewPerson').modal('show');
                        }
                    },
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function (event, ui) {
                        //$("[id$=txtSearchPerson]").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearchPerson]").val(ui.item.Client);
                            $("[id$=btnSearch]").click();
                            return false;
                        }
                    }
                })
                .autocomplete("instance")._renderItem = function (ul, item) {
                                      
                    return $("<li>")
                      .append("<div>" + item.Client + "</div>")
                      .append("</li>")
                      .appendTo(ul);
                  
                };
        });

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="page-header">
            <h3>Alta de Póliza
            </h3>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Datos del cliente</h3>
            </div>
            <div class="panel-body">

                <div class="row">
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtSearchPerson" runat="server" CssClass="form-control" placeholder="Búsqueda del cliente: Apellido, Nombre o CI"></asp:TextBox>
                    </div>
                    <div class="col-lg-4">
                        <a href="NewPerson.aspx" class="btn btn-default">
                            <span class="glyphicon glyphicon-plus"></span>
                            <span class="glyphicon glyphicon-user"></span>
                        </a>
                        <button style="display: none;" id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <br />
                <div class="row">
                    <label class="col-sm-2 control-label" for="form-group-input">Documento:</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblNroDocumento" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="form-group-input">Cliente:</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblCliente" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Datos de la Poliza</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="row">
                        <label class="col-sm-2 control-label" for="form-group-input">Nro de Póliza:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtNroPoliza" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label class="col-sm-2 control-label" for="form-group-input">Aseguradora:</label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlAseguradora" runat="server" CssClass="form-control" DataSourceID="aseguradorasDataSource"
                                DataValueField="InsuranceManagerID" DataTextField="InsuranceManager">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="aseguradorasDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_insurance_managers_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                <asp:Button ID="registrarPolizaBtn" runat="server" Text="Generar Póliza" CssClass="btn btn-primary" OnClick="registrarPolizaBtn_Click" />
            </div>
        </div>

        <div class="modal fade modal-wide" id="myModalNewPerson" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                        <h4 class="modal-title" id="H5">No existe la persona</h4>
                    </div>
                    <br />
                    <div class="form-horizontal" role="form">
                        <div class="row" style="padding-left: 20px; padding-right: 20px; font-size: x-small !important;">
                            <div class="col-lg-12">
                                <h4>¿Quisiera dar de alta a la persona?
                                </h4>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="NewPerson.aspx" class="btn btn-primary">
                                <span>Aceptar</span>
                            </a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
