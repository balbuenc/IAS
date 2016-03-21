<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Coverages.aspx.cs" Inherits="IAS.Admin.Coverages" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h2>Coberturas</h2>
    </div>

    <asp:UpdatePanel ID="upnlCoverages" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="CoveragesListView" runat="server"
                ItemType="IAS.Models.Coverage" DataKeyNames="CoverageID"
                SelectMethod="GetCoverages"
                UpdateMethod="UpdateCoverage"
                InsertMethod="InsertCoverage"
                DeleteMethod="DeleteCoverage"
                InsertItemPosition="LastItem"
                OnItemCanceling="CoveragesListView_ItemCanceling"
                OnItemEditing="CoveragesListView_ItemEditing">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th class="text-center">Activo</th>
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
                            <asp:Label ID="lblCoverageName" runat="server" Text='<%# Item.CoverageName%>' />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkActive" runat="server" Checked='<%# Item.Active %>' Enabled="false" />
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
                            <asp:TextBox ID="txtCoverageName" runat="server" Text='<%# BindItem.CoverageName%>' CssClass="form-control" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkActive" runat="server" Checked='<%# BindItem.Active %>' />
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
                            <asp:TextBox ID="txtCoverageName" runat="server" Text='<%#: BindItem.CoverageName%>' CssClass="form-control" PlaceHolder="Nueva covertura" />
                        </td>
                        <td class="text-center">
                            <asp:CheckBox ID="chkActive" runat="server" Checked='<%# BindItem.Active %>' />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="CoveragesDataPager" runat="server" PagedControlID="CoveragesListView" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
