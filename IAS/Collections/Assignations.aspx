<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Assignations.aspx.cs" Inherits="IAS.Collections.Assignations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h2>Asignación de Personas a usuarios.</h2>
        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-heading">Usuario</div>
                <div class="panel-body">
                    <asp:DropDownList ID="UsersDropDownList" runat="server" DataSourceID="DSusers" DataTextField="Usuario" DataValueField="id_user" CssClass="list-group-item" AutoPostBack="True"  ></asp:DropDownList>
                    <asp:SqlDataSource ID="DSusers" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" ProviderName="<%$ ConnectionStrings:IASDBContext.ProviderName %>" SelectCommand="SELECT first_name AS Nombre, last_name AS Apellido, login AS Usuario, id_user FROM core.users"></asp:SqlDataSource>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Personas</div>
                <div class="panel-body">
                    <p>
                    <asp:GridView ID="PersonasGridView" runat="server" CssClass="table" AllowPaging="True" AllowSorting="True" DataSourceID="DSPersonas" AutoGenerateColumns="False" DataKeyNames="id_persona" Font-Size="X-Small">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id_persona" HeaderText="ID" SortExpression="id_persona" />
                            <asp:BoundField DataField="tipo_documento" HeaderText="Tipo Doc." SortExpression="tipo_documento" />
                            <asp:BoundField DataField="numero_documento" HeaderText="Nro. Documento" SortExpression="numero_documento" />
                            <asp:BoundField DataField="nombre" HeaderText="Persona" SortExpression="nombre" />
                            <asp:BoundField DataField="tipo_persona" HeaderText="Tipo" SortExpression="tipo_persona" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DSPersonas" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="SELECT [id_persona], [tipo_documento], [numero_documento], [nombre], [tipo_persona] FROM [collections].[v_personas_no_asignadas_a_usuario] ORDER BY [nombre]"></asp:SqlDataSource>
                </p>
                    <p>
                        <asp:Button ID="AssignBtn" runat="server" Text="Asignar Personas" CssClass="btn active" OnClick="AssignBtn_Click"  />
                    </p>
                        </div>
            </div>

        </div>

        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-heading">Asignación de Personas a Usuario</div>
                <div class="panel-body">
                    <p>
                    <asp:GridView ID="AssignationsGridView" runat="server" CssClass="table" AllowPaging="True" AllowSorting="True" DataSourceID="DSUserPersonasAssignations" AutoGenerateColumns="False" DataKeyNames="id_persona" Font-Size="X-Small">
                        <Columns>
                              <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id_persona" HeaderText="ID" SortExpression="id_persona" />
                            <asp:BoundField DataField="tipo_documento" HeaderText="Tipo Doc." SortExpression="tipo_documento" />
                            <asp:BoundField DataField="numero_documento" HeaderText="Nro. Documento" SortExpression="numero_documento" />
                            <asp:BoundField DataField="nombre" HeaderText="Persona" SortExpression="nombre" />
                            <asp:BoundField DataField="tipo_persona" HeaderText="Tipo" SortExpression="tipo_persona" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DSUserPersonasAssignations" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="SELECT id_persona, tipo_documento, numero_documento, nombre, tipo_persona FROM collections.get_user_personas_assignations(@id_user) AS get_user_personas_assignations_1">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="UsersDropDownList" Name="id_user" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        </p>
                    <p>
                        <asp:Button ID="DeAssingBtn" runat="server" Text="Eliminar Personas" CssClass="btn active" OnClick="DeAssingBtn_Click"    />
                    </p>
                    
                </div>
            </div>
        </div>


    </div>
</asp:Content>
