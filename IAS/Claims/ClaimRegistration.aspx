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
        <div class="row">
            <div class="col-lg-12">
                <asp:FormView ID="PersonData" runat="server"
                    DataSourceID="estadoClienteDataSource"
                    DataKeyNames="PersonID"
                    RenderOuterTable="false">
                    <ItemTemplate>
                        <h3>Informacion de Cliente</h3>
                        <div class="containter-fluid" style="padding-left: 20px; font-size: x-small">
                            <div class="row">
                                <div class="col-sm-2"><u>Cliente:</u></div>
                                <div class="col-sm-4">
                                    <%#:Eval("Description") %>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2"><u>Telefonos:</u></div>
                                    <div class="col-sm-4">
                                        Particular: <strong><%#:string.IsNullOrEmpty( Eval("telefono_domicilio1").ToString() )?"nd": Eval("telefono_domicilio1")  %> </strong>
                                        Celular: <strong><%#:string.IsNullOrEmpty(Eval("telefono_celular").ToString() )?"nd": Eval("telefono_celular")  %> </strong>
                                        Laboral: <strong><%#:string.IsNullOrEmpty(Eval("telefono_laboral1").ToString() )?"nd": Eval("telefono_laboral1") %> </strong>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-2"><u>Documentos:</u></div>

                                    <div class="col-sm-4">
                                        R.U.C.: <strong><%#:string.IsNullOrEmpty(Eval("numero_documento").ToString() )?"nd": Eval("numero_documento")%> </strong>
                                        C.I.: <strong><%#:string.IsNullOrEmpty(Eval("numero_documento").ToString() )?"nd": Eval("numero_documento") %> </strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="msg-box bg-info">
                                No hay datos de cliente para mostrar.
                            </div>
                        </div>
                        <div class="row">
                            <a href="ClaimSearch.aspx">Buscar Siniestro</a>
                        </div>
                    </EmptyDataTemplate>

                </asp:FormView>
            </div>
        </div>
        <div class="row">
            <hr />
        </div>
    </div>

    <!-- #region Data Sources -->

    <asp:SqlDataSource ID="estadoClienteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_client_status]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   

    <!-- #endregion -->
</asp:Content>
