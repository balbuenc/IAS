<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonUserAssignments.aspx.cs" Inherits="IAS.Admin.PersonUserAssignments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Asignación de responsables de clientes</h2>
    </div>

    <asp:UpdatePanel ID="UsersPersonsUpdatePanel" runat="server">

        <ContentTemplate>

            <div class="form-group">

                <label>Usuario:</label>
                <asp:DropDownList ID="UsersDropDownList" runat="server" SelectMethod="GetUsers"
                    ItemType="IAS.Models.ApplicationUser" DataTextField="FullName" DataValueField="Id" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="UsersDropDownList_SelectedIndexChanged">
                </asp:DropDownList>

            </div>

            <div class="container-fluid">

                <div class="row">

                    <div class="col-sm-6">

                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlPersonType" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Todos" Value="All" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Física" Value="F"></asp:ListItem>
                                <asp:ListItem Text="Jurídica" Value="J"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-search"></span>
                            </span>
                            <asp:TextBox ID="txtUserPersonSearch" runat="server" placeholder="Buscar" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnUserPersonSearch" runat="server" Text="OK" CssClass="btn btn-primary" OnClick="btnUserPersonSearch_Click" />
                            </span>
                        </div>

                        <asp:HiddenField ID="hdnUserPersonSearch" runat="server" />

                        <label>PERSONAS ASIGNADAS</label>
                        <asp:ListView ID="UserPersonsListView" runat="server"
                            ItemType="IAS.Models.Person" DataKeyNames="PersonID"
                            SelectMethod="GetUserPersons"
                            DeleteMethod="DeleteUserAssignment" OnItemCommand="UserPersonsListView_ItemCommand">
                            <LayoutTemplate>

                                <table class="table table-striped">

                                    <thead>
                                        <tr>
                                            <th>Documento</th>
                                            <th>Nombre</th>
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
                                        <asp:Label ID="lblDocumentType" runat="server" Text="<%#Item.DocumentType.Descripcion %>" />
                                        <asp:Label ID="lblDocument" runat="server" Text="<%#Item.DocumentNumber %>" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblName" runat="server" Text="<%#Item.FullName %>" />
                                    </td>
                                    <td class="text-right">
                                        <asp:Button ID="DeleteButton" runat="server" Text="X" CommandName="Remove" CommandArgument="<%# Item.PersonID %>" CssClass="btn btn-sm btn-danger" />
                                    </td>
                                </tr>

                            </ItemTemplate>


                            <EmptyDataTemplate>

                                <div class="msg-box bg-info" style="margin-top: 10px;">No se encontraron asignaciones que cumplan los criterios ingresados</div>

                            </EmptyDataTemplate>

                        </asp:ListView>

                        <asp:DataPager ID="UserPersonsDataPager" runat="server" PagedControlID="UserPersonsListView" PageSize="10">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-default" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-sm btn-default" NumericButtonCssClass="btn btn-sm btn-default" />
                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-default" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>

                    </div>

                    <div class="col-sm-6">

                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlPersonType1" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Todos" Value="All"></asp:ListItem>
                                <asp:ListItem Text="Física" Value="F"></asp:ListItem>
                                <asp:ListItem Text="Jurídica" Value="J"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-search"></span>
                            </span>
                            <asp:TextBox ID="txtPersonSearch" runat="server" placeholder="Buscar" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnPersonSearch" runat="server" Text="OK" CssClass="btn btn-primary" OnClick="btnPersonSearch_Click" />
                            </span>
                        </div>
                        <asp:HiddenField ID="hdnPersonSearch" runat="server" />

                        <label>PERSONAS SIN ASIGNAR</label>
                        <asp:ListView ID="PersonsListView" runat="server"
                            ItemType="IAS.Models.Person" DataKeyNames="PersonID"
                            SelectMethod="GetPersons"
                            OnItemCommand="PersonsListView_ItemCommand">
                            <LayoutTemplate>

                                <table class="table table-striped">

                                    <thead>
                                        <tr>
                                            <th>Documento</th>
                                            <th>Nombre</th>
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
                                        <asp:Label ID="lblDocumentType" runat="server" Text="<%#Item.DocumentType.Descripcion %>" />
                                        <asp:Label ID="lblDocument" runat="server" Text="<%#Item.DocumentNumber %>" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblName" runat="server" Text="<%#Item.FullName %>" />
                                    </td>
                                    <td class="text-right">
                                        <asp:Button ID="AddButton" runat="server" Text="+" CommandName="Assign" CommandArgument="<%#Item.PersonID %>" CssClass="btn btn-sm btn-success" />
                                    </td>
                                </tr>

                            </ItemTemplate>

                            <EmptyDataTemplate>

                                <div class="msg-box bg-info" style="margin-top: 10px;">No hay personas sin asignar</div>

                            </EmptyDataTemplate>

                        </asp:ListView>

                        <asp:DataPager ID="PersonDataPager" runat="server" PagedControlID="PersonsListView" PageSize="10">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-default" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-sm btn-default" NumericButtonCssClass="btn btn-sm btn-default" />
                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-default" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </div>

            </div>

        </ContentTemplate>

    </asp:UpdatePanel>


</asp:Content>
