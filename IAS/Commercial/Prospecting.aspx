<%@ Page Title="Prospectos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prospecting.aspx.cs" Inherits="IAS.Commercial.Prospecting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Prospectos</h2>
    </div>

    <asp:UpdatePanel ID="upnlShipping" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <div class="container-fluid">
                <div class="row">
                    <asp:ListView ID="ProspectingListView" runat="server"
                        DataKeyNames="ProspectingID"
                        DataSourceID="ProspectingDataSource"
                        InsertItemPosition="FirstItem"
                        OnItemUpdating="ProspectingListView_ItemUpdating"
                        OnItemCommand="ProspectingListView_ItemCommand">
                        <LayoutTemplate>
                            <div class="table responsive">
                                <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                                    <thead>
                                        <th>#</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Tipo Doc.</th>
                                        <th>Nro. Doc.</th>
                                        <th>Fecha</th>
                                        <th>Riesgo</th>
                                        <th>Nro. tel.</th>
                                        <th>Tipo Propuesta</th>
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
                                    <asp:Label ID="lblProspectingID" runat="server" Text='<%# Eval("ProspectingID") %>' /></td>
                                <td>
                                    <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblClientLastName" runat="server" Text='<%# Eval("ClientLastName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblDocumentTypeID" runat="server" Text='<%# Eval("DocumentType") %>' /></td>
                                <td>
                                    <asp:Label ID="lblDocumentNumber" runat="server" Text='<%# Eval("DocumentNumber") %>' /></td>
                                <td>
                                    <asp:Label ID="lblProspectingDate" runat="server" Text='<%#  DateTime.Parse( Eval("ProspectingDate").ToString()).ToShortDateString() %>' /></td>
                                <td>
                                    <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>' /></td>
                                <td>
                                    <asp:Label ID="lblProposalTypeID" runat="server" Text='<%# Eval("ProposalType") %>' /></td>


                                <td class="text-right">
                                    <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                                    <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="txtProspectingID" runat="server" Text='<%# Bind("ProspectingID") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtClientName" runat="server" Text='<%# Bind("ClientName") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtClientLastName" runat="server" Text='<%# Bind("ClientLastName") %>' CssClass="form-control" /></td>
                                <td>

                                    <asp:DropDownList ID="DocumentTypeDDL" runat="server" DataSourceID="DocumentTypeDataSource" CssClass="form-control"
                                        SelectedValue='<%# Eval("DocumentTypeID") %>'
                                        DataValueField="DocumentTypeID" DataTextField="DocumentType" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDocumentNumber" runat="server" Text='<%# Bind("DocumentNumber") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtProspectingDate" runat="server" Text='<%# Bind("ProspectingDate") %>' type="date" CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="form-control" /></td>
                                <td>

                                    <asp:DropDownList ID="ProposalTypeDDL" runat="server" DataSourceID="ProposalTypeDataSource" CssClass="form-control"
                                        SelectedValue='<%# Eval("ProposalTypeID") %>'
                                        DataValueField="ProposalTypeID" DataTextField="ProposalType" AppendDataBoundItems="true">
                                    </asp:DropDownList>
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
                                    <asp:Label ID="txtProspectingID" runat="server" Text='<%# Bind("ProspectingID") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtClientName" runat="server" Text='<%# Bind("ClientName") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtClientLastName" runat="server" Text='<%# Bind("ClientLastName") %>' CssClass="form-control" /></td>
                                <td>

                                    <asp:DropDownList ID="DocumentTypeDDL" runat="server" DataSourceID="DocumentTypeDataSource" CssClass="form-control"
                                        DataValueField="DocumentTypeID" DataTextField="DocumentType" AppendDataBoundItems="true">
                                    </asp:DropDownList>

                                </td>
                                <td>
                                    <asp:TextBox ID="txtDocumentNumber" runat="server" Text='<%# Bind("DocumentNumber") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtProspectingDate" runat="server" Text='<%# Bind("ProspectingDate") %>' CssClass="form-control" type="date" /></td>
                                <td>
                                    <asp:TextBox ID="txtRiskName" runat="server" Text='<%# Bind("RiskName") %>' CssClass="form-control" /></td>
                                <td>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="form-control" /></td>
                                <td>

                                    <asp:DropDownList ID="ProposalTypeDDL" runat="server" DataSourceID="ProposalTypeDataSource" CssClass="form-control"
                                        DataValueField="ProposalTypeID" DataTextField="ProposalType" AppendDataBoundItems="true">
                                    </asp:DropDownList>

                                </td>


                                <td>
                                    <asp:Button ID="InsertButton" runat="server" Text="Agregar" CommandName="Insert" CssClass="btn btn-success" />
                                </td>

                            </tr>

                        </InsertItemTemplate>

                    </asp:ListView>

                    <asp:DataPager ID="ProspectingDataPager" runat="server" PagedControlID="ProspectingListView" PageSize="20">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>

                </div>
            </div>

            <asp:SqlDataSource ID="DocumentTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                SelectCommand="select id_tipo_documento DocumentTypeID, descripcion DocumentType from exchange.Tipos_documentos order by 2 asc"
                SelectCommandType="Text"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ProposalTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
                SelectCommand="SELECT [ProposalTypeID]
                                    ,[ProposalType]
                              FROM [commercial].[ProposalType]"
                SelectCommandType="Text"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ProspectingDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="SELECT [ProspectingID]
                                    ,p.[ClientName]
                                    ,p.[ClientLastName]
                                    ,p.[DocumentTypeID]
                                    ,p.[DocumentNumber]
                                    ,p.[ProspectingDate]
                                    ,p.[RiskName]
                                    ,p.[PhoneNumber]
                                    ,p.[ProposalTypeID]
		                            ,pt.ProposalType
		                            ,d.descripcion as DocumentType
                                FROM [commercial].[Prospecting] p
	                            inner join commercial.ProposalType pt on pt.ProposalTypeID = p.ProposalTypeID
	                            inner join exchange.Tipos_documentos d on p.DocumentTypeID = d.id_tipo_documento"
                SelectCommandType="Text"
                UpdateCommand="UPDATE [commercial].[Prospecting]
                               SET [ClientName] = @ClientName
                                  ,[ClientLastName] = @ClientLastName
                                  ,[DocumentTypeID] = @DocumentTypeID
                                  ,[DocumentNumber] = @DocumentNumber
                                  ,[ProspectingDate] = @ProspectingDate
                                  ,[RiskName] = @RiskName
                                  ,[PhoneNumber] = @PhoneNumber
                                  ,[ProposalTypeID] = @ProposalTypeID
                                WHERE ProspectingID = @ProspectingID;"
                UpdateCommandType="Text"
                DeleteCommand="DELETE FROM [commercial].[Prospecting] WHERE ProspectingID = @ProspectingID" DeleteCommandType="Text"
                InsertCommand="INSERT INTO [commercial].[Prospecting]
                                       ([ClientName]
                                       ,[ClientLastName]
                                       ,[DocumentTypeID]
                                       ,[DocumentNumber]
                                       ,[ProspectingDate]
                                       ,[RiskName]
                                       ,[PhoneNumber]
                                       ,[ProposalTypeID])
                                 VALUES
                                       (@ClientName
                                       ,@ClientLastName
                                       ,@DocumentTypeID
                                       ,@DocumentNumber
                                       ,@ProspectingDate
                                       ,@RiskName
                                       ,@PhoneNumber
                                        ,@ProposalTypeID)"
                InsertCommandType="Text">
                <DeleteParameters>
                    <asp:Parameter Name="ProspectingID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProspectingID" Type="Int32" />
                    <asp:Parameter Name="ClientName" Type="String" />
                    <asp:Parameter Name="ClientLastName" Type="String" />
                    <asp:Parameter Name="DocumentTypeID" Type="Int32" />
                    <asp:Parameter Name="DocumentNumber" Type="String" />
                    <asp:Parameter Name="ProspectingDate" Type="DateTime" />
                    <asp:Parameter Name="RiskName" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="ProposalTypeID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ClientName" Type="String" />
                    <asp:Parameter Name="ClientLastName" Type="String" />
                    <asp:ControlParameter Name="DocumentTypeID" ControlID="ctl00$MainContent$ProspectingListView$ctrl0$DocumentTypeDDL" PropertyName="SelectedValue" />

                    <asp:Parameter Name="DocumentNumber" Type="String" />
                    <asp:Parameter Name="ProspectingDate" Type="DateTime" />
                    <asp:Parameter Name="RiskName" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />

                    <asp:ControlParameter Name="ProposalTypeID" ControlID="ctl00$MainContent$ProspectingListView$ctrl0$ProposalTypeDDL" PropertyName="SelectedValue" />

                </InsertParameters>
            </asp:SqlDataSource>

        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
