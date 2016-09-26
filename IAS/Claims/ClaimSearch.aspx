<%@ Page Title="Buscar Siniestros" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="ClaimSearch.aspx.cs" Inherits="IAS.Claims.ClaimSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
    <script src="/Scripts/bootstrap-datepicker.min.js"></script>
    
    <script type="text/javascript">
        $(function () {
            $("[id$=txtSearchClaim]").autocomplete(
                {
                    source: "search.ashx",
                    // note minlength, triggers the Handler call only once 3 characters entered
                    minLength: 3,
                    focus: function( event, ui ) {
                        $("[id$=txtSearchClaim]").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                        if (ui.item) {
                            $("[id$=txtSearchClaim]").val(ui.item.Client);
                            return false;
                        }
                    }
                })
                .autocomplete("instance")._renderItem = function (ul, item) {
                    //console.log(item.Client);
                    return $("<li>")
                      .append("<div>" + item.Client + "</div>")
                      .appendTo(ul);
                };
        });

        //$(document).ready(function () {
        //    $.ajax({
        //        type: "POST",
        //        url: "ClaimSearch.aspx/SearchClaim",
        //        data: "{}",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (result) {
        //            if (result.hasOwnProperty("d")) {
        //                // The .d is part of the result so reference it
        //                //  to get to the actual JSON data of interest
        //                $("[id$=txtSearchClaim]").autocomplete({
        //                    source: result.d
        //                });
        //            }
        //            else {
        //                // No .d; so just use result
        //                $("[id$=txtSearchClaim]").autocomplete({
        //                    source: result
        //                });
        //            }
        //        }
        //    });
        //});


        //    $(function () {
        //        $("[id$=txtSearchClaim]").autocomplete({
        //            source: function (request, response) {
        //                $.ajax({
        //                    url: 'http://localhost:1715/Claims/ClaimSearch/SearchClaim',
        //                    data: "{ 'prefix': '" + request.term + "'}",
        //                    dataType: "json",
        //                    type: "POST",
        //                    contentType: "application/json; charset=utf-8",
        //                    success: function (data) {
        //                        response($.map(data.d, function (item) {
        //                        return {
        //                            label: item.split('-')[0],
        //                            val: item.split('-')[1]
        //                        }
        //                    }))
        //                },
        //                error: function (response) {
        //                    console.log(response.responseText);
        //                },
        //                failure: function (response) {
        //                    console.log(response.responseText);
        //                }
        //            });
        //        },
        //        select: function (e, i) {
        //            $("[id$=txtSearchClaim]").val(i.item.val);
        //        },
        //        minLength: 1
        //    });
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Búsqueda</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-3">
                        <asp:DropDownList runat="server" ID="ddlCriteria" CssClass="form-control">
                            <asp:ListItem Value="" Text="Tipo de búsqueda"></asp:ListItem>
                            <asp:ListItem Value="PolicyNumber" Text="Nro Póliza"></asp:ListItem>
                            <asp:ListItem Value="Client" Text="Cliente"></asp:ListItem>
                            <asp:ListItem Value="ClientDocumentNumber" Text="Nro documento"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-4">
                        <asp:TextBox ID="txtSearchClaim" runat="server" CssClass="form-control" placeholder="dato a buscar"></asp:TextBox>
                    </div>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="ddlMyClaims" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="Todos los siniestros" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Mis siniestros"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" DataValueField="ClaimStatusID" DataTextField="Status" DataSourceID="StatusSqldataSoruce" AppendDataBoundItems="true">
                            <asp:ListItem Value="-1" Text="Todos los estados" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
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
                    <div class="col-lg-1">
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default" Text="Buscar" OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-lg-2">
                        <a href="NewClaim.aspx?criteria=Client">
                            <span class="glyphicon glyphicon-plus btn btn-link">Nuevo</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="msg-box bg-danger" />
            </div>
        </div>

        <div class="row" style="padding-top: 5px">
            <div class="col-lg-12">
                <asp:ListView ID="ClaimListView"
                    runat="server"
                    DataKeyNames="ClaimID"
                    OnItemCommand="ClaimListView_ItemCommand">
                    <LayoutTemplate>
                        <div class="table responsive">
                            <table class="table table-striped" style="font-size: x-small">
                                <thead>
                                    <tr>
                                        <th>Nro Póliza</th>
                                        <th>Cliente</th>
                                        <%--      <th>Nro. Doc.</th>--%>
                                        <th>Siniestro</th>
                                        <th>Riesgo</th>
                                        <th>Perdida</th>
                                        <th>Fecha</th>
                                        <th>Usuario</th>
                                        <th>Estado</th>
                                        <th>Sub Estado</th>
                                        <th>Pendiente</th>
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
                                <asp:Label ID="lblClaimID" runat="server" Text='<%# Eval("ClaimID").ToString() %>' Visible="false" />
                                <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("PolicyNumber").ToString() %>' /></td>
                            <td>
                                <asp:Label ID="lblClient" runat="server" Text='<%# Eval("Client") %>' /></td>
                            <%-- <td>
                                    <asp:Label ID="lblClientDocumentNumber" runat="server" Text='<%# Eval("ClientDocumentNumber") %>' /></td>--%>
                            <td>
                                <asp:Label ID="lblClaimNumber" runat="server" Text='<%# Eval("ClaimNumber") %>' /></td>
                            <td>
                                <asp:Label ID="lblRiskName" runat="server" Text='<%# Eval("RiskName") %>' /></td>
                            <td>
                                <asp:Label ID="lblLooseDescription" runat="server" Text='<%# Eval("LooseDescription") %>' /></td>
                            <td>
                                <asp:Label ID="lblRegistryDate" runat="server" Text='<%# DateTime.Parse( Eval("ClaimDate").ToString()).ToShortDateString() %>' /></td>
                            <td>
                                <asp:Label ID="lblUsuario" runat="server" Text='<%# Eval("Usuario") %>' /></td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' /></td>
                            <td>
                                <asp:Label ID="lblSubStatus" runat="server" Text='<%# Eval("SubStatus") %>' /></td>
                            <td>
                                <asp:HyperLink ID="linkAction" runat="server" Text='<%#   Eval("NextStatus") %>' NavigateUrl='<%#   Eval("ActionForm") %>'></asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8"></td>
                            <td colspan="2" style="text-align: right">


                                <asp:LinkButton ID="EditButton" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-link">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                </asp:LinkButton>


                                <asp:LinkButton ID="DeleteButton" runat="server" Text="Borrar" CommandName="Delete" CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Eliminar el Siniestro.?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                </asp:LinkButton>

                                <asp:LinkButton ID="CloseButton" runat="server" Text="Borrar" CommandName="Close" CssClass="btn btn-link" OnClientClick="return confirm('Esta Usted seguro de Cerrar el Siniestro.?');">
                                                <span class="glyphicon glyphicon-download-alt"></span>
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
                                <div class="msg-box bg-warning alert-danger">No se encontraron Siniestros.</div>
                            </div>
                        </div>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>


    <!-- #region DATSOURCES -->
    <asp:SqlDataSource ID="ClaimSqldataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="claim.sp_search_claims" SelectCommandType="StoredProcedure"
        DeleteCommand="claim.sp_delete_claim" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="find" ControlID="txtSearchClaim" PropertyName="Text" Type="String" />
            <asp:QueryStringParameter Name="criteria" QueryStringField="criteria" DefaultValue="PolicyNumber" />
            <asp:Parameter Name="user" />
            <asp:ControlParameter Name="myClaims" ControlID="ddlMyClaims" Type="String" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="claimStatusId" ControlID="ddlStatus" DbType="Int32" PropertyName="SelectedValue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ClaimID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StatusSqldataSoruce" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="[claim].[sp_get_status]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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

    </script>


</asp:Content>
