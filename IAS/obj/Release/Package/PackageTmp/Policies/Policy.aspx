<%@ Page Title="Póliza" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Policy.aspx.cs" Inherits="IAS.Policies.Policy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Administrar Póliza</h2>
    </div>

    <asp:UpdatePanel ID="upnlPolicies" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:FormView ID="PolicyFormView"
                runat="server"
                DataKeyNames="PolicyNumber"
                DataSourceID="PolicyDataSource">

                <ItemTemplate>

                    <div class="container">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputPolicyNumber" class="col-lm-4 control-label">Nro. Póliza</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblPolicyNumber" placeholder="Nro. Póliza" value='<%# Eval("PolicyNumber") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSectionNumber" class="col-lm-4 control-label">Sección</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblSectionNumber" placeholder="Sección" value='<%# Eval("SectionNumber") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputInsuranceManagerID" class="col-lm-4 control-label">Aseguradora</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblInsuranceManagerID" placeholder="Aseguradora" value='<%# Eval("InsuranceManagerID") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmissionDate" class="col-lm-4 control-label">Fecha de Emisión</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblEmissionDate" placeholder="Fecha de Emisíon" value='<%# Eval("EmissionDate") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputExpirationDate" class="col-lm-4 control-label">Fecha de Vencimiento</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblExpirationDate" placeholder="Fecha de Vencimiento" value='<%# Eval("ExpirationDate") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPersonID" class="col-lm-4 control-label">Asegurado</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblPersonID" placeholder="Fecha de Emisíon" value='<%# Eval("PersonID") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Estado</label>
                                <div class="col-lm-8">
                                    <input type="text" class="form-control" id="lblStatus" placeholder="Estado" value='<%# Eval("Status") %>'>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Monto cubierto</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtCoverage" runat="server" Text='<%# Bind("Coverage") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Riesgo</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Cant. cuotas</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtPaymentsNumber" runat="server" Text='<%# Bind("PaymentsNumber") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Prima</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtPremium" runat="server" Text='<%# Bind("Premium") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Premio</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtPremiunPlusTax" runat="server" Text='<%# Bind("PremiunPlusTax") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Asociado</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtPartnerID" runat="server" Text='<%# Bind("PartnerID") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Comision ASSA %</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtComissionASSAPercent" runat="server" Text='<%# Bind("ComissionASSAPercent") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Comision ASSA</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtComissionASSA" runat="server" Text='<%# Bind("ComissionASSA") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Asociado %</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtPartnerComissionPercent" runat="server" Text='<%# Bind("PartnerComissionPercent") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputStatus" class="col-lm-4 control-label">Asociado %</label>
                                <div class="col-lm-8">
                                    <asp:TextBox ID="txtPartnerComissionAmount" runat="server" Text='<%# Bind("PartnerComissionAmount") %>' CssClass="form-control" Font-Size="X-Small" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                                <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                            </div>
                        </form>
                    </div>




                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPolicyNumber" runat="server" Text='<%# Bind("PolicyNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtSectionNumber" runat="server" Text='<%# Bind("SectionNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtInsuranceManagerID" runat="server" Text='<%# Bind("InsuranceManagerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtEmissionDate" runat="server" Text='<%# Bind("EmissionDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtExpirationDate" runat="server" Text='<%# Bind("ExpirationDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPersonID" runat="server" Text='<%# Bind("PersonID") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" Font-Size="X-Small" /></td>


                        <td>
                            <asp:TextBox ID="txtCoverage" runat="server" Text='<%# Bind("Coverage") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPaymentsNumber" runat="server" Text='<%# Bind("PaymentsNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td>
                            <asp:TextBox ID="txtPremium" runat="server" Text='<%# Bind("Premium") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPremiunPlusTax" runat="server" Text='<%# Bind("PremiunPlusTax") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerID" runat="server" Text='<%# Bind("PartnerID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtComissionASSAPercent" runat="server" Text='<%# Bind("ComissionASSAPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtComissionASSA" runat="server" Text='<%# Bind("ComissionASSA") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerComissionPercent" runat="server" Text='<%# Bind("PartnerComissionPercent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPartnerComissionAmount" runat="server" Text='<%# Bind("PartnerComissionAmount") %>' CssClass="form-control" Font-Size="X-Small" /></td>


                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                </InsertItemTemplate>

            </asp:FormView>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="PolicyDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="sp_get_policy" SelectCommandType="StoredProcedure"
        UpdateCommand="sp_update_policy" UpdateCommandType="StoredProcedure"
        DeleteCommand="sp_delete_policy" DeleteCommandType="StoredProcedure"
        InsertCommand="sp_insert_policy" InsertCommandType="StoredProcedure">

        <SelectParameters>
            <asp:QueryStringParameter Name="PolicyNumber" QueryStringField="PolicyNumber" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
            <asp:Parameter Name="SectionNumber" Type="Int32" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int32" />
            <asp:Parameter Name="EmissionDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="PersonID" Type="Int32" />
            <asp:Parameter Name="Coverage" Type="Decimal" />
            <asp:Parameter Name="RiskName" Type="String" />
            <asp:Parameter Name="PaymentsNumber" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Premium" Type="Decimal" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="PolicyNumber" Type="Int32" />
            <asp:Parameter Name="SectionNumber" Type="Int32" />
            <asp:Parameter Name="InsuranceManagerID" Type="Int32" />
            <asp:Parameter Name="EmissionDate" Type="DateTime" />
            <asp:Parameter Name="ExpirationDate" Type="DateTime" />
            <asp:Parameter Name="PersonID" Type="Int32" />
            <asp:Parameter Name="Coverage" Type="Decimal" />
            <asp:Parameter Name="RiskName" Type="String" />
            <asp:Parameter Name="PaymentsNumber" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Premium" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>
