<%@ Page Title="Buscar renovaciones" Language="C#" MasterPageFile="~/Commercial.Master" AutoEventWireup="true" CodeBehind="RenovationSearch.aspx.cs" Inherits="IAS.Renovations.RenovationSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
        <div id="header">
            <div class="row">
                <div class="col-lg-4">
                    <div class="input-group">
                        <span class="input-group-btn">
                            <button id="searchBox" class="btn btn-default" runat="server" type="button" onserverclick="searchBox_ServerClick">Buscar</button>
                        </span>
                        <input type="text" class="form-control" id="txtSearchClaim" runat="server"
                            placeholder="Buscar Renovación..."
                            onkeydown="if (window.event.keyCode == 13) 
                                        {
                                            event.returnValue=false; 
                                            event.cancel = true;
                                            searchRecords();
                                        }" />
                        <div class="input-group-btn">
                            <button type="button" id="criteriaBtn" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" runat="server">Nro. Póliza<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="?criteria=PolicyNumber">Nro Póliza</a></li>
                                <li><a href="?criteria=Client">Cliente</a></li>
                                <li><a href="?criteria=ClientDocumentNumber">Nro. Documento</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <asp:DropDownList ID="ddlMyRenovations" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0" Text="Todos las renovaciones" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Mis renovaciones"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-2">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" DataValueField="ClaimStatusID" DataTextField="Status" DataSourceID="StatusSqldataSoruce" AppendDataBoundItems="true">
                        <asp:ListItem Value="-1" Text="Todos los estados" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    


    </div>
</asp:Content>
