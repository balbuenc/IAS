<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CollectionsToExpire.aspx.cs" Inherits="IAS.CaseManagment.CollectionsToExpire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Cuotas a vencer</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div>

                        <div>Dentro de la cantidad de dias.
                <asp:DropDownList ID="DropDownList1" runat="server" Width="56px" AutoPostBack="True">
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                </asp:DropDownList>
                        </div>

                        <div class="text-left">
                            <asp:Button ID="SendToAllSmsBtn" runat="server" Text="Enviar todos (A vencer)" CssClass="btn btn-success" OnClick="SendToAllSmsBtn_Click" Enabled="True" ToolTip="Envio de SMS" />
                        </div>

                    </div>

                    <div>
                        <h2>Cuotas por vencer</h2>
                    </div>

                    <div>
                        <asp:UpdatePanel ID="CaseListUPanel" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="CollectionsToExpireGridView" runat="server" CssClass="table" EmptyDataText="No se encuentran cuotas por vencer." AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="CollectionsToExpireSqlDataSource" Font-Names="Segoe UI Light" Font-Size="X-Small" PageSize="20" OnRowCommand="CollectionsToExpireGridView_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="CaseID" HeaderText="Id. Caso" SortExpression="CaseID" />
                                        <asp:BoundField DataField="PaymentDueDate" HeaderText="Vencimiento" SortExpression="PaymentDueDate" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="PaymentNumber" HeaderText="Nro. Cuota" SortExpression="PaymentNumber" />
                                        <asp:BoundField DataField="RiskName" HeaderText="Riesgo" SortExpression="RiskName" />
                                        <asp:BoundField DataField="DebtAmount" HeaderText="Monto" SortExpression="DebtAmount" DataFormatString="{0:0,0}" />
                                        <asp:BoundField DataField="Case" HeaderText="Cliente" SortExpression="Case" />
                                        <asp:BoundField DataField="Currency" HeaderText="Moneda" SortExpression="Currency" />
                                        <asp:BoundField DataField="telefono_celular" HeaderText="Nro. Celular" SortExpression="telefono_celular" />

                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" Text="SMS" CommandName="SendSMS" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CollectionID" HeaderText="Id. Cuota" SortExpression="CollectionID" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="CollectionsToExpireSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_collections_to_expire]" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="AddDays" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </ContentTemplate>

                        </asp:UpdatePanel>

                    </div>

                    <div id="dvSendSMS" class="modal fade modal-lg" tabindex="-1" role="dialog">

                        <div class="modal-dialog">

                            <div class="modal-content">

                                <div class="form-group">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Envio de SMS</h4>
                                    </div>

                                    <div class="modal-body">
                                        <asp:UpdatePanel ID="SendSMSPanel" UpdateMode="Conditional" runat="server">
                                            <ContentTemplate>
                                                <div class="form-group">
                                                    <label>Nro. Celular</label>
                                                    <asp:TextBox ID="Destination" CssClass="form-control" runat="server" Text=""></asp:TextBox>
                                                    <label>Mensaje:</label>
                                                    <asp:TextBox ID="TextToSend" TextMode="MultiLine" CssClass="form-control" runat="server" Style="max-width: 100% !important;" Text="" Wrap="True"></asp:TextBox>
                                                </div>

                                                <div class="text-right">
                                                    <asp:Button ID="SendSMSButtom" runat="server" Text="Enviar" Enabled ="false"  ToolTip="No posee cupo de SMS" CssClass="btn btn-success" OnClick="SendSMSButtom_Click" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <div class="panel-heading">
                <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Cuotas vencidas</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse in">
                <div class="text-left">
                            <asp:Button ID="SendSmsExpiredBtn" runat="server" Text="Enviar todos (Vencidos)" CssClass="btn btn-success" OnClick="SendToAllExpiredSmsBtn_Click" Enabled="True" ToolTip="Envio de SMS" />
                        </div>
                  <div>
                        <h2>Cuotas vencidas</h2>
                    </div>

                    <div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="CollectionsExpiredGridView" runat="server" CssClass="table" EmptyDataText="No se encuentran cuotas vencidas." AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="CollectionsExpiredSqlDataSource" Font-Names="Segoe UI Light" Font-Size="X-Small" PageSize="20" OnRowCommand="CollectionsExpiredGridView_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="CaseID" HeaderText="Id. Caso" SortExpression="CaseID" />
                                        <asp:BoundField DataField="PaymentDueDate" HeaderText="Vencimiento" SortExpression="PaymentDueDate" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="PaymentNumber" HeaderText="Nro. Cuota" SortExpression="PaymentNumber" />
                                        <asp:BoundField DataField="RiskName" HeaderText="Riesgo" SortExpression="RiskName" />
                                        <asp:BoundField DataField="DebtAmount" HeaderText="Monto" SortExpression="DebtAmount" DataFormatString="{0:0,0}" />
                                        <asp:BoundField DataField="Case" HeaderText="Cliente" SortExpression="Case" />
                                        <asp:BoundField DataField="Currency" HeaderText="Moneda" SortExpression="Currency" />
                                        <asp:BoundField DataField="telefono_celular" HeaderText="Nro. Celular" SortExpression="telefono_celular" />

                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" Text="SMS" CommandName="SendSMS" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CollectionID" HeaderText="Id. Cuota" SortExpression="CollectionID" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="CollectionsExpiredSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>" SelectCommand="[dbo].[sp_get_collections_expired]" SelectCommandType="StoredProcedure">
                                    
                                </asp:SqlDataSource>

                            </ContentTemplate>

                        </asp:UpdatePanel>

                    </div>

                <div id="dvSendSMSExpired" class="modal fade modal-lg" tabindex="-1" role="dialog">

                        <div class="modal-dialog">

                            <div class="modal-content">

                                <div class="form-group">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabelExpired">Envio de SMS por cuotas vencidas</h4>
                                    </div>

                                    <div class="modal-body">
                                        <asp:UpdatePanel ID="SendExpiredPanel" UpdateMode="Conditional" runat="server">
                                            <ContentTemplate>
                                                <div class="form-group">
                                                    <label>Nro. Celular</label>
                                                    <asp:TextBox ID="DestinationExpired" CssClass="form-control" runat="server" Text=""></asp:TextBox>
                                                    <label>Mensaje:</label>
                                                    <asp:TextBox ID="TextToSendExpired" TextMode="MultiLine" CssClass="form-control" runat="server" Style="max-width: 100% !important;" Text="" Wrap="True"></asp:TextBox>
                                                </div>

                                                <div class="text-right">
                                                    <asp:Button ID="SendSMSExpiredButtom" runat="server" Text="Enviar" Enabled ="false"  ToolTip="No posee cupo de SMS" CssClass="btn btn-success" OnClick="SendSMSExpiredButtom_Click" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
            </div>
        </div>
    </div>
</asp:Content>
