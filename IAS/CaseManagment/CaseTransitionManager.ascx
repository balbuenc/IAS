<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CaseTransitionManager.ascx.cs" Inherits="IAS.CaseManagment.CaseTransitionManager" %>

<h3>Historial del caso</h3>
<asp:HiddenField ID="hdnCaseID" runat="server" />

<asp:ListView ID="CaseTransitionsListView" runat="server"
    ItemType="IAS.Models.CaseTransition"
    SelectMethod="GetData"
    DataKeyNames="CaseTransitionID">

    <LayoutTemplate>

        <div class="containter-fluid">

            <div runat="server" id="itemPlaceholder" />

        </div>

    </LayoutTemplate>

    <ItemTemplate>

        <div class="history-row">

            <div class="row">

                <div class="col-sm-3">
                    <asp:Image ID="imgCalendar" ImageUrl="~/Images/calendar-icon.png" CssClass="history-icon" runat="server" />
                    <asp:Label runat="server" ID="lblTransitionDate" Text='<%# Bind("TransitionDate", "{0:dd/MM/yyyy HH:mm:ss}") %>' Style="font-size:0.8em;" />
                </div>

                <div class="col-sm-4">
                    <asp:Label ID="lblPreviousState" runat="server" Text="<%# Item.PreviousState.StateName %>" />
                    <asp:Image ID="imgArrow" ImageUrl="~/Images/arrow-icon.png" runat="server" />
                    <asp:Label ID="lblNewState" runat="server" Text="<%# Item.NewState.StateName %>" />                 
                </div>

                <div class="col-sm-2">
                    <asp:Image ID="imgEffeciveDate" ImageUrl="~/Images/schedule-icon.png" CssClass="history-icon" runat="server" />
                    <asp:Label runat="server" ID="lblEffectiveDate" Text='<%# Bind("EffectiveDate", "{0:dd/MM/yyyy HH:mm:ss}") %>' Style="font-size:0.8em;" />
                </div>

                <div class="col-sm-3">
                    <asp:Image ID="imgUser" ImageUrl="~/Images/user-icon.png" runat="server" CssClass="history-icon" />
                    <asp:Label ID="lblUser" runat="server" Text="<%# Item.User.FullName %>" />
                </div>

            </div>

            <div class="row">

                <div class="col-sm-12"> 
                    <asp:Image ID="imgComments" ImageUrl="~/Images/comments-icon.png" CssClass="history-icon" runat="server" />
                    <asp:Label ID="Label3" runat="server" Text="<%#Item.Comment%>" />
                </div>

            </div>

        </div>

    </ItemTemplate>

    <EmptyDataTemplate>

        <div class="msg-box bg-info">
            El historial del caso esta vacío
        </div>

    </EmptyDataTemplate>

</asp:ListView>

<h3>Cambio de estado del caso</h3>

<asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="msg-box bg-danger" Visible="false"></asp:Label>

<div class="form-group container-fluid">
    <div class="row">
        <div class="col-sm-9">
            <label>Nuevo estado:</label>
            <asp:DropDownList ID="ddlNewState" runat="server" CssClass="form-control"
                ItemType="IAS.Models.State"
                SelectMethod="GetNewStates"
                DataTextField="StateName" DataValueField="StateID" AutoPostBack="True" OnDataBound="ddlNewState_DataBound" OnSelectedIndexChanged="ddlNewState_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-sm-3">
            <label>Efectividad:</label>
            <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="form-control datetime"></asp:TextBox>
        </div>
    </div>
</div>

<div class="form-group">
    <label>Comentarios:</label>
    <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
</div>

<div class="text-right">
    <asp:Button ID="buttonChangeState" runat="server" Text="Cambiar estado" CssClass="btn btn-info" OnClick="buttonChangeState_Click" />
</div>

