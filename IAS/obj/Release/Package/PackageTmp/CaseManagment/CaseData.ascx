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

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CaseData.ascx.cs" Inherits="IAS.CaseManagment.CaseData" %>

 <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

<asp:FormView ID="CaseDetail" runat="server" ItemType="IAS.Models.Case"
    DataKeyNames="CaseID"
    SelectMethod="GetCase"
    RenderOuterTable="false">
    <ItemTemplate>

        <h3><%#:Item.Workflow.WorkflowName %></h3>

        <h4><%#:Item.Description %></h4>

        <div class="containter-fluid" style="padding-left: 20px;">

            <div class="row">
                <div class="col-sm-2"><u>Estado</u>:</div>
                <div class="col-sm-4">
                    <%#:Item.CurrentState.StateName %>
                </div>
                <div class="col-sm-2"><u>Prioridad</u>:</div>
                <div class="col-sm-4">
                    <%#:Item.CasePriority.PriorityName %>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2"><u>Ult. gestión</u>:</div>
                <div class="col-sm-4">
                    <%#:Item.LastModificationDate %>
                </div>
                <div class="col-sm-2"><u>F. Agenda</u>:</div>
                <div class="col-sm-4">
                    <%#:Item.EffectiveDate %>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2"><u>Creado el</u>:</div>
                <div class="col-sm-4">
                    <%#:Item.CreationDate %>
                </div>
                <div class="col-sm-2"><u>Responsable</u>:</div>
                <div class="col-sm-4">
                    <%#:Item.User.FullName %>
                </div>
            </div>
        </div>

    </ItemTemplate>

</asp:FormView>

<%--<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
    <ContentTemplate>--%>

<asp:FormView ID="ClientPaymentDayInfo" runat="server" ItemType="IAS.Models.ClientPaymentDay"
    DataKeyNames="ClientPaymentDayID"
    SelectMethod="GetClientPaymentDay"
    UpdateMethod="ClientPaymentDayInfo_UpdateItem"
    RenderOuterTable="false">
    <ItemTemplate>
        <div class="containter-fluid" style="padding-left: 20px;">
            <div class="row">
                <div class="col-sm-2"><u>Dia que suele pagar</u>:</div>
                <div class="col-sm-4">
                    <asp:Label ID="lblPaymentDay" runat="server" Text="<%#:Item.PaymentDay %>"></asp:Label>
                </div>
            </div>
        </div>
        <td class="text-right">
            <asp:Button ID="btnUpdatePaymentDay" runat="server"  CommandName="Edit" Text="Cambiar dia" CssClass="btn btn-default"/> 
        </td>
    </ItemTemplate>
    <EditItemTemplate>
        <div class="containter-fluid" style="padding-left: 20px;">
            <div class="row">
                <div class="col-sm-2"><u>Dia que suele pagar</u>:</div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPaymentDay" runat="server" Text="<%# BindItem.PaymentDay %>"></asp:TextBox>
                </div>
            </div>
        </div>
        <td class="text-right">
            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
        </td>
    </EditItemTemplate>
</asp:FormView>