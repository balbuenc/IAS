<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forms.aspx.cs" Inherits="IAS.Admin.Forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Formularios:</h2>

    <asp:UpdatePanel ID="FormsUPanel" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" Visible="false" CssClass="msg-box bg-danger" runat="server" />

            <asp:ListView ID="FormsListView" runat="server"
                ItemType="IAS.Models.Form" DataKeyNames="FormID"
                SelectMethod="GetData"
                UpdateMethod="Update"
                InsertMethod="Insert"
                DeleteMethod="Delete"
                InsertItemPosition="LastItem"
                OnItemCanceling="FormsListView_ItemCanceling"
                OnItemEditing="FormsListView_ItemEditing">
                <LayoutTemplate>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Url</th>
                                <td>&nbsp;</td>
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
                            <asp:Label ID="lblFormName" runat="server" Text='<%# Item.FormName%>' />
                        </td>

                        <td>
                            <asp:Label ID="lblUrl" runat="server" Text='<%# Item.Url%>' />
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
                            <asp:TextBox ID="txtName" runat="server" Text='<%# BindItem.FormName%>' CssClass="form-control" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtUrl" runat="server" Text='<%# BindItem.Url%>' CssClass="form-control" />
                        </td>

                        <td class="text-right">

                            <asp:Button ID="UpdateButton" runat="server" Text="Actualizar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />

                        </td>
                    </tr>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <tr>

                        <td>
                            <asp:TextBox ID="txtFormName" runat="server" Text='<%#: BindItem.FormName%>' placeholder="Nuevo formulario" CssClass="form-control" />
                        </td>

                        <td>
                            <asp:TextBox ID="txtUrl" runat="server" Text='<%#: BindItem.Url%>' placeholder="URL del nuevo formulario" CssClass="form-control" />
                        </td>

                        <td class="text-right">
                            <asp:Button ID="InsertButton" runat="server" Text="Adicionar" CommandName="Insert" CssClass="btn btn-success" />
                        </td>

                    </tr>

                </InsertItemTemplate>

            </asp:ListView>

        </ContentTemplate>

    </asp:UpdatePanel>


</asp:Content>
