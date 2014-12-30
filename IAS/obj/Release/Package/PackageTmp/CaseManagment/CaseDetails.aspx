<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseDetails.aspx.cs" Inherits="IAS.CaseManagment.CaseDetails" %>

<%@ Register Src="~/CaseManagment/CaseData.ascx" TagPrefix="uc1" TagName="CaseData" %>
<%@ Register Src="~/CaseManagment/CaseTransitionManager.ascx" TagPrefix="uc1" TagName="CaseTransitionManager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:CaseData runat="server" ID="CaseData" />    
    
    <uc1:CaseTransitionManager runat="server" ID="CaseTransitionManager" />
</asp:Content>
