<%@ Page Title="" Language="C#" MasterPageFile="~/Task.Master" AutoEventWireup="true" CodeBehind="Renovations.aspx.cs" Inherits="IAS.Renovations.Renovations" %>

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
            $("[id$=txtSearchPolicy]").autocomplete(
                {
                    source: "SearchPolicy.ashx",
                    response: function (event, ui) {
                    },
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function (event, ui) {
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearchPolicy]").val(ui.item.Client);
                            $("[id$=btnSearchPolicy]").click();
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Búsqueda</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtSearchPolicy" runat="server" CssClass="form-control" placeholder="Cliente, Póliza, Documento"></asp:TextBox>
                    </div>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" DataValueField="PolicyRenovationStatusID" DataTextField="Status" DataSourceID="RenovationStatusSqldataSource">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-2">
                        <button id="btnSearchPolicy" runat="server" class="btn btn-default" style="display: none;" onserverclick="btnSearchPolicy_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                        <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                        &nbsp;
                        <a href="NewRenovation.aspx" class="btn btn-default">
                            <span class="glyphicon glyphicon-plus"></span>
                        </a>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <asp:ListView ID="RenovationsListView"
                            runat="server"
                            DataKeyNames="RenovationID">
                            <LayoutTemplate>
                                <div class="table table-responsive">
                                    <table class="table table-hover  table-condensed ">
                                        <thead>
                                            <tr runat="server" style="padding-top: 5px; padding-bottom: 5px; height: 40px">
                                                <th class="visible-lg">FECHA RENOVACION</th>
                                                <th>NUMERO POLIZA</th>
                                                <th class="visible-lg">NRO DOCUMENTO</th>
                                                <th class="visible-lg">NOMBRE</th>
                                                <th class="visible-lg">ESTADO</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr runat="server" id="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr style="height: 33px">
                                    <td>
                                        <asp:Label ID="lblRenovationID" runat="server" Text='<%# Eval("RenovationID").ToString() %>' Visible="false" />
                                        <asp:Label ID="lblPersonaID" runat="server" Text='<%# Eval("id_persona").ToString() %>' Visible="false" />
                                        <asp:Label ID="lblFechaRenovacion" runat="server" Text='<%# Eval("RenovationDate") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroPoliza" runat="server" Text='<%# Eval("PolicyNumber") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroDocumento" runat="server" Text='<%# Eval("numero_documento") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' />
                                    </td>

                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <div class="msg-box bg-warning alert-danger">No se encontraron renovaciones.</div>
                                    </div>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="RenovationsSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="commercial.sp_get_policy_renovation" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="RenovationStatusSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="commercial.sp_get_renovations_status_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
