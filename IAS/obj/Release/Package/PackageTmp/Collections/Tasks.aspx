<%--   
    «Copyright 2014 Balcazz HT, http://www.balcazzht.com»

    This file is part of IAS | Insurance Advanced Services.

    IAS is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    IAS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
 --%>

<%@ Page Title="Tareas" Language="C#" MasterPageFile="~/IAS_Master.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="IAS.Tasks.Tasks" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <asp:HiddenField ID="IdUserHiddenField" runat="server" />

        <div class="col-md-12">

            <h2>
                <asp:Label ID="LabelUser" runat="server" Text="Usuario" CssClass=""></asp:Label>
            </h2>
            <div class="panel panel-default" id="ImportacionPanel" >
                <div class="panel-heading">Importación | Cuentas por vencer</div>
                <div class="panel-body">
                    <div class="accordion" id="accordion2" >
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Personas Fisicas</a>
                                <p></p>
                            </div>
                            <div id="collapseOne" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <asp:GridView ID="PersonasFisicasGridView" runat="server" CssClass="table" Font-Size="Small" DataSourceID="DSPersonasFisicas" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="NOMBRE_DEL_TOMADOR" HeaderText="Cliente" SortExpression="NOMBRE_DEL_TOMADOR" />
                                            <asp:BoundField DataField="NRO_POLIZA" HeaderText="Nro. Póliza" SortExpression="NRO_POLIZA" />
                                            <asp:BoundField DataField="NOMBRE_DEL_RIESGO" HeaderText="Riesgo" SortExpression="NOMBRE_DEL_RIESGO" />
                                            <asp:BoundField DataField="NRO_RECIBO" HeaderText="Nro. Recibo" SortExpression="NRO_RECIBO" />
                                            <asp:BoundField DataField="NRO_CUOTA" HeaderText="Nro. Cuota" SortExpression="NRO_CUOTA" />
                                            <asp:BoundField DataField="IMPORTE_RECIBO_GS" HeaderText="Guaraníes" SortExpression="IMPORTE_RECIBO_GS" />
                                            <asp:BoundField DataField="IMPORTE_RECIBO_USD" HeaderText="Dólares" SortExpression="IMPORTE_RECIBO_USD" />
                                            <asp:BoundField DataField="FECHA_EFEC_RECIBO" HeaderText="Vencimiento" SortExpression="FECHA_EFEC_RECIBO" DataFormatString="{0:d}" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DSPersonasFisicas" runat="server" ConnectionString="<%$ ConnectionStrings:sqliasConnectionString %>" SelectCommand="SELECT * FROM [exchange].[v_personas_fisicas_exp] ORDER BY [id_persona], [NRO_POLIZA], [NRO_RECIBO]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Personas Juridicas</a>
                                <p></p>
                            </div>
                            <div id="collapseTwo" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <asp:GridView ID="PersonasJuridicasGridView" runat="server" CssClass="table" Font-Size="Small" DataSourceID="DSPersonasJuridicas" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="NOMBRE_DEL_TOMADOR" HeaderText="Cliente" SortExpression="NOMBRE_DEL_TOMADOR" />
                                            <asp:BoundField DataField="NRO_POLIZA" HeaderText="Nro. Póliza" SortExpression="NRO_POLIZA" />
                                            <asp:BoundField DataField="NOMBRE_DEL_RIESGO" HeaderText="Riesgo" SortExpression="NOMBRE_DEL_RIESGO" />
                                            <asp:BoundField DataField="NRO_RECIBO" HeaderText="Nro. Recibo" SortExpression="NRO_RECIBO" />
                                            <asp:BoundField DataField="NRO_CUOTA" HeaderText="Nro. Cuota" SortExpression="NRO_CUOTA" />
                                            <asp:BoundField DataField="IMPORTE_RECIBO_GS" HeaderText="Guaraníes" SortExpression="IMPORTE_RECIBO_GS" />
                                            <asp:BoundField DataField="IMPORTE_RECIBO_USD" HeaderText="Dólares" SortExpression="IMPORTE_RECIBO_USD" />
                                            <asp:BoundField DataField="FECHA_EFEC_RECIBO" HeaderText="Vencimiento" SortExpression="FECHA_EFEC_RECIBO" DataFormatString="{0:d}" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DSPersonasJuridicas" runat="server" ConnectionString="<%$ ConnectionStrings:sqliasConnectionString %>" SelectCommand="SELECT * FROM [exchange].[v_personas_juridicas_exp] ORDER BY [id_persona], [NRO_POLIZA], [NRO_RECIBO]"></asp:SqlDataSource>
                                </div>
                            </div>


                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Personas no registradas</a>
                                <p></p>
                            </div>
                            <div id="collapseThree" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <asp:GridView ID="PersonasInexistentesGridView" runat="server" CssClass="table" Font-Size="Small" DataSourceID="DSPersonasInexistentes" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="NOMBRE_DEL_TOMADOR" HeaderText="Cliente" SortExpression="NOMBRE_DEL_TOMADOR" />
                                            <asp:BoundField DataField="NRO_POLIZA" HeaderText="Nro. Póliza" SortExpression="NRO_POLIZA" />
                                            <asp:BoundField DataField="NOMBRE_DEL_RIESGO" HeaderText="Riesgo" SortExpression="NOMBRE_DEL_RIESGO" />
                                            <asp:BoundField DataField="NRO_RECIBO" HeaderText="Nro. Recibo" SortExpression="NRO_RECIBO" />
                                            <asp:BoundField DataField="NRO_CUOTA" HeaderText="Nro. Cuota" SortExpression="NRO_CUOTA" />
                                            <asp:BoundField DataField="IMPORTE_RECIBO_GS" HeaderText="Guaraníes" SortExpression="IMPORTE_RECIBO_GS" />
                                            <asp:BoundField DataField="IMPORTE_RECIBO_USD" HeaderText="Dólares" SortExpression="IMPORTE_RECIBO_USD" />
                                            <asp:BoundField DataField="FECHA_EFEC_RECIBO" HeaderText="Vencimiento" SortExpression="FECHA_EFEC_RECIBO" DataFormatString="{0:d}" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DSPersonasInexistentes" runat="server" ConnectionString="<%$ ConnectionStrings:sqliasConnectionString %>" SelectCommand="SELECT * FROM [exchange].[v_personas_inexistentes_exp] ORDER BY [id_persona], [NRO_POLIZA], [NRO_RECIBO]"></asp:SqlDataSource>
                                </div>
                            </div>


                        </div>

                    </div>
                    <p>
                        <asp:Button ID="AssignationsPageBtn" runat="server" CssClass="btn active" Text="Configuración de Asignaciones" PostBackUrl="~/Collections/Assignations.aspx" />
                    </p>


                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Tareas</div>
                <div class="panel-body">

                    <p>
                        <asp:GridView ID="GridUserTasks" runat="server" Font-Size="Smaller" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id_task" DataSourceID="DSTasks" Width="100%">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True"  />
                                <asp:BoundField DataField="id_task" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_task" />
                                <asp:BoundField DataField="task" HeaderText="Tarea" SortExpression="task">
                                    <ItemStyle Width="500px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="status" HeaderText="Estado" SortExpression="status" />
                                <asp:BoundField DataField="start" DataFormatString="{0:d}" HeaderText="Inicio" SortExpression="start" />
                                <asp:BoundField DataField="finish" DataFormatString="{0:d}" HeaderText="Final" SortExpression="finish" />
                                <asp:BoundField DataField="priority" HeaderText="Prioridad" SortExpression="priority" />
                                <asp:BoundField DataField="type" HeaderText="Tipo" SortExpression="type" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="DSTasks" runat="server" ConnectionString="<%$ ConnectionStrings:sqliasConnectionString %>" SelectCommand="get_tasks_by_user" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="IdUserHiddenField" Name="p_id_user" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </p>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Detalle de Tarea</div>
                <div class="panel-body">
                    <a name="Detail"></a>
                    <p>
                        <asp:FormView ID="DetalleTareaFormView" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_task" DataSourceID="DSTaskDetail" ForeColor="Black" GridLines="Horizontal">
                            <EditItemTemplate>
                                id_task:
                                <asp:Label ID="id_taskLabel1" runat="server" Text='<%# Eval("id_task") %>' />
                                <br />
                                task:
                                <asp:TextBox ID="taskTextBox" runat="server" Text='<%# Bind("task") %>' />
                                <br />
                                status:
                                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                                <br />
                                start:
                                <asp:TextBox ID="startTextBox" runat="server" Text='<%# Bind("start") %>' />
                                <br />
                                finish:
                                <asp:TextBox ID="finishTextBox" runat="server" Text='<%# Bind("finish") %>' />
                                <br />
                                nombre:
                                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                <br />
                                nro_poliza:
                                <asp:TextBox ID="nro_polizaTextBox" runat="server" Text='<%# Bind("nro_poliza") %>' />
                                <br />
                                nombre_del_riesgo:
                                <asp:TextBox ID="nombre_del_riesgoTextBox" runat="server" Text='<%# Bind("nombre_del_riesgo") %>' />
                                <br />
                                nro_recibo:
                                <asp:TextBox ID="nro_reciboTextBox" runat="server" Text='<%# Bind("nro_recibo") %>' />
                                <br />
                                nro_cuota:
                                <asp:TextBox ID="nro_cuotaTextBox" runat="server" Text='<%# Bind("nro_cuota") %>' />
                                <br />
                                fecha_vencimiento:
                                <asp:TextBox ID="fecha_vencimientoTextBox" runat="server" Text='<%# Bind("fecha_vencimiento") %>' />
                                <br />
                                tipo:
                                <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                <br />
                                prioridad:
                                <asp:TextBox ID="prioridadTextBox" runat="server" Text='<%# Bind("prioridad") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <InsertItemTemplate>
                                id_task:
                                <asp:TextBox ID="id_taskTextBox" runat="server" Text='<%# Bind("id_task") %>' />
                                <br />
                                task:
                                <asp:TextBox ID="taskTextBox" runat="server" Text='<%# Bind("task") %>' />
                                <br />
                                status:
                                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                                <br />
                                start:
                                <asp:TextBox ID="startTextBox" runat="server" Text='<%# Bind("start") %>' />
                                <br />
                                finish:
                                <asp:TextBox ID="finishTextBox" runat="server" Text='<%# Bind("finish") %>' />
                                <br />
                                nombre:
                                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                <br />
                                nro_poliza:
                                <asp:TextBox ID="nro_polizaTextBox" runat="server" Text='<%# Bind("nro_poliza") %>' />
                                <br />
                                nombre_del_riesgo:
                                <asp:TextBox ID="nombre_del_riesgoTextBox" runat="server" Text='<%# Bind("nombre_del_riesgo") %>' />
                                <br />
                                nro_recibo:
                                <asp:TextBox ID="nro_reciboTextBox" runat="server" Text='<%# Bind("nro_recibo") %>' />
                                <br />
                                nro_cuota:
                                <asp:TextBox ID="nro_cuotaTextBox" runat="server" Text='<%# Bind("nro_cuota") %>' />
                                <br />
                                fecha_vencimiento:
                                <asp:TextBox ID="fecha_vencimientoTextBox" runat="server" Text='<%# Bind("fecha_vencimiento") %>' />
                                <br />
                                tipo:
                                <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                <br />
                                prioridad:
                                <asp:TextBox ID="prioridadTextBox" runat="server" Text='<%# Bind("prioridad") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table class="nav-justified">
                                    <tr>
                                        <td>ID.:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="id_taskLabel" runat="server" Text='<%# Eval("id_task") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tarea:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="taskLabel" runat="server" Text='<%# Bind("task") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Etado:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Inicio:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="startLabel" runat="server" Text='<%# Bind("start") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vencimiento:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="finishLabel" runat="server" Text='<%# Bind("finish") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Cliente:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nro. póliza:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="nro_polizaLabel" runat="server" Text='<%# Bind("nro_poliza") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Riesgo:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="nombre_del_riesgoLabel" runat="server" Text='<%# Bind("nombre_del_riesgo") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nro. recibo:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="nro_reciboLabel" runat="server" Text='<%# Bind("nro_recibo") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nro. cuota:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="nro_cuotaLabel" runat="server" Text='<%# Bind("nro_cuota") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vencimiento cuota:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="fecha_vencimientoLabel" runat="server" Text='<%# Bind("fecha_vencimiento") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tipo:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Bind("tipo") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Prioridad:</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="prioridadLabel" runat="server" Text='<%# Bind("prioridad") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                &nbsp;&nbsp;
                                <br />

                            </ItemTemplate>
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        </asp:FormView>
                        <asp:SqlDataSource ID="DSTaskDetail" runat="server" ConnectionString="<%$ ConnectionStrings:sqliasConnectionString %>" SelectCommand="SELECT id_task, task, status, start, finish, nombre, nro_poliza, nombre_del_riesgo, nro_recibo, nro_cuota, fecha_vencimiento, tipo, prioridad FROM collections.get_task_detail(@id_task) AS get_task_detail_1">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridUserTasks" Name="id_task" PropertyName="SelectedValue" Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </p>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
