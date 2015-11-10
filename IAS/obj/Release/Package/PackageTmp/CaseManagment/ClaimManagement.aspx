<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimManagement.aspx.cs" Inherits="IAS.CaseManagment.ClaimManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function searchRecords() {
            document.getElementById("<%=searchBox.ClientID %>").click();
        }
    </script>
    <style>
        #navigation {
            float: left;
            width: 300px;
        }

        #contenido {
            margin: 0 300px;
            width: 800px;
        }
        #header{
            padding-top: 5px;
            height: 50px;
        }
    </style>
    <div class="container">
        <div id="header">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-6">
                    <div class="input-group">
                        <span class="input-group-btn">
                            <button id="searchBox" class="btn btn-default" runat="server" type="button" onserverclick="searchBox_ServerClick">Buscar</button>
                        </span>
                        <input type="text" class="form-control" id="txtSearchDI" runat="server" placeholder="Buscar Siniestro..." onkeydown="if (window.event.keyCode == 13) 
                                                                                                                                            {
                                                                                                                                                event.returnValue=false; 
                                                                                                                                                event.cancel = true;
                                                                                                                                                searchRecords();
                                                                                                                                            }">
                        <div class="input-group-btn">
                            <button type="button" id="criteriaBtn" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" runat="server">Nro. Pòliza<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="?criteria=num_di">Nro Pòliza</a></li>
                                <li><a href="?criteria=cliente">Cliente</a></li>
                                <li><a href="?criteria=fecha">Fecha</a></li>
                                <li><a href="?criteria=num_factura">Nro. Siniestro</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="navigation">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="#">Siniestros</a></li>
                <li role="presentation"><a href="#">Alta siniestro</a></li>
                <li role="presentation"><a href="#">Verificacion de Cobertura</a></li>
                <li role="presentation"><a href="#">Registro del Siniestro</a></li>
                <li role="presentation"><a href="#">Aceptacion por Aseguradora</a></li>
                <li role="presentation"><a href="#">Gestion de Taller</a></li>
                <li role="presentation"><a href="#">Cierre del Siniestro</a></li>
            </ul>
        </div>
        <div id="contenido">
            <div class="row">
                <div class="col-lg-12">
                    <asp:ListView ID="ClaimListView" runat="server"
                        DataKeyNames="ClaimID"
                        DataSourceID="ClaimSqldataSource">

                        <LayoutTemplate>
                            <div class="table responsive">
                                <table class="table table-striped" style="font-size: x-small">
                                    <thead>
                                        <tr>
                                            <th>Nro Pòliza</th>
                                            <th>Riesgo</th>
                                            <th>Fecha</th>
                                            <th>Seguro</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr runat="server" id="itemPlaceholder" />
                                    </tbody>
                                </table>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>' /></td>
                                <td>
                                    <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblRegistryDate" runat="server" Text='<%# Eval("RegistryDate") %>' /></td>
                                <td>
                                    <asp:Label ID="lblInsuranceManagerID" runat="server" Text='<%# Eval("InsuranceManagerID") %>' /></td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                        </InsertItemTemplate>
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="msg-box bg-warning alert-danger">No se encontraron Siniestros.</div>
                                </div>
                            </div>
                        </EmptyDataTemplate>

                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <!-- #region DATSOURCES -->

    <asp:SqlDataSource ID="ClaimSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="claim.sp_get_claim_by_CaseID" SelectCommandType="StoredProcedure"
        UpdateCommand="claim.update_claim" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ClaimID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="CaseID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="PolicyNumber" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="ClaimNumber" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="RiskName" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="PersonID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="LiquidatorID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="WorkshopID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="RegistryDate" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="CloseDate" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="Closed" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="ClaimDate" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="ClaimStatusID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="ClaimTypeID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="InsuranceExpertID" DefaultValue="" ConvertEmptyStringToNull="True" />
            <asp:Parameter Name="Section" DefaultValue="" ConvertEmptyStringToNull="True" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- #endregion -->
</asp:Content>
