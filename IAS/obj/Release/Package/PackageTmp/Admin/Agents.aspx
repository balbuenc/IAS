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

<%@ Page Title="Agentes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agents.aspx.cs" Inherits="IAS.Admin.Agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Agentes</h2>
    </div>
    <asp:UpdatePanel ID="upnlSecciones" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="AgentListView" runat="server"
                DataKeyNames="AgentID"
                DataSourceID="AgentDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <th>Agente ID</th>
                                <th>Agente</th>
                                <th>Celular</th>
                                <th>Email</th>
                                <th>Dirección</th>
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
                            <asp:Label ID="lblAgentID" runat="server" Text='<%# Eval("AgentID") %>' /></td>
                        <td>
                            <asp:Label ID="lblAgent" runat="server" Text='<%# Eval("Agent") %>' /></td>
                        <td>
                            <asp:Label ID="lblMobilePhoneNumber" runat="server" Text='<%# Eval("MobilePhoneNumber") %>' /></td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' /></td>
                        <td>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>' /></td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtAgentID" runat="server" Text='<%# Bind("AgentID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtAgent" runat="server" Text='<%# Bind("Agent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtMobilePhoneNumber" runat="server" Text='<%# Bind("MobilePhoneNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtAgentID" runat="server" Text='<%# Bind("AgentID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtAgent" runat="server" Text='<%# Bind("Agent") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtMobilePhoneNumber" runat="server" Text='<%# Bind("MobilePhoneNumber") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="AgentsDataPager" runat="server" PagedControlID="AgentListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="AgentDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="SELECT [AgentID],[Agent],[MobilePhoneNumber],[Email],[Address]  FROM [dbo].[Agent]" SelectCommandType="Text"
        DeleteCommand="DELETE FROM [dbo].[Agent] WHERE AgentID = @AgentID;" DeleteCommandType="Text"
        InsertCommand="INSERT INTO [dbo].[Agent]([Agent],[MobilePhoneNumber],[Email],[Address]) VALUES (@Agent,@MobilePhoneNumber,@Email,@Address);" InsertCommandType="Text"
        UpdateCommand="update [dbo].[Agent] set [Agent] = @Agent,	[MobilePhoneNumber] = @MobilePhoneNumber,	[Email] = @Email,	[Address] = @Address where AgentID = @AgentID;" UpdateCommandType="Text">
        <DeleteParameters>
            <asp:Parameter Name="AgentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Agent" Type="String" />
            <asp:Parameter Name="MobilePhoneNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AgentID" Type="Int32" />
            <asp:Parameter Name="Agent" Type="String" />
            <asp:Parameter Name="MobilePhoneNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />           
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
