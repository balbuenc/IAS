<%--   
    «Copyright 2014 Balcazz HT, http://www.balcazzht.com»

    This file is part of IAS | Insurance Advanced Services.

    IAS is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    IAS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
--%>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CaseTransitionManager.ascx.cs" Inherits="IAS.CaseManagment.CaseTransitionManager" %>

<h3>Historial del caso</h3>
<asp:HiddenField ID="hdnCaseID" runat="server" />

<asp:ListView ID="CaseTransitionsListView" runat="server"
    ItemType="IAS.Models.CaseTransition"
    SelectMethod="GetData"
    DataKeyNames="CaseTransitionID"   OnItemCommand="CaseTransitionsListView_ItemCommand">

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
                    <asp:Label runat="server" ID="lblTransitionDate" Text='<%# Bind("TransitionDate", "{0:dd/MM/yyyy HH:mm:ss}") %>' Style="font-size: 0.8em;" />
                </div>

                <div class="col-sm-4">
                    <asp:Label ID="lblPreviousState" runat="server" Text="<%# Item.PreviousState.StateName %>" />
                    <asp:Image ID="imgArrow" ImageUrl="~/Images/arrow-icon.png" runat="server" />
                    <asp:Label ID="lblNewState" runat="server" Text="<%# Item.NewState.StateName %>" />
                </div>

                <div class="col-sm-2">
                    <asp:Image ID="imgEffeciveDate" ImageUrl="~/Images/schedule-icon.png" CssClass="history-icon" runat="server" />
                    <asp:Label runat="server" ID="lblEffectiveDate" Text='<%# Bind("EffectiveDate", "{0:dd/MM/yyyy HH:mm:ss}") %>' Style="font-size: 0.8em;" />
                </div>

                <div class="col-sm-3">
                    <asp:Image ID="imgUser" ImageUrl="~/Images/user-icon.png" runat="server" CssClass="history-icon" />
                    <asp:Label ID="lblUser" runat="server" Text="<%# Item.User.FullName %>" />
                </div>

            </div>

            <div class="row">

                <div class="col-sm-10">
                    <asp:Image ID="imgComments" ImageUrl="~/Images/comments-icon.png" CssClass="history-icon" runat="server" />
                    <asp:Label ID="Label3" runat="server" Text="<%#Item.Comment%>" />
                    <asp:Label ID="lblCaseTransitionID" runat="server" Text="<%#Item.CaseTransitionID%>"  Visible="false" />
                </div>
                <div class="col-sm-2">
                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Drop" CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar el registro.?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                    </asp:LinkButton>
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
            <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
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

<asp:SqlDataSource ID="CaseTransitionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"></asp:SqlDataSource>

