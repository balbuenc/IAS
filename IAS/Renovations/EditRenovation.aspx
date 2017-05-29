<%@ Page Title="" Language="C#" MasterPageFile="~/Task.Master" AutoEventWireup="true" CodeBehind="EditRenovation.aspx.cs" Inherits="IAS.Renovations.EditRenovation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid"  style="padding-left: 5px; padding-right: 5px; padding-right: 10px; font-family: 'Segoe UI'; font-size: smaller">
        
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>

        <div class="page-header">
            <h4>Renovaciones</h4>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" />
            </div>
            <div class="col-lg-1">
                <asp:Button ID="btnCommentAdd" runat="server" Text="Comentar" CssClass="btn btn-default" OnClick="btnCommentAdd_Click" />
            </div>
            <asp:HiddenField ID="hf_TaskID" runat="server" />
        </div>

        <div class="row">
            <br />
            <div class="col-lg-12">
                <asp:GridView ID="grdTaskComments" runat="server" CssClass="table table-hover table-bordered"
                    AutoGenerateColumns="false"
                    DataKeyNames="TaskCommentID"
                    DataSourceID="TaskCommentsDataSource"
                    RowStyle-Font-Size="Small"
                    HeaderStyle-Font-Size="Small">
                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#ffffcc" />
                    <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered" />
                    <EmptyDataTemplate>
                        <b>No hay comentarios para la Tarea.</b>
                    </EmptyDataTemplate>
                    <RowStyle Height="20px" />
                    <AlternatingRowStyle Height="20px" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbltaskCommentID" runat="server" Text='<%# Eval("TaskCommentID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbltaskCommentID" runat="server" Text='<%# Eval("TaskCommentID") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comentario">
                            <ItemTemplate>
                                <asp:Label ID="lblComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtComment" CssClass="form-control" runat="server" Text='<%# Eval("Comment") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" ReadOnly="true" Text='<%# Eval("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="lblCommentDate" runat="server" Text='<%# DateTime.Parse( Eval("CommentDate").ToString()).ToShortDateString() %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="txtCommentDate" CssClass="form-control" runat="server" ReadOnly="False" Text='<%# DateTime.Parse( Eval("CommentDate").ToString()).ToShortDateString() %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="...">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Eliminar" CommandArgument='<%# Eval("TaskCommentID").ToString() %>' CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar el Comentario.?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="TasksSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="commercial.sp_get_policy_renovation_by_renovation_id" SelectCommandType="StoredProcedure"
        DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="PolicyRenovationID" QueryStringField="RenovationId" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="TaskCommentsDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_TaskComments]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="TaskID" ControlID="hf_TaskID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
