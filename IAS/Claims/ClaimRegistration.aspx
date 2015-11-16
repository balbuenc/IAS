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
        <div class="row">
              <asp:FormView ID="ClaimDetailsListView" runat="server"
                        DataKeyNames="ClaimID"
                        DataSourceID="siniestroDetalleDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%">

                       
                        <ItemTemplate>
                            ClaimID:
                            <asp:Label ID="ClaimIDLabel" runat="server" Text='<%# Eval("ClaimID") %>' />
                            <br />
                            CaseID:
                            <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Bind("CaseID") %>' />
                            <br />
                            PolicyNumber:
                            <asp:Label ID="PolicyNumberLabel" runat="server" Text='<%# Bind("PolicyNumber") %>' />
                            <br />
                            ClaimNumber:
                            <asp:Label ID="ClaimNumberLabel" runat="server" Text='<%# Bind("ClaimNumber") %>' />
                            <br />
                            RiskName:
                            <asp:Label ID="RiskNameLabel" runat="server" Text='<%# Bind("RiskName") %>' />
                            <br />
                            PersonID:
                            <asp:Label ID="PersonIDLabel" runat="server" Text='<%# Bind("PersonID") %>' />
                            <br />
                            LiquidatorID:
                            <asp:Label ID="LiquidatorIDLabel" runat="server" Text='<%# Bind("LiquidatorID") %>' />
                            <br />
                            WorkshopID:
                            <asp:Label ID="WorkshopIDLabel" runat="server" Text='<%# Bind("WorkshopID") %>' />
                            <br />
                            RegistryDate:
                            <asp:Label ID="RegistryDateLabel" runat="server" Text='<%# Bind("RegistryDate") %>' />
                            <br />
                            CloseDate:
                            <asp:Label ID="CloseDateLabel" runat="server" Text='<%# Bind("CloseDate") %>' />
                            
                            <br />
                            ClaimDate:
                            <asp:Label ID="ClaimDateLabel" runat="server" Text='<%# Bind("ClaimDate") %>' />
                            <br />
                            ClaimStatusID:
                            <asp:Label ID="ClaimStatusIDLabel" runat="server" Text='<%# Bind("ClaimStatusID") %>' />
                            <br />
                            ClaimTypeID:
                            <asp:Label ID="ClaimTypeIDLabel" runat="server" Text='<%# Bind("ClaimTypeID") %>' />
                            <br />
                            InsuranceExpertID:
                            <asp:Label ID="InsuranceExpertIDLabel" runat="server" Text='<%# Bind("InsuranceExpertID") %>' />
                            <br />
                            Section:
                            <asp:Label ID="SectionLabel" runat="server" Text='<%# Bind("Section") %>' />
                            <br />
                            InsuranceManagerID:
                            <asp:Label ID="InsuranceManagerIDLabel" runat="server" Text='<%# Bind("InsuranceManagerID") %>' />
                           
                            <br />
                            ContactName:
                            <asp:Label ID="ContactNameLabel" runat="server" Text='<%# Bind("ContactName") %>' />
                            <br />
                            ClaimAddress:
                            <asp:Label ID="ClaimAddressLabel" runat="server" Text='<%# Bind("ClaimAddress") %>' />
                            <br />
                            ClaimDescription:
                            <asp:Label ID="ClaimDescriptionLabel" runat="server" Text='<%# Bind("ClaimDescription") %>' />
                            <br />
                            ClaimTime:
                            <asp:Label ID="ClaimTimeLabel" runat="server" Text='<%# Bind("ClaimTime") %>' />
                            <br />
                            OtherVehicleDescription:
                            <asp:Label ID="OtherVehicleDescriptionLabel" runat="server" Text='<%# Bind("OtherVehicleDescription") %>' />
                            <br />
                            OtherVehiclePatentNumber:
                            <asp:Label ID="OtherVehiclePatentNumberLabel" runat="server" Text='<%# Bind("OtherVehiclePatentNumber") %>' />
                            <br />
                            LooseDescription:
                            <asp:Label ID="LooseDescriptionLabel" runat="server" Text='<%# Bind("LooseDescription") %>' />
                            <br />
                            ClaimCoordinate:
                            <asp:Label ID="ClaimCoordinateLabel" runat="server" Text='<%# Bind("ClaimCoordinate") %>' />
                            <br />
                            PictureA:
                            <asp:Label ID="PictureALabel" runat="server" Text='<%# Bind("PictureA") %>' />
                            <br />
                            PictureB:
                            <asp:Label ID="PictureBLabel" runat="server" Text='<%# Bind("PictureB") %>' />
                            <br />
                            PictureC:
                            <asp:Label ID="PictureCLabel" runat="server" Text='<%# Bind("PictureC") %>' />
                            <br />
                            PictureD:
                            <asp:Label ID="PictureDLabel" runat="server" Text='<%# Bind("PictureD") %>' />
                            <br />
                        </ItemTemplate>
                        <EditItemTemplate>
                         
                        </EditItemTemplate>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                           
                        </InsertItemTemplate>
                        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
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

    <!-- #region Data Sources -->

    <asp:SqlDataSource ID="estadoClienteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_client_status]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="siniestroDetalleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[claim].[sp_get_claim_by_ClaimID]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClaimID" QueryStringField="ClaimID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- #endregion -->
</asp:Content>
