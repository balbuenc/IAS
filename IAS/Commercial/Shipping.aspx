<%@ Page Title="Envio de Pólizas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shipping.aspx.cs" Inherits="IAS.Commercial.Shipping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Envío de Pólizas</h2>
    </div>

    <asp:UpdatePanel ID="upnlShipping" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="ShippingListView" runat="server"
                DataKeyNames="ShippingID"
                DataSourceID="ShippingDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                            <thead>
                                <th>#</th>
                                <th>Beneficiario</th>
                                <th>Dirección</th>
                                <th>Estado</th>
                                <th>Fecha</th>
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
                            <asp:Label ID="lblShippingID" runat="server" Text='<%# Eval("ShippingID") %>' /></td>
                        <td>
                            <asp:Label ID="lblBeneficiary" runat="server" Text='<%# Eval("Beneficiary") %>' /></td>
                        <td>
                            <asp:Label ID="lblShippingAddress" runat="server" Text='<%# Eval("ShippingAddress") %>' /></td>
                        <td>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' /></td>
                        <td>
                            <asp:Label ID="lblShippingDate" runat="server" Text='<%# Eval("ShippingDate") %>' /></td>


                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="txtShippingID" runat="server" Text='<%# Bind("ShippingID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiary" runat="server" Text='<%# Bind("Beneficiary") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtShippingAddress" runat="server" Text='<%# Bind("ShippingAddress") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtShippingDate" runat="server" Text='<%# Bind("ShippingDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>

                        <td>
                            <asp:Label ID="txtShippingID" runat="server" Text="#"   Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtBeneficiary" runat="server" Text='<%# Bind("Beneficiary") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtShippingAddress" runat="server" Text='<%# Bind("ShippingAddress") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtShippingDate" runat="server" Text='<%# Bind("ShippingDate") %>' CssClass="form-control" Font-Size="X-Small" /></td>


                        <td>
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="PaymentTypeDataPager" runat="server" PagedControlID="ShippingListView" PageSize="20">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>



            <asp:SqlDataSource ID="ShippingDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="SELECT [ShippingID],[Beneficiary],[ShippingAddress],[Status],[ShippingDate]  FROM [commercial].[Shipping]" SelectCommandType="Text"
                UpdateCommand="UPDATE [commercial].[Shipping]  set [Beneficiary] = @Beneficiary,[ShippingAddress] = @ShippingAddress, [Status] = @Status,[ShippingDate] = @ShippingDate where ShippingID = @ShippingID" UpdateCommandType="Text"
                DeleteCommand="DELETE FROM [commercial].[Shipping] WHERE ShippingID = @ShippingID" DeleteCommandType="Text"
                InsertCommand="INSERT INTO [commercial].[Shipping] ([Beneficiary],[ShippingAddress],[Status],[ShippingDate]) VALUES (@Beneficiary,@ShippingAddress,@Status,@ShippingDate)" InsertCommandType="Text">

                <DeleteParameters>
                    <asp:Parameter Name="ShippingID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ShippingID" Type="Int32" />
                    <asp:Parameter Name="Beneficiary" Type="String" />
                    <asp:Parameter Name="ShippingAddress" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="ShippingDate" Type="DateTime" />

                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Beneficiary" Type="String" />
                    <asp:Parameter Name="ShippingAddress" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="ShippingDate" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
