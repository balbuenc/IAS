<%@ Page Title="Resultados de Gestión de cuotas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CollectionManagementResults.aspx.cs" Inherits="IAS.Admin.CollectionManagementResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Resultado de Cobranzas</h2>
    </div>



    <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

    <asp:ListView ID="CollectionManagementResultListView" runat="server"
        DataKeyNames="CollectionManagementResultID"
        DataSourceID="CollectionResultsSqlDataSource"
        InsertItemPosition="LastItem">
        <LayoutTemplate>
            <div class="table responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>

                            <th>Resultado</th>
                            <th>&nbsp;</th>
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
                    <asp:Label ID="lblDenomination" runat="server" Text='<%# Eval("Result") %>' />
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
                    <asp:TextBox ID="txtDenomination" runat="server" Text='<%# Bind("Result") %>' CssClass="form-control" />
                </td>
                <td class="text-right">
                    <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                    <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>

                <td>
                    <asp:TextBox ID="txtDenomination" runat="server" Text='<%# Bind("Result") %>' CssClass="form-control" />
                </td>
                <td class="text-right">
                    <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                </td>
            </tr>
        </InsertItemTemplate>

    </asp:ListView>

    <asp:DataPager ID="CollectionManagementResultDataPager" runat="server" PagedControlID="CollectionManagementResultListView" PageSize="5">
        <Fields>
            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
            <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
    <!-- #region DATA SOURCES -->

    <asp:SqlDataSource ID="CollectionResultsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="select r.CollectionManagementResultID, r.Result from  [dbo].[CollectionManagementResult] r"
        InsertCommand="insert into [dbo].[CollectionManagementResult](result) values (@result)"
        DeleteCommand="delete from [dbo].[CollectionManagementResult] where CollectionManagementResultID = @CollectionManagementResultID"
        UpdateCommand="update [dbo].[CollectionManagementResult] set result = @result where CollectionManagementResultID = @CollectionManagementResultID">
        <InsertParameters>
            <asp:Parameter Name="result" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="CollectionManagementResultID" Type="int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CollectionManagementResultID" Type="int32" />
            <asp:Parameter Name="result" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
 <!-- #endregion -->
</asp:Content>
