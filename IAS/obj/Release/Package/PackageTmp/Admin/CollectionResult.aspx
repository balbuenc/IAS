<%@ Page Title="Asignaciòn de Estados de Cuota" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CollectionResult.aspx.cs" Inherits="IAS.Admin.CollectionResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Asignaciòn de Eatados de Cuota por Resultado</h2>
    </div>


    <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

    <asp:ListView ID="CollectionManagementResultListView" runat="server"
        DataKeyNames="CollectionStateID"
        DataSourceID="CollectionResultsSqlDataSource1"
        InsertItemPosition="LastItem"
        OnItemInserting="CollectionManagementResultListView_ItemInserting">
        <LayoutTemplate>
            <div class="table responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Resultado</th>
                            <th>Estado de cuota</th>
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
                    <asp:Label ID="lblResultado" runat="server" Text='<%# Eval("Result") %>' />
                </td>
                <td>
                    <asp:Label ID="lblEstadoCuota" runat="server" Text='<%# Eval("CollectionStateName") %>' />
                </td>
                <td class="text-right">
                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                </td>
            </tr>
        </ItemTemplate>

        <InsertItemTemplate>
            <tr>

                <td>
                    <asp:DropDownList ID="ddlResultado" runat="server" CssClass="form-control"
                        DataSourceID="CollectionResultDS"
                        DataTextField="Result" DataValueField="CollectionManagementResultID">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddlEstadoCuota" runat="server" CssClass="form-control"
                        DataSourceID="CollectionStateDS"
                        DataTextField="CollectionStateName" DataValueField="CollectionStateID">
                    </asp:DropDownList>
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
    <asp:SqlDataSource ID="CollectionResultsSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="sp_get_collections_result" SelectCommandType="StoredProcedure"
        InsertCommand="insert into [dbo].[CollectionResult](CollectionStateID,CollectionManagementResultID ) values (@CollectionStateID,@CollectionManagementResultID)"
        DeleteCommand="delete from [dbo].[CollectionResult] where CollectionStateID = @CollectionStateID" DeleteCommandType="Text">
        <InsertParameters>
            <asp:Parameter Name="CollectionStateID" Type="Int16" />
            <asp:Parameter Name="CollectionManagementResultID" Type="Int16" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="CollectionStateID" Type="int16" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CollectionResultDS" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="SELECT [CollectionManagementResultID],[Result]  FROM [dbo].[CollectionManagementResult]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CollectionStateDS" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="SELECT [CollectionStateID],[CollectionStateName] FROM [dbo].[CollectionState] where CollectionStateID not in (select CollectionStateID from CollectionResult) "></asp:SqlDataSource>

    <!-- #endregion -->
</asp:Content>
