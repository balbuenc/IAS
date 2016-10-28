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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px; padding-right: 10px ; font-family:'Segoe UI' ; font-size:smaller">
        <div class="row">
            <div class="col-lg-3">
                <asp:TextBox ID="txtSearchTask" runat="server" CssClass="form-control" placeholder="Tarea"></asp:TextBox>
            </div>
            <div class="col-lg-1">
                <asp:DropDownList ID="ddlTaskPriority" runat="server" CssClass="form-control" DataValueField="TaskPriorityID" DataTextField="TaskPriority" DataSourceID="PrioritySqldataSource" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1" Text="Todas las prioridades" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-2">
                <asp:DropDownList ID="ddlTaskState" runat="server" CssClass="form-control" DataValueField="TaskStateID" DataTextField="TaskState" DataSourceID="StatusSqldataSource" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1" Text="Todos los estados" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-2">
                <div class='input-group date' id='datetimepicker1'>
                    <input id="dpStart" placeholder="Fecha desde" class="form-control" runat="server" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
            <div class="col-lg-2">
                <div class='input-group date' id='datetimepicker2'>
                    <input id="dpEnd" placeholder="Fecha hasta" class="form-control" runat="server" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
            <div class="col-lg-2 pull-right">
                <button id="btnSearch" runat="server" class="btn btn-default" onserverclick="btnSearch_ServerClick">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
                &nbsp;
                          <button id="btnNewTask" runat="server" class="btn btn-default" onserverclick="btnNewTask_ServerClick">
                              <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                          </button>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>
        <hr style="margin-top: 7px; margin-bottom: 2px;" />
        <div class="row">
            <div class="col-lg-12">
                <asp:ListView ID="TasksListView"
                    runat="server"
                    DataKeyNames="TaskID"
                    OnItemCommand="TasksListView_ItemCommand">
                    <LayoutTemplate>
                        <div class="table responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Tarea</th>
                                        <th>Descripción</th>
                                        <th>Tipo</th>
                                        <th>Inicio</th>
                                        <th>Vencimiento</th>
                                        <th>Prioridad</th>
                                        <th>Estado</th>
                                        <th>Asignado a</th>
                                        <th>Creado por</th>
                                        <th>%</th>
                                        <th>Acciones</th>
                                    </tr>
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
                                <asp:Label ID="lblTaskID" runat="server" Text='<%# Eval("TaskID").ToString() %>' Visible="false" />
                                <asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskName") %>' Font-Bold="true" Font-Italic="true" />
                            </td>
                            <td>
                                <asp:Label ID="lblTaskDescription" runat="server" Text='<%# Eval("TaskDescription") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblTaskType" runat="server" Text='<%# Eval("TaskType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblStartDate" runat="server" Text='<%# DateTime.Parse( Eval("StartDate").ToString()).ToShortDateString() %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblDueDate" runat="server" Text='<%# DateTime.Parse( Eval("DueDate").ToString()).ToShortDateString() %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblTaskPriority" runat="server" Text='<%# Eval("TaskPriority") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblTaskState" runat="server" Text='<%# Eval("TaskState") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Eval("CreatedBy") %>' />
                            </td>
                            <td>
                                <asp:Label ID="lblPercentComplete" runat="server" Text='<%# Eval("PercentComplete" ) + " %" %>' />
                            </td>
                            <td>

                                <asp:LinkButton ID="EditButton" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("TaskID").ToString() %>' ToolTip="Editar" CssClass="btn btn-link">
                                                <span class="glyphicon glyphicon-edit"></span>
                                </asp:LinkButton>

                                <%--<asp:LinkButton ID="DeriveButton" runat="server" Text="Derivar" CommandName="Derivar" CommandArgument='<%# Eval("TaskID").ToString() %>' CssClass="btn btn-link">
                                                <span class="glyphicon glyphicon-share"></span>
                                </asp:LinkButton>--%>

                                <asp:LinkButton ID="CloseButton" runat="server" Text="Cerrar" CommandName="Cerrar" CommandArgument='<%# Eval("TaskID").ToString() %>' CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Cerrar la Tarea.?');">
                                                <span class="glyphicon glyphicon-off"></span>
                                </asp:LinkButton>

                                <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Eliminar" CommandArgument='<%# Eval("TaskID").ToString() %>' CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar la Tarea.?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                </asp:LinkButton>

                            </td>

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
    <div class="modal fade modal-wide" id="myModalTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
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
                            <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" Style="height: 60px;" runat="server" CssClass="form-control"></asp:TextBox>
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

    </script>

</asp:Content>
