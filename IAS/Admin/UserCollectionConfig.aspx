<%@ Page Title="Confirguarcion de usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCollectionConfig.aspx.cs" Inherits="IAS.Admin.UserCollectionConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Agentes</h2>
    </div>
    <asp:UpdatePanel ID="upnlUSerSettings" runat="server">

        <ContentTemplate>

            <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />

            <asp:ListView ID="UserSettingListView" runat="server"
                DataKeyNames="UserID"
                DataSourceID="UserSettingDataSource"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <div class="table responsive">
                        <table class="table table-striped">
                            <thead>
                                <th>ID</th>
                                <th>Usuario</th>
                                <th>Dias de Anticipación</th>
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
                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("UserID") %>' /></td>

                        <td>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>' /></td>
                        <td>
                            <asp:Label ID="lblCollectionAnticipateDays" runat="server" Text='<%# Eval("CollectionAnticipateDays") %>' /></td>


                        <td class="text-right">
                            <asp:Button ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                          
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="txtUserID" runat="server" Text='<%# Bind("UserID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:Label ID="txtUserName" runat="server" Text='<%# Bind("UserID") %>' CssClass="form-control" Font-Size="X-Small" /></td>
                        <td>
                            <asp:TextBox ID="txtCollectionAnticipateDays" runat="server" Text='<%# Bind("CollectionAnticipateDays") %>' CssClass="form-control" Font-Size="X-Small" /></td>

                        <td class="text-right">
                            <asp:Button ID="UpdateButton" runat="server" Text="Guardar" CommandName="Update" CssClass="btn btn-info" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    </tr>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:DataPager ID="UserSettingsDataPager" runat="server" PagedControlID="UserSettingListView" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-sm" NextPreviousButtonCssClass="btn btn-default btn-sm" NumericButtonCssClass="btn btn-default btn-sm" />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

        </ContentTemplate>

    </asp:UpdatePanel>

    <asp:SqlDataSource ID="UserSettingDataSource" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" runat="server"
        SelectCommand="SELECT s.UserID , u.UserName , s.CollectionAnticipateDays   FROM [dbo].[UserSetting] s  inner join dbo.AspNetUsers u on s.UserID = u.id" SelectCommandType="Text"
        UpdateCommand="update UserSetting set CollectionAnticipateDays = @CollectionAnticipateDays where UserID = @UserID" UpdateCommandType="Text">

        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="String" />
            <asp:Parameter Name="CollectionAnticipateDays" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
