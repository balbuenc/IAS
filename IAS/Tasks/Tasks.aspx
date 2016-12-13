<%@ Page Title="Tareas" Language="C#" MasterPageFile="~/Task.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="IAS.Tasks.Tasks" %>

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
            $("[id$=txtSearchTask]").autocomplete(
                {
                    source: "search.ashx",
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function (event, ui) {
                        $("[id$=txtSearchTask]").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearchTask]").val(ui.item.Task);
                            $("[id$=btnSearch]").click();
                            return false;
                        }

                    }
                })
                .autocomplete("instance")._renderItem = function (ul, item) {
                    console.log(item.Task);
                    return $("<li>")
                      .append("<div>" + item.Task + "</div>")
                      .appendTo(ul);
                };
        });


    </script>

    <style type="text/css">
        /************************************************************************/
        /* PSEUDO-TOGGLE BUTTON MADE OF ASP.NET CHECKBOX AND CSS3*/
        div.divToggleButton input[type=checkbox] {
            display: none;
            white-space: nowrap;
        }

        div.divToggleButton label {
            display: block;
            float: left;
            cursor: pointer;
        }

        /* set the size of the pseudo-toggle button control */
        div.divToggleButton input[type=checkbox]:checked + label::before,
        div.divToggleButton input[type=checkbox]:not(:checked) + label::before,
        div.divToggleButton input[type=checkbox] + label {
            width: 70px;
            height: 34px;
            line-height: 33px;
        }

        /* additional styling: rounded border, gradient */
        div.divToggleButton input[type=checkbox] + label {
            vertical-align: middle;
            text-align: center;
            font-size: 8pt;
            font-family: Arial, Calibri;
            border: 1px solid #bdbdbd;
            border-radius: 5px;
            background: #f0f0f0;
            /* gradient style (optional)*/
            background-image: -moz-linear-gradient(top, #fdfdfd, #f9f9f9 50%, #e5e5e5 50%, #fdfdfd);
            background-image: -webkit-gradient(linear, center top, center bottom, from(#fdfdfd), color-stop(0.5, #f9f9f9), color-stop(0.5, #e5e5e5 ), to(#fdfdfd));
            background-image: linear-gradient(to bottom, #fdfdfd, #f9f9f9 50%, #e5e5e5 50%, #fdfdfd);
        }

        /* content to display and style pertinent to unchecked state*/
        div.divToggleButton input[type=checkbox]:not(:checked) + label::before {
            content: "Todas";
            color: #303030;
            opacity: 0.6;
        }

        /* content to display and style pertinent to checked state*/
        div.divToggleButton input[type=checkbox]:checked + label::before {
            content: "Mis Tareas";
            color: #000090;
            font-weight: bold;
        }
        /************************************************************************/
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px; padding-right: 10px; font-family: 'Segoe UI'; font-size: smaller">
        <div class="row">
            <div class="col-lg-3" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:TextBox ID="txtSearchTask" runat="server" CssClass="form-control" placeholder="Tarea"></asp:TextBox>
            </div>
            <div class="col-lg-1" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlTaskPriority" runat="server" CssClass="form-control" DataValueField="TaskPriorityID" DataTextField="TaskPriority" DataSourceID="PrioritySqldataSource" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1" Text="Todas las prioridades" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <asp:DropDownList ID="ddlTaskState" runat="server" CssClass="form-control" DataValueField="TaskStateID" DataTextField="TaskState" DataSourceID="StatusSqldataSource" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1" Text="Todos los estados" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <div class='input-group date' id='datetimepicker1'>
                    <input id="dpStart" placeholder="Fecha desde" class="form-control" runat="server" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
            <div class="col-lg-2" style="padding-top: 5px; padding-bottom: 5px;">
                <div class='input-group date' id='datetimepicker2'>
                    <input id="dpEnd" placeholder="Fecha hasta" class="form-control" runat="server" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
            <div class="col-lg-2" style="padding-top: 5px;  display: -webkit-box">
                <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>

                <button id="btnNewTask" runat="server" class="btn btn-default" onserverclick="btnNewTask_ServerClick">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </button>

                <div class="divToggleButton" style="padding-left: 6px;">
                    <asp:CheckBox ID="chkToggleButton" runat="server"
                        AutoPostBack="false" Checked="true" />
                    <asp:Label ID="lblToggleButton"
                        AssociatedControlID="chkToggleButton" runat="server"
                        ToolTip="Mis Tareas" />
                </div>

            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>
        <hr style="margin-top: 7px; margin-bottom: 5px; border-color: #3d4247; border-width: 2px" />
        <div class="row">
            <div class="col-lg-12">
                <asp:ListView ID="TasksListView"
                    runat="server"
                    DataKeyNames="TaskID"
                    OnItemCommand="TasksListView_ItemCommand">
                    <LayoutTemplate>
                        <div class="table table-responsive">
                            <table class="table table-hover  table-condensed ">
                                <thead>
                                    <tr runat="server" style="padding-top: 5px; padding-bottom: 5px; height: 40px">
                                        <th>TAREA</th>
                                        <th class="visible-lg">DESCRIPCIÓN</th>
                                        <th class="visible-lg">TIPO</th>
                                        <th class="visible-lg">INICIO</th>
                                        <th>VENCIMIENTO</th>
                                        <th class="visible-lg">PRIORIDAD</th>
                                        <th>ESTADO</th>
                                        <th>ASIGNADO A</th>
                                        <th class="visible-lg">CREADO POR</th>
                                        <th class="visible-lg">%</th>

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
                                <asp:Label ID="lblTaskID" runat="server" Text='<%# Eval("TaskID").ToString() %>' Visible="false" />
                                <asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskName") %>' Font-Italic="true" Font-Size="Medium" />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblTaskDescription" runat="server" Text='<%# Eval("TaskDescription") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblTaskType" runat="server" Text='<%# Eval("TaskType") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblStartDate" runat="server" Text='<%# DateTime.Parse( Eval("StartDate").ToString()).ToShortDateString() %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblDueDate" runat="server" Text='<%# DateTime.Parse( Eval("DueDate").ToString()).ToShortDateString() %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblTaskPriority" runat="server" Text='<%# Eval("TaskPriority") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblTaskState" runat="server" Text='<%# Eval("TaskState") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Eval("CreatedBy") %>' />
                            </td>
                            <td class="visible-lg">
                                <asp:Label ID="lblPercentComplete" runat="server" Text='<%# Eval("PercentComplete" ) + " %" %>' />
                            </td>
                        </tr>
                        <tr style="height: 33px">
                            <td colspan="10" style="text-align: left; border-color: transparent; padding: 0px">

                                <asp:LinkButton ID="EditButton" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("TaskID").ToString() %>' ToolTip="Editar" CssClass="btn btn-link">
                                                <small><span class="glyphicon glyphicon-edit"></span></small>
                                </asp:LinkButton>

                                <label id="lblTaskCommentsCount" style="font-weight: normal"><%# Eval("TaskCommentsCount").ToString() %> </label>
                                <asp:LinkButton ID="CommentButton" runat="server" Text="Comentarios" CommandName="Comentarios" CommandArgument='<%# Eval("TaskID").ToString() %>' ToolTip="Comentarios" CssClass="btn btn-link" Style="padding-left: 0px; padding-right: 0px;">
                                                <small><span class="glyphicon glyphicon-comment"></span></small>
                                </asp:LinkButton>

                                <asp:LinkButton ID="CloseButton" runat="server" Text="Cerrar" CommandName="Cerrar" CommandArgument='<%# Eval("TaskID").ToString() %>' ToolTip="Cerrar Tarea"  CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Cerrar la Tarea.?');">
                                                <small><span class="glyphicon glyphicon-off"></span></small>
                                </asp:LinkButton>

                                <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Eliminar" CommandArgument='<%# Eval("TaskID").ToString() %>' ToolTip="Eliminar"  CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar la Tarea.?');">
                                                <small><span class="glyphicon glyphicon-trash"></span></small>
                                </asp:LinkButton>

                                <div class="label  label-success" style="padding: 5px">
                                    <asp:Label ID="lblLastTaskComment" runat="server" Text='<%# Eval("LastTaskComment" )  %>' />
                                </div>
                            </td>
                        </tr>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="msg-box bg-warning alert-danger">No se encontraron tareas.</div>
                            </div>
                        </div>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <%-- Modal Task Edit --%>
    <div class="modal fade modal-wide" id="myModalTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%">
            <div class="modal-content" style="padding-left: 5px; padding-right: 5px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                    <h4 class="modal-title" id="myModalLabel">
                        <asp:Label ID="lblTitulo" runat="server" Text=""></asp:Label>
                    </h4>
                </div>
                <br />
                <div class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Tarea: </label>
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtTarea" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Descripción: </label>
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" Style="height: 100px;" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Tipo de tarea: </label>
                        <div class="col-lg-6">
                            <asp:DropDownList ID="ddlTipoTarea" runat="server" CssClass="form-control" DataValueField="TaskTypeID" DataTextField="TaskType" DataSourceID="TypeSqldataSource" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Asignar a: </label>
                        <div class="col-lg-6">
                            <asp:DropDownList ID="ddlUsuario" runat="server" CssClass="form-control" DataValueField="UserID" DataTextField="UserName" DataSourceID="UserSqldataSource" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Fecha Inicio: </label>
                        <div class="col-lg-6">
                            <div class='input-group date' id='datetimepicker3'>
                                <input id="txtFechaInicio" placeholder="Fecha inicio" class="form-control" runat="server" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Fecha Vencimiento: </label>
                        <div class="col-lg-6">
                            <div class='input-group date' id='datetimepicker4'>
                                <input id="txtFechaVencimiento" placeholder="Fecha vencimiento" class="form-control" runat="server" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Prioridad: </label>
                        <div class="col-lg-6">
                            <asp:DropDownList ID="ddlPrioridad" runat="server" CssClass="form-control" DataValueField="TaskPriorityID" DataTextField="TaskPriority" DataSourceID="PrioritySqldataSource" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Estado: </label>
                        <div class="col-lg-6">
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" DataValueField="TaskStateID" DataTextField="TaskState" DataSourceID="StatusSqldataSource" AppendDataBoundItems="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group" runat="server">
                        <label class="col-lg-3 control-label">Porcentaje: </label>
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtPorcentaje" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAceptar" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="btnAceptar_Click"></asp:Button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
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

    <!-- #region DATASOURCES -->
    <asp:SqlDataSource ID="TasksSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="task.sp_search_tasks" SelectCommandType="StoredProcedure"
        DeleteCommand="task.sp_delete_task" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="find" ControlID="txtSearchTask" PropertyName="Text" Type="String" />
            <asp:Parameter Name="user" DbType="String" />
            <asp:ControlParameter Name="priorityID" ControlID="ddlTaskPriority" DbType="Int32" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="stateID" ControlID="ddlTaskState" DbType="Int32" PropertyName="SelectedValue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="TaskID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StatusSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_status]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="PrioritySqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_priority]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TypeSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_type]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="UserSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_users]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


    <asp:SqlDataSource ID="TaskCommentsDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[task].[sp_get_TaskComments]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="TaskID" ControlID="hf_TaskID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!-- #endregion -->

    <script>

        $('#datetimepicker1').datetimepicker({
            format: 'DD-MM-YYYY',
            locale: 'es'
        });

        $('#datetimepicker2').datetimepicker({
            format: 'DD-MM-YYYY',
            locale: 'es'
        });

        $('#datetimepicker3').datetimepicker({
            format: 'DD-MM-YYYY',
            locale: 'es'
        });

        $('#datetimepicker4').datetimepicker({
            format: 'DD-MM-YYYY',
            locale: 'es'
        });

        function openModalTask() {
            $('#myModalTask').modal('show');
        }

        function openModalTaskComments() {
            $('#myModalTaskComment').modal('show');
        }

    </script>

</asp:Content>
