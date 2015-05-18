<%@ Page Title="Verificación de Cobertura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PolicyVerification.aspx.cs" Inherits="IAS.ClaimManagment.PolicyVerification" %>
<%@ Register Src="~/CaseManagment/CaseData.ascx" TagPrefix="uc1" TagName="CaseData" %>
<%@ Register Src="~/CaseManagment/CaseTransitionManager.ascx" TagPrefix="uc1" TagName="CaseTransitionManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">
      

        function OpenPage() {

            var prodId = getParameterByName('CaseID');

            var url = "http://aibsql.cloudapp.net/ReportServer/Pages/ReportViewer.aspx?%2fIAS_SSRS%2fEstadoCuenta&rs:Command=Render&CaseID=" + prodId;

        window.open(url);

        }

        function getParameterByName(name) {
            var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
            return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
        }

</script>
    <asp:UpdatePanel ID="caseInfoPanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

            <uc1:CaseData runat="server" ID="CaseData" />

        </ContentTemplate>

    </asp:UpdatePanel>

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

    <asp:UpdatePanel ID="WorkflowUPanel" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />

            <asp:ListView ID="CollectionsListView" runat="server"
                ItemType="IAS.Models.Collection" DataKeyNames="CollectionID"
                SelectMethod="GetCollectionsForCase">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nombre del riesgo</th>
                                <th>Poliza</th>
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
                            <asp:Label ID="lblRiskName" runat="server" Text="<%#:Item.RiskName%>" />
                        </td>
                        <td>
                            <asp:Label ID="lblPolicyNumber" runat="server" Text="<%#:Item.PolicyNumber%>" />
                        </td>
                    </tr>
                   
                </ItemTemplate>
            </asp:ListView>

            <script>
                $("a[title]").tooltip();
            </script>

        </ContentTemplate>

    </asp:UpdatePanel>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Verificación de Cobertura</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="input-group col-sm-8">
                    <span class="input-group-addon" id="basic-addon1">@</span>
                    <asp:DropDownList ID="InsuranceMangerDDL" runat="server" CssClass="form-control" DataSourceID="InsuranceManagersSqlDataSource" DataTextField="InsuranceManager" DataValueField="InsuranceManagerID"></asp:DropDownList>
                </div>
                <div class="col-sm-4">
                <asp:Button ID="SendEmailBtn" runat="server" CssClass="btn btn-info" Text="Solicitar Verificación" />
                    </div>
            </div>
            <asp:SqlDataSource ID="InsuranceManagersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="SELECT [InsuranceManagerID], [InsuranceManager] FROM [InsuranceManagers]"></asp:SqlDataSource>

        </div>
    </div>
    

    <asp:UpdatePanel ID="trasicionManagerPanel" runat="server">

        <ContentTemplate>

            <uc1:CaseTransitionManager runat="server" ID="CaseTransitionManager" OnCaseStateChanged="CaseTransitionManager_CaseStateChanged" />

        </ContentTemplate>
        
    </asp:UpdatePanel>
    <div>
            <asp:Button ID="CaseAccountResumeBtn" runat="server" Text="Estado de cuenta" Width="148px" CssClass="btn btn-info" OnClientClick="javascript:OpenPage();" />
    </div>
</asp:Content>
