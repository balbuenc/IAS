<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimGlobalView.aspx.cs" Inherits="IAS.Claims.ClaimGlobalView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link href="../Content/bootstrap.min.css" rel="stylesheet" />
  

    <script type="text/javascript">
        function searchRecords() {

            document.getElementById("<%=searchBox.ClientID %>").click();;

        }
    </script>
    <style>
        #navigation {
            float: left;
            width: 300px;
        }

        #contenido {
            margin: 0 300px;
        }

        #cabecera {
        }
    </style>
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
               <h1>Administraciòn de Siniestros</h1>
            </div>
            
        </div>


        <div  class="row">
            <div id="navigation">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a href="#">Siniestros</a></li>
                    <li role="presentation"><a href="#">Alta siniestro</a></li>
                    <li role="presentation"><a href="#">Verificacion de Cobertura</a></li>
                    <li role="presentation"><a href="#">Registro del Siniestro</a></li>
                    <li role="presentation"><a href="#">Aceptacion por Aseguradora</a></li>
                    <li role="presentation"><a href="#">Gestion de Taller</a></li>
                    <li role="presentation"><a href="#">Cierre del Siniestro</a></li>
                </ul>
            </div>
            <div id="contenido">
                <div class="col-lg-12">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button id="searchBox" class="btn btn-default" runat="server" type="button" onserverclick="searchBox_ServerClick">Buscar</button>
                    </span>
                    <input type="text" class="form-control" id="txtSearchDI" runat="server" placeholder="Buscar Siniestro..." onkeydown="if (window.event.keyCode == 13) 
                                                                                                                                            {
                                                                                                                                                event.returnValue=false; 
                                                                                                                                                event.cancel = true;
                                                                                                                                                searchRecords();
                                                                                                                                            }">
                    <div class="input-group-btn">
                        <button type="button" id="criteriaBtn" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" runat="server">Nro. Pòliza<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="?criteria=num_di">Nro Pòliza</a></li>
                            <li><a href="?criteria=cliente">Cliente</a></li>
                            <li><a href="?criteria=fecha">Fecha</a></li>
                            <li><a href="?criteria=num_factura">Nro. Siniestro</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            </div>
        </div  >
    </div>
</asp:Content>
