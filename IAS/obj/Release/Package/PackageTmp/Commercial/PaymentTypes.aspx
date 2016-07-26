<%@ Page Title="Propuestas Medios de Pago" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentTypes.aspx.cs" Inherits="IAS.Commercial.PaymentTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Medios de Pago</h2>
    </div>

    <asp:UpdatePanel ID="upnlProposals" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="PaymentTypeListView" runat="server"
                DataKeyNames="PaymentTypeID"
                DataSourceID="PaymentDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                            <thead>
                                <th>Id.</th>
                                <th>Medio</th>
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
                            <asp:Label ID="lblPaymentTypeID" runat="server" Text='<%# Eval("PaymentTypeID") %>' /></td>
                        <td>
                            <asp:Label ID="lblPaymentType" runat="server" Text='<%# Eval("PaymentType") %>' /></td>
                       

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:label ID="txtPaymentTypeID" runat="server" Text='<%# Bind("PaymentTypeID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPaymentType" runat="server" Text='<%# Bind("PaymentType") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                       
                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr>

                        <td>
                            <asp:label ID="txtPaymentTypeID" runat="server" Text="" CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtPaymentType" runat="server" Text='<%# Bind("PaymentType") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                       

                        <td>
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="PaymentTypeDataPager" runat="server" PagedControlID="PaymentTypeListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>



            <asp:SqlDataSource ID="PaymentDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="commercial.sp_get_payment_types" SelectCommandType="StoredProcedure"
                UpdateCommand="commercial.sp_update_payment_type" UpdateCommandType="StoredProcedure"
                DeleteCommand="commercial.sp_delete_payment_type" DeleteCommandType="StoredProcedure"
                InsertCommand="commercial.sp_insert_payment_type" InsertCommandType="StoredProcedure">

                <DeleteParameters>
                    <asp:Parameter Name="PaymentTypeID" Type="Int64" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PaymentTypeID" Type="Int32" />
                    <asp:Parameter Name="PaymentType" Type="String" />
                
                </UpdateParameters>
                <InsertParameters>
                 
                    <asp:Parameter Name="PaymentType" Type="String" />
                 
                </InsertParameters>
            </asp:SqlDataSource>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
