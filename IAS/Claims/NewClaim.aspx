<%@ Page Title="Nuevo Siniestro" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="NewClaim.aspx.cs" Inherits="IAS.Claims.NewClaim" %>

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

    <style>
        #contenido {
            margin: 0 10px;
        }

        #header {
            padding-top: 5px;
            height: 50px;
            padding-right: 10px;
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
        <br>
        <div class="row">
            <div class="col-lg-12" style="font-size: small">
                <div class="panel panel-default">
                    <div class="panel-heading">Datos del Cliente</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Cliente</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlClientes" runat="server" DataSourceID="clientesDataSource" AutoPostBack="true"
                                        CssClass="form-control" DataValueField="id_persona" DataTextField="cliente">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Nro. póliza</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlNroPoliza" runat="server" DataSourceID="polizasDataSource"
                                        CssClass="form-control" DataValueField="nro_poliza" DataTextField="detail">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-heading">Datos del Siniestro</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Fecha Siniestro</label>
                                <div class="col-sm-10">
                                    <input data-provide="datepicker" id="dp1" class="form-control" data-date-format="dd-mm-yyyy" runat="server" />
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Tipo Siniestro</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlTipoSiniestro" runat="server" CssClass="form-control" DataSourceID="tipoSinistrosDataSource" AutoPostBack="true"
                                        DataValueField="ClaimTypeID" DataTextField="Description">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-sm-2 control-label" for="form-group-input">Cobertura</label>
                                <div class="col-sm-10">
                                    <asp:ListBox ID="ListBox1"
                                        Rows="10"
                                        Width="100%"
                                        CssClass="form-control"
                                        SelectionMode="Multiple"
                                        DataSourceID="coberturaPolizas"
                                        runat="server"
                                        DataTextField="ClaimMade"
                                        DataValueField="ClaimMadeID">
                                    </asp:ListBox>
                                </div>
                            </div>
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
    <asp:SqlDataSource ID="polizasDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="sp_obtener_polizas_por_persona" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClientes" Name="p_id_persona" DbType="Int32" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="tipoSinistrosDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="sp_obtener_tipo_siniestros" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="coberturaPolizas" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="SELECT  [ClaimMade],[ClaimMadeID]  FROM [IAS_Developer].[dbo].[ClaimMade] where ClaimTypeID = @ClaimTypeID" SelectCommandType="Text">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTipoSiniestro" Name="ClaimTypeID" DbType="Int32" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
