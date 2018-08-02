<%@ Page Title="Cotizaciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quotes.aspx.cs" Inherits="IAS.Commercial.Quotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Cotizaciones</h2>
    </div>

    <asp:UpdatePanel ID="upnlShipping" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="QuotesListView" runat="server"
                DataKeyNames="QuotationID"
                DataSourceID="QuotesDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                            <thead>
                                <th>#</th>
                                <th>Cliente</th>
                                <th>Riesgo</th>
                                <th>Ramo</th>
                                <th>Estado</th>
                                <th>Cotizacion</th>
                                <th>Mapfre</th>
                                <th>Sancor</th>
                                <th>Asepasa</th>
                                <th>Seguridad</th>
                                <th>Yacyreta</th>
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
                            <asp:Label ID="lblQuotationID" runat="server" Text='<%# Eval("QuotationID") %>' /></td>
                        <td>
                            <asp:Label ID="lblClient" runat="server" Text='<%# Eval("Client") %>' /></td>
                        <td>
                            <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                        <td>
                            <asp:Label ID="lblSection" runat="server" Text='<%# Eval("Section") %>' /></td>
                        <td>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' /></td>
                        <td>
                            <asp:Label ID="lblQuote" runat="server" Text='<%# Eval("Quote") %>' /></td>
                        <td>
                            <asp:Label ID="lblMapfre" runat="server" Text='<%# Eval("Mapfre") %>' /></td>
                        <td>
                            <asp:Label ID="lblSancor" runat="server" Text='<%# Eval("Sancor") %>' /></td>
                        <td>
                            <asp:Label ID="lblAsepasa" runat="server" Text='<%# Eval("Asepasa") %>' /></td>
                        <td>
                            <asp:Label ID="lblSeguridadSeguros" runat="server" Text='<%# Eval("SeguridadSeguros") %>' /></td>
                        <td>
                            <asp:Label ID="lblYacyreta" runat="server" Text='<%# Eval("Yacyreta") %>' /></td>


                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="txtQuotationID" runat="server" Text='<%# Bind("QuotationID") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtClient" runat="server" Text='<%# Bind("Client") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("Section") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtQuote" runat="server" Text='<%# Bind("Quote") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtMapfre" runat="server" Checked='<%# Bind("Mapfre") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtSancor" runat="server" Checked='<%# Bind("Sancor") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtAsepasa" runat="server" Checked='<%# Bind("Asepasa") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtSeguridadSeguros" runat="server" Checked='<%# Bind("SeguridadSeguros") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtYacyreta" runat="server" Checked='<%# Bind("Yacyreta") %>' CssClass="form-control" />
                           

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
                            <asp:Label ID="txtQuotationID" runat="server" Text="" CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtClient" runat="server" Text='<%# Bind("Client") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("Section") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:TextBox ID="txtQuote" runat="server" Text='<%# Bind("Quote") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtMapfre" runat="server" Checked='<%# Bind("Mapfre") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtSancor" runat="server" Checked='<%# Bind("Sancor") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtAsepasa" runat="server" Checked='<%# Bind("Asepasa") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtSeguridadSeguros" runat="server" Checked='<%# Bind("SeguridadSeguros") %>' CssClass="form-control" /></td>
                        <td>
                            <asp:CheckBox ID="txtYacyreta" runat="server" Checked='<%# Bind("Yacyreta") %>' CssClass="form-control" /></td>


                        <td>
                            <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="QuotesDataPager" runat="server" PagedControlID="QuotesListView" PageSize="20">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>



            <asp:SqlDataSource ID="QuotesDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="SELECT [QuotationID],[Client],[RiskName],[Section],[Status],[Quote],[Mapfre],[Sancor],[Asepasa],[SeguridadSeguros],[Yacyreta]  FROM [commercial].[Quotation]" SelectCommandType="Text"
                UpdateCommand="UPDATE [commercial].[Quotation]
                               SET [Client] = @Client
                                  ,[RiskName] = @RiskName
                                  ,[Section] = @Section
                                  ,[Status] = @Status
                                  ,[Quote] = @Quote
                                  ,[Mapfre] = @Mapfre
                                  ,[Sancor] = @Sancor
                                  ,[Asepasa] = @Asepasa
                                  ,[SeguridadSeguros] = @SeguridadSeguros
                                  ,[Yacyreta] = @Yacyreta
                             WHERE QuotationID = @QuotationID;"
                UpdateCommandType="Text"
                DeleteCommand="DELETE FROM [commercial].[Quotation] WHERE QuotationID = @QuotationID" DeleteCommandType="Text"
                InsertCommand="INSERT INTO [commercial].[Quotation]
                               ([Client]
                               ,[RiskName]
                               ,[Section]
                               ,[Status]
                               ,[Quote]
                               ,[Mapfre]
                               ,[Sancor]
                               ,[Asepasa]
                               ,[SeguridadSeguros]
                               ,[Yacyreta])
                         VALUES
                               (@Client
                               ,@RiskName
                               ,@Section
                               ,@Status
                               ,@Quote
                               ,@Mapfre
                               ,@Sancor
                               ,@Asepasa
                               ,@SeguridadSeguros
                               ,@Yacyreta)"
                InsertCommandType="Text">
                <DeleteParameters>
                    <asp:Parameter Name="QuotationID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="QuotationID" Type="Int32" />
                    <asp:Parameter Name="Client" Type="String" />
                    <asp:Parameter Name="RiskName" Type="String" />
                    <asp:Parameter Name="Section" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="Quote" Type="Decimal" />
                    <asp:Parameter Name="Mapfre" Type="Boolean" />
                    <asp:Parameter Name="Sancor" Type="Boolean" />
                    <asp:Parameter Name="Asepasa" Type="Boolean" />
                    <asp:Parameter Name="SeguridadSeguros" Type="Boolean" />
                    <asp:Parameter Name="Yacyreta" Type="Boolean" />


                </UpdateParameters>
                <InsertParameters>

                    <asp:Parameter Name="Client" Type="String" />
                    <asp:Parameter Name="RiskName" Type="String" />
                    <asp:Parameter Name="Section" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="Quote" Type="Decimal" />
                    <asp:Parameter Name="Mapfre" Type="Int32" />
                    <asp:Parameter Name="Sancor" Type="Int32" />
                    <asp:Parameter Name="Asepasa" Type="Int32" />
                    <asp:Parameter Name="SeguridadSeguros" Type="Int32" />
                    <asp:Parameter Name="Yacyreta" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
