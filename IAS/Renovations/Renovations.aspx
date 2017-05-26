<%@ Page Title="" Language="C#" MasterPageFile="~/Task.Master" AutoEventWireup="true" CodeBehind="Renovations.aspx.cs" Inherits="IAS.Renovations.Renovations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript">

        $(function () {
            $("[id$=txtSearchPolicy]").autocomplete(
                {
                    source: "SearchPolicy.ashx",
                    response: function (event, ui) {
                    },
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function (event, ui) {
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearchPolicy]").val(ui.item.Client);
                            $("[id$=btnSearchPolicy]").click();
                            return false;
                        }
                    }
                })
                .autocomplete("instance")._renderItem = function (ul, item) {

                    return $("<li>")
                        .append("<div>" + item.Client + "</div>")
                        .appendTo(ul);
                };
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Búsqueda</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtSearchPolicy" runat="server" CssClass="form-control" placeholder="Cliente, Póliza, Documento"></asp:TextBox>
                    </div>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" DataValueField="PolicyRenovationStatusID" DataTextField="Status" DataSourceID="RenovationStatusSqldataSource">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-2">
                        <button id="btnSearchPolicy" runat="server" class="btn btn-default" style="display: none;" onserverclick="btnSearchPolicy_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                        <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                        &nbsp;
                        <a href="NewRenovation.aspx" class="btn btn-default">
                            <span class="glyphicon glyphicon-plus"></span>
                        </a>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <asp:ListView ID="RenovationsListView"
                            runat="server"
                            DataKeyNames="RenovationID"
                            OnItemDataBound="RenovationsListView_ItemDataBound"
                            OnItemCommand="RenovationsListView_ItemCommand">
                            <LayoutTemplate>
                                <div class="table table-responsive">
                                    <table class="table table-hover  table-condensed ">
                                        <thead>
                                            <tr runat="server" style="padding-top: 5px; padding-bottom: 5px; height: 40px">
                                                <th class="visible-lg">FECHA RENOVACION</th>
                                                <th>NUMERO POLIZA</th>
                                                <th class="visible-lg">NRO DOCUMENTO</th>
                                                <th class="visible-lg">NOMBRE</th>
                                                <th class="visible-lg">ESTADO</th>
                                                <th class="visible-lg">ACCIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr runat="server" id="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr style="height: 33px">
                                    <td>
                                        <asp:Label ID="lblRenovationID" runat="server" Text='<%# Eval("RenovationID").ToString() %>' Visible="false" />
                                        <asp:Label ID="lblPersonaID" runat="server" Text='<%# Eval("id_persona").ToString() %>' Visible="false" />
                                        <asp:Label ID="lblFechaRenovacion" runat="server" Text='<%# Eval("RenovationDate") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroPoliza" runat="server" Text='<%# Eval("PolicyNumber") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroDocumento" runat="server" Text='<%# Eval("numero_documento") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="AvanzarButton" runat="server" Text="Avanzar renovación" CommandName="Avanzar" CommandArgument='<%# Eval("RenovationID").ToString() + ";"+  Eval("PolicyRenovationStatusID").ToString() %>' ToolTip="Avanzar renovación" CssClass="btn btn-link" Style="padding-left: 0px; padding-right: 0px;">
                                                <small><span class="glyphicon glyphicon-chevron-right"></span></small>
                                        </asp:LinkButton>
                                        &nbsp;
                                         <asp:LinkButton ID="RechazarButton" runat="server" Text="Rechazar renovación" CommandName="Rechazar" CommandArgument='<%# Eval("RenovationID").ToString() %>' ToolTip="Rechazar renovación" CssClass="btn btn-link" Style="padding-left: 0px; padding-right: 0px;">
                                                <small><span class="glyphicon glyphicon-remove"></span></small>
                                         </asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="CommentButton" runat="server" Text="Comentarios" CommandName="Comentarios" CommandArgument='<%# Eval("TaskID").ToString() %>' ToolTip="Comentarios" CssClass="btn btn-link" Style="padding-left: 0px; padding-right: 0px;">
                                                <small><span class="glyphicon glyphicon-comment"></span></small>
                                        </asp:LinkButton>
                                    </td>

                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <div class="msg-box bg-warning alert-danger">No se encontraron renovaciones.</div>
                                    </div>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <%-- Modal Task Comments --%>
    <div class="modal fade modal-wide" id="myModalTaskComment" tabindex="-1" role="dialog" aria-labelledby="myModalTaskCommentLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%">
            <div class="modal-content">
                <div class="container-fluid">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                        <h4 class="modal-title" id="myModalTaskCommentLabel">
                            <asp:Label ID="lblComentarioTitle" runat="server" Text="Comentarios"></asp:Label>
                        </h4>
                    </div>
                    <br />
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-9">
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
                                    HeaderStyle-Font-Size="Small"
                                    OnRowCommand="grdTaskComments_RowCommand">
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

                    <div class="modal-footer">
                        <asp:Button ID="TaskCommentsAcceptBtn" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="TaskCommentsAcceptBtn_Click"></asp:Button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-wide" id="myModalStatus" tabindex="-1" role="dialog" aria-labelledby="myModalStatusLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="container-fluid">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                        <h4 class="modal-title" id="myModalStatusLabel">
                            <asp:Label ID="Label1" runat="server" Text="Avanzar estado"></asp:Label>
                        </h4>
                    </div>
                    <br />
                    <div class="modal-body">
                        <asp:HiddenField ID="hf_RenovationID" runat="server" />
                        <asp:HiddenField ID="hf_RenovationStatusID" runat="server" />
                        Desea avanzar al siguiente estado?
                        <asp:Label ID="lblSiguienteEstado" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="SiguienteEstadoButton" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="SiguienteEstadoButton_Click"></asp:Button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="RenovationsSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="commercial.sp_get_policy_renovation" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="RenovationStatusSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="commercial.sp_get_renovations_status_ddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="TaskCommentsDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_TaskComments]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="TaskID" ControlID="hf_TaskID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">

        function openModalTaskComments() {
            $('#myModalTaskComment').modal('show');
        }
        function openModalNextStatus() {
            $('#myModalStatus').modal('show');
        }

    </script>
</asp:Content>
