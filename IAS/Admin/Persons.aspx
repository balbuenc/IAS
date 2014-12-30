<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Persons.aspx.cs" Inherits="IAS.Admin.Persons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h1>Personas</h1>
    </div>

    <asp:UpdatePanel ID="PersonUPanel" runat="server">

        <ContentTemplate>

            <div class="navbar-form navbar-left" role="search">
                
                <div class="navbar-header">
                    <span class="navbar-brand">Buscar</span>
                </div>
                
                <div class="form-group">    
                    <asp:TextBox ID="docNumberSearchTextBox" CssClass="form-control" runat="server" placeholder="Número de documento"></asp:TextBox>
                </div>
                <div class="form-group">    
                    <asp:TextBox ID="fullNameSearchTextBox" CssClass="form-control" runat="server" placeholder="Nombre / Apellido"></asp:TextBox>
                </div>
                <asp:Button ID="SearchButton" CssClass="btn btn-default navbar-btn" runat="server" Text="Aceptar" OnClick="SearchButton_Click" />
                <asp:HiddenField ID="docNumberSearchHidden" runat="server" />
                <asp:HiddenField ID="fullNameSearchHidden" runat="server" />
            </div>

            <asp:Label ID="ErrorLabel" Visible="False" CssClass="msg-box bg-danger" runat="server" />

            <asp:ListView ID="PersonsListView" runat="server"
                ItemType="IAS.Models.Person" DataKeyNames="PersonID"
                SelectMethod="GetData"
                UpdateMethod="UpdateAssignment"
                OnItemCanceling="PersonsListView_ItemCanceling"
                OnItemEditing="PersonsListView_ItemEditing">
                <LayoutTemplate>

                    <table class="table table-striped">

                        <thead>
                            <tr>
                                <th>Documento</th>
                                <th>Nombre</th>
                                <th>Responsable</th>
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
                        <td>
                            <asp:Label ID="lblResponsable" runat="server" Text="<%#Item.UserAssigment %>" />
                        </td>

                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-danger" Visible="false" />
                        </td>

                    </tr>

                </ItemTemplate>

                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblDocumentType" runat="server" Text="<%#Item.DocumentType.Descripcion %>" />
                            <asp:Label ID="lblDocument" runat="server" Text="<%#Item.DocumentNumber %>" />
                        </td>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text="<%#Item.FullName%>" />
                        </td>

                        <td>
                            <asp:DropDownList ID="ddlUsers" runat="server" SelectMethod="GetUsers"
                                ItemType="IAS.Models.ApplicationUser" DataTextField="FullName" DataValueField="Id" CssClass="form-control"
                                SelectedValue="<%# GetPersonID(Item) %>" />
                        </td>
                        <td class="text-right">
                            <asp:Button ID="Button1" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="Button2" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>

                </EditItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="PersonsDataPager" runat="server" PagedControlID="PersonsListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn" NextPreviousButtonCssClass="btn btn-default" NumericButtonCssClass="btn btn-default" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
