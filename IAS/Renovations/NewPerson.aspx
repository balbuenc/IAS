<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="NewPerson.aspx.cs" Inherits="IAS.Renovations.NewPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="/Scripts/bootstrap-datepicker.min.js"></script>
    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="padding-left: 5px; padding-right: 5px">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Nueva persona</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <label class="col-sm-1 control-label" for="form-group-input">Tipo de documento</label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="form-control" DataValueField="id_tipo_documento" DataTextField="descripcion" DataSourceID="TipoDocumentoSqldataSoruce" AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Nro de documento</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtNumeroDocumento" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Razón social</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="TxtRazonSocial" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">

                    <label class="col-sm-1 control-label" for="form-group-input">Nombre</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Apellido 1</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Apellido 2</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <br />
                <div class="row">

                    <label class="col-sm-1 control-label" for="form-group-input">Fecha nacimiento</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtFechaNacimiento" type="date" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Sexo</label>
                    <div class="col-sm-3">
                        <asp:RadioButtonList ID="rdbSexo" runat="server" CssClass="radio-inline">
                            <asp:ListItem Text="Masculino" Value="M" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Femenino" Value="F"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    
                    <label class="col-sm-1 control-label" for="form-group-input">Tipo persona</label>
                    <div class="col-sm-3">
                        <asp:RadioButtonList ID="rdbTipoPersona" runat="server" CssClass="radio-inline">
                            <asp:ListItem Text="Fisica" Value="F" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Juridica" Value="J"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>                  

                </div>
<%--                <br />
                <div class="row">

                    <label class="col-sm-1 control-label" for="form-group-input">Teléfono domicilio 1</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtTelefonoDomicilio1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Teléfono domicilio 2</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtTelefonoDomicilio2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Teléfono celular</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtTelefonoCelular" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <br />
                <div class="row">

                    <label class="col-sm-1 control-label" for="form-group-input">Email particular</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtEmailParticular" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Dirección domicilio</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtDireccionDomicilio" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <label class="col-sm-1 control-label" for="form-group-input">Dirección laboral</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtDireccionLaboral" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                   
                </div>
                <br />
                <div class="row">
                    
                    <label class="col-sm-1 control-label" for="form-group-input">Teléfono laboral</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtTelefonoLaboral" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Email laboral</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtEmailLaboral" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                                        

                    <label class="col-sm-1 control-label" for="form-group-input">Observación</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <label class="col-sm-1 control-label" for="form-group-input">Tipo de documento 2</label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlTipoDocumento2" runat="server" CssClass="form-control" DataValueField="id_tipo_documento" DataTextField="descripcion" DataSourceID="TipoDocumentoSqldataSoruce" AppendDataBoundItems="true">
                            <asp:ListItem Value="-1" Text="Todos los tipos" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <label class="col-sm-1 control-label" for="form-group-input">Nacionalidad</label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlPaisNacionalidad" runat="server" CssClass="form-control" DataValueField="id_tipo_documento" DataTextField="descripcion" DataSourceID="TipoDocumentoSqldataSoruce" AppendDataBoundItems="true">
                            <asp:ListItem Value="-1" Text="Todos los paises" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                     <label class="col-sm-1 control-label" for="form-group-input">Estado civil</label>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlEstadoCivil" runat="server" CssClass="form-control" DataValueField="id_tipo_documento" DataTextField="descripcion" DataSourceID="TipoDocumentoSqldataSoruce" AppendDataBoundItems="true">
                            <asp:ListItem Value="-1" Text="Todos los estados" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>--%>
            </div>
        </div>
            <div class="row">
            <hr />
        </div>
        <div class="row">
            <div class="col-lg-2 col-lg-offset-10">
                <asp:Button ID="registrarPersonaBtn" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="registrarPersonaBtn_Click" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="TipoDocumentoSqldataSoruce" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[exchange].[sp_get_document_type_ddl]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
