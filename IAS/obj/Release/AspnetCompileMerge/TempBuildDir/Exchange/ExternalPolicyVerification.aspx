<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExternalPolicyVerification.aspx.cs" Inherits="IAS.Exchange.ExternalPolicyVerification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <title>IAS | Verficacion de Póliza</title>
</head>
<body>

    <form id="ExternalPolicyVerificationForm" runat="server">
        <div class="container">
            <div class="row">
                <h1>Verificación de Cobertura de Póliza</h1>
            </div>
            <div class="row">
                <h3>Datos del Asegurado</h3>
                <asp:FormView ID="PersonData" runat="server" ItemType="IAS.Models.Person"
                    DataKeyNames="PersonID"
                    SelectMethod="GetPerson"
                    RenderOuterTable="false">
                    <ItemTemplate>
                        <h3>Informacion de Siniestros</h3>

                        <div class="containter-fluid" style="padding-left: 20px;">

                            <div class="row">
                                <div class="col-sm-2"><u>Cliente:</u></div>
                                <div class="col-sm-4">
                                    <%#:Item.FullName %>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2"><u>Telefonos:</u></div>
                                    <div class="col-sm-4">
                                        Particular: <strong><%#:string.IsNullOrEmpty(Item.MobilePhone )?"nd": Item.HomePhone %> </strong>
                                        Celular: <strong><%#:string.IsNullOrEmpty(Item.MobilePhone )?"nd": Item.MobilePhone %> </strong>
                                        Laboral: <strong><%#:string.IsNullOrEmpty(Item.BusinessPhone )?"nd": Item.BusinessPhone %> </strong>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-2"><u>Documentos:</u></div>

                                    <div class="col-sm-4">
                                        R.U.C.: <strong><%#:string.IsNullOrEmpty(Item.DocumentNumber )?"nd": Item.DocumentNumber%> </strong>
                                        C.I.: <strong><%#:string.IsNullOrEmpty(Item.DocumentNumber2 )?"nd": Item.DocumentNumber2 %> </strong>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <div class="msg-box bg-info">
                            No hay datos de siniestros para mostrar
                        </div>
                    </EmptyDataTemplate>

                </asp:FormView>
            </div>


            <div class="row">
                <h3>Siniestros del caso.</h3>
                <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />
            </div>

            <div class="row">
                <asp:ListView ID="ClaimListView" runat="server"
                    DataKeyNames="ClaimID"
                    DataSourceID="ClaimSqldataSource">
                    <LayoutTemplate>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Poliza</th>
                                    <th>Nro. Siniestro</th>
                                    <th>Nombre del riesgo</th>
                                    <th>Fecha Registro</th>
                                    <th>Fecha Cierre</th>
                                    <th>Cerrado</th>
                                    <th>Fecha Siniestro</th>
                                    <th>Section</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr runat="server" id="itemPlaceholder" />
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber") %>' /></td>
                            <td>
                                <asp:Label ID="lblClaimNumber" runat="server" Text='<%# Eval("ClaimNumber") %>' /></td>
                            <td>
                                <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                            <td>
                                <asp:Label ID="lblRegistryDate" runat="server" Text='<%#:string.Format("{0:d}", Eval("RegistryDate")) %>' /></td>
                            <td>
                                <asp:Label ID="lblCloseDate" runat="server" Text='<%#:string.Format("{0:d}", Eval("CloseDate")) %>' /></td>
                            <td>
                                <asp:Label ID="lblClosed" runat="server" Text='<%# Eval("Closed") %>' /></td>
                            <td>
                                <asp:Label ID="lblClaimDate" runat="server" Text='<%#:string.Format("{0:d}", Eval("ClaimDate")) %>' /></td>
                            <td>
                                <asp:Label ID="lblSection" runat="server" Text='<%# Eval("Section") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <strong>Estado:</strong>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' />
                            </td>
                          
                        <tr>
                            <td colspan="5">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <asp:Button ID="AproveBtn" runat="server" CssClass="btn btn-success" Text="Cobertura Aprobada" />
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:Button ID="DiscardBtn" runat="server" CssClass="btn btn-danger" Text="Cobertura Rechazada" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <td>
                            <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtClaimNumber" runat="server" Text='<%# Bind("ClaimNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRegistryDate" runat="server" Text='<%# Bind("RegistryDate", "{0:dd/MM/yyyy}") %>' CssClass="form-control datetime" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCloseDate" runat="server" Text='<%# Bind("CloseDate", "{0:dd/MM/yyyy}") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtClosed" runat="server" Text='<%# Bind("Closed") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtClaimDate" runat="server" Text='<%# Bind("ClaimDate",  "{0:dd/MM/yyyy}") %>' CssClass="form-control datetime" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("Section") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </EditItemTemplate>
                </asp:ListView>
            </div>

            <script>
                $("a[title]").tooltip();
            </script>
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

         

        </div>
    </form>
</body>
</html>
