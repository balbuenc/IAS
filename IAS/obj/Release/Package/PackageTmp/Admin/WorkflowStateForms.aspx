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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkflowStateForms.aspx.cs" Inherits="IAS.Admin.WorkflowStateForms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" EnableViewState="false">

     <div class="page-header">

         <ol class="breadcrumb">
            <li><a href="Workflows.aspx">Workflows</a></li>
            <li class="active">Formularios segun estado</li>
        </ol>

        <h2>Formularios segun estado</h2>
    </div>
                <div class="form-group">
                <label>Workflow:</label>
                <asp:DropDownList runat="server" ID="ddlWorkflows" SelectMethod="GetWorkflows" DataTextField="WorkflowName"
                    DataValueField="WorkflowID" AutoPostBack="true" CssClass="form-control" OnDataBound="ddlWorkflows_DataBound"  />
            </div>

     <asp:UpdatePanel ID="StateFormUpdatePanel" runat="server">

        <ContentTemplate>



            <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />

            <asp:ListView ID="StatesListView" runat="server"
                ItemType="IAS.Models.WorkflowStateForm" DataKeyNames="WorkflowStateFormID"
                SelectMethod="GetData"
                UpdateMethod="UpdateStateForm"
                InsertMethod="InsertStateForm"
                DeleteMethod="DeleteStateForm"
                InsertItemPosition="LastItem"
                OnItemCanceling="StatesListView_ItemCanceling"
                OnItemEditing="StatesListView_ItemEditing">
                <LayoutTemplate>

                    <table class="table table-striped">

                        <thead>
                            <tr>
                                <th>Estado</th>
                                <th>Formulario</th>
                                <th class="text-center">Solo lectura</th>
                                <th>&nbsp;</th>
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
                            <asp:Label ID="lblState" runat="server" Text="<%#Item.State.StateName %>" />
                        </td>
                        <td>
                            <asp:Label ID="lblForm" runat="server" Text="<%#Item.Form.FormName %>" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkReadOnly" Enabled="false" Checked="<%# Item.ReadOnlyForm %>" runat="server" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>

                    </tr>

                </ItemTemplate>

                <EditItemTemplate>

                    <tr>
                        <td>
                           <asp:Label ID="lblStateEdit" runat="server" Text="<%#Item.State.StateName %>" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlFormsEdit" runat="server" SelectMethod="GetForms"
                                ItemType="IAS.Models.Form" DataTextField="FormName" DataValueField="FormID" CssClass="form-control"
                                SelectedValue="<%# BindItem.FormID %>" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkReadOnly" Checked="<%# BindItem.ReadOnlyForm %>" runat="server" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>

                </EditItemTemplate>

                <InsertItemTemplate>

                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlStatesInsert" runat="server"  DataSourceID="StatesObjectDataSource" SelectedValue="<%# BindItem.StateID %>"
                                ItemType="IAS.Models.State" DataTextField="StateName" DataValueField="StateID" CssClass="form-control" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlFormsInsert" runat="server" SelectMethod="GetForms" SelectedValue="<%# BindItem.FormID %>"
                                ItemType="IAS.Models.Form" DataTextField="FormName" DataValueField="FormID" CssClass="form-control" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkReadOnlyInsert" Checked="<%# BindItem.ReadOnlyForm %>" runat="server" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Insertar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="SatesDataPager" runat="server" PagedControlID="StatesListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

            <asp:ObjectDataSource ID="StatesObjectDataSource" runat="server" SelectMethod="GetStates" TypeName="IAS.Admin.WorkflowStateForms" ConflictDetection="CompareAllValues">
                <SelectParameters>
                    <asp:QueryStringParameter Name="pDefaultWorkflowID" QueryStringField="WorkflowID" />
                    <asp:ControlParameter ControlID="ddlWorkflows" Name="pCurrentWorkflowID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </ContentTemplate>
    
     </asp:UpdatePanel>

</asp:Content>
