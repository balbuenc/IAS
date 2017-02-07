<%@ Page Title="IAS | Buscar casos" Language="C#" MasterPageFile="~/CaseManagement.Master" AutoEventWireup="true" CodeBehind="SearchCase.aspx.cs" Inherits="IAS.CaseManagment.SearchCase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.12.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <h2>BUSQUEDA DE CASOS</h2>
        </div>
        <div class="row">
            <div class="container-fluid" style="padding-left: 3px; padding-right: 3px;">

                <div class="row">
                    <div class="col-lg-6">
                        <asp:TextBox ID="txtSearchCase" runat="server" CssClass="form-control" placeholder="DATOS DEL CLIENTE"></asp:TextBox>
                    </div>

                    <div class="col-lg-2 pull-right">
                        <button id="btnSearch" runat="server" class="btn btn-default">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>

                    </div>
                </div>

            </div>
            <hr />
            <div class="container-fluid" style="font-family: 'Century Gothic', CenturyGothic, AppleGothic, sans-serif; padding-left: 15px; padding-right: 15px">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

                <asp:ListView ID="CaseListView" runat="server"
                    DataKeyNames="CaseID"
                    DataSourceID="CaseDataSource" OnItemCommand="CaseListView_ItemCommand" OnItemUpdating="CaseListView_ItemUpdating">

                    <LayoutTemplate>
                        <div class="table responsive">
                            <table class="table table-striped" style="font-size: x-small">
                                <thead>
                                    <th class="visible-lg">ID. CASO</th>
                                    <th>NOMBRES</th>
                                    <th>PRIMER APELLIDO</th>
                                    <th class="visible-lg">SEGUNDO AEPLLIDO</th>
                                    <th class="visible-lg">RAZON SOCIAL</th>
                                    <th class="visible-lg">NRO. DOC.</th>
                                    <th class="visible-lg">TIPO DOC.</th>
                                    <th>CASO</th>
                                    <th>ESTADO</th>
                                    <th>USUARIO</th>
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
                                <asp:Label ID="lblcaseID" runat="server" Text='<%# Eval("caseID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblNombres" runat="server" Text='<%# Eval("nombres") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblPrimerApellido" runat="server" Text='<%# Eval("primer_apellido") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblSegundoApellido" runat="server" Text='<%# Eval("segundo_apellido") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblRazonSocial" runat="server" Text='<%# Eval("razon_social") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblNumeroDocumento" runat="server" Text='<%# Eval("numero_documento") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblTipoDocumento" runat="server" Text='<%# Eval("tipo_documento") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblCaso" runat="server" Text='<%# Eval("caso") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblStateName" runat="server" Text='<%# Eval("StateName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <div class="row">
                                    <asp:LinkButton ID="EditButton" runat="server" Text="Editar" ToolTip="Editar" CommandName="Edit" CommandArgument='<%# Eval("CaseID") %>' CssClass="btn btn-link">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="ManageCaseButton" runat="server" Text="Gestionar" ToolTip="Gestionar Caso" CommandName="Manage" CommandArgument='<%# Eval("CaseID") %>' CssClass="btn btn-link">
                                        <span class="glyphicon glyphicon-cog"></span>
                                    </asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblcaseID" runat="server" Text='<%# Eval("caseID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblNombres" runat="server" Text='<%# Eval("nombres") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblPrimerApellido" runat="server" Text='<%# Eval("primer_apellido") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblSegundoApellido" runat="server" Text='<%# Eval("segundo_apellido") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblRazonSocial" runat="server" Text='<%# Eval("razon_social") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblNumeroDocumento" runat="server" Text='<%# Eval("numero_documento") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblTipoDocumento" runat="server" Text='<%# Eval("tipo_documento") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblCaso" runat="server" Text='<%# Eval("caso") %>' />
                            </td>
                            <td>
                                <%--<asp:TextBox ID="txtUserName" runat="server" Text='<%# Eval("UserName") %>' />--%>
                                <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control" SelectedValue='<%# Eval("UserID") %>' DataTextField="UserName" DataValueField="Id" DataSourceID="UserDataSource"></asp:DropDownList>
                            </td>
                            <td>
                                <div class="row">
                                    <asp:LinkButton ID="UpdateButton" runat="server" Text="Actualizar" ToolTip="Asignar Usuario" CommandName="Update" CommandArgument='<%# Eval("CaseID") %>' CssClass="btn btn-link">
                                        <span class="glyphicon glyphicon-ok"></span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" runat="server" Text="Cancelar" ToolTip="Cancelar" CommandName="Cancel" CommandArgument='<%# Eval("CaseID") %>' CssClass="btn btn-link">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <EmptyDataTemplate>
                        <h4 style="color: lightgray; text-align: center"><span class="glyphicon glyphicon-comment"></span>NO SE ENCONTRARON CASOS.</h4>
                    </EmptyDataTemplate>

                </asp:ListView>

                <asp:DataPager ID="CaseDataPager" runat="server" PagedControlID="CaseListView" PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>


            </div>
            <asp:SqlDataSource ID="CaseDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="[collection].[sp_search_cases]" SelectCommandType="StoredProcedure"
                UpdateCommand="update [dbo].[case] set UserID = @UserID where CaseID = @CaseID" UpdateCommandType="Text">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchCase" Name="find" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserID" Type="String" />
                    <asp:Parameter Name="CaseID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="UserDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
                SelectCommand="select u.id , UPPER(u.UserName) as UserName from dbo.AspNetUsers u inner join [dbo].[CollectionUser] cu on u.ID = cu.UserID" SelectCommandType="Text"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
