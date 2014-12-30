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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatesTransitionsChart.aspx.cs" Inherits="IAS.Admin.StatesTransitionsChart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grafico</title>

    <link href="../Content/dagre-d3-simple.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/d3.min.js"></script>
    <script>

        function renderTransitionChart() {

            var nodes = {};

            // Compute the distinct nodes from the links.
            links.forEach(function (link) {
                link.source = nodes[link.source] || (nodes[link.source] = { name: link.source });
                link.target = nodes[link.target] || (nodes[link.target] = { name: link.target });
            });

            $.each(nodes, function (key, nodo) {
                var inicio = true;
                var final = true;

                links.forEach(function (link) {
                    if (nodo.name == link.target.name) {
                        inicio = false;
                    }
                    if (nodo.name == link.source.name) {
                        final = false;
                    }
                });

                if (inicio) { nodo['class'] = 'begin' }
                if (final) { nodo['class'] = 'end' }

            });

            var w = 450,
                h = 450;

            var force = d3.layout.force()
                .nodes(d3.values(nodes))
                .links(links)
                .size([w, h])
                .linkDistance(110)
                .charge(-800)
                .on("tick", tick)
                .start();

            var svg = d3.select("body form").append("svg:svg")
                .attr("width", w)
                .attr("height", h);

            var path = svg.append("svg:g")
                .selectAll("path")
                .data(force.links())
                .enter().append("svg:path")
                .attr("class", function (d) { return "link " + d.type; });

            var circle = svg.append("svg:g")
                .selectAll("circle")
                .data(force.nodes())
                .enter().append("svg:circle")
                .attr("r", 16)
                 .attr("class", function (d) { return d.class; })
                .call(force.drag);

            var text = svg.append("svg:g")
                .selectAll("g")
                .data(force.nodes())
              .enter().append("svg:g");

            // A copy of the text with a thick white stroke for legibility.
            text.append("svg:text")
                .attr("x", 18)
                .attr("y", ".31em")
                .attr("class", "shadow")
                .text(function (d) { return d.name; });

            text.append("svg:text")
                .attr("x", 18)
                .attr("y", ".31em")
                .text(function (d) { return d.name; });

            // Use elliptical arc path segments to doubly-encode directionality.
            function tick() {
                path.attr("d", function (d) {
                    var dx = d.target.x - d.source.x,
                        dy = d.target.y - d.source.y,
                        dr = Math.sqrt(dx * dx + dy * dy),
                        theta = Math.atan2(dy, dx) + Math.PI / 7.85,
                        d90 = Math.PI / 2,
                        dtxs = d.target.x - 16 * Math.cos(theta),
                        dtys = d.target.y - 16 * Math.sin(theta);
                    return "M" + d.source.x + "," + d.source.y + "A" + dr + "," + dr + " 0 0 1," + d.target.x + "," + d.target.y + "A" + dr + "," + dr + " 0 0 0," + d.source.x + "," + d.source.y + "M" + dtxs + "," + dtys + "l" + (3.5 * Math.cos(d90 - theta) - 10 * Math.cos(theta)) + "," + (-3.5 * Math.sin(d90 - theta) - 10 * Math.sin(theta)) + "L" + (dtxs - 3.5 * Math.cos(d90 - theta) - 10 * Math.cos(theta)) + "," + (dtys + 3.5 * Math.sin(d90 - theta) - 10 * Math.sin(theta)) + "z";
                });

                circle.attr("transform", function (d) {
                    return "translate(" + d.x + "," + d.y + ")";
                });

                text.attr("transform", function (d) {
                    return "translate(" + d.x + "," + d.y + ")";
                });
            }
        }

    </script>
    <style>
        path.link
        {
            fill: #666;
            stroke: #666;
            stroke-width: 1.5px;
        }

            path.link.recursive
            {
                fill: green;
                stroke: green;
            }

        circle
        {
            fill: #ccc;
            stroke: #333;
            stroke-width: 1.5px;
        }

            circle.begin
            {
                fill: green;
            }

            circle.end
            {
                fill: orange;
            }

        text
        {
            font: 10px sans-serif;
            pointer-events: none;
        }

            text.shadow
            {
                stroke: #fff;
                stroke-width: 3px;
                stroke-opacity: .8;
            }
    </style>

</head>
<body>

    <form id="form1" runat="server">
        
    </form>

</body>
</html>
