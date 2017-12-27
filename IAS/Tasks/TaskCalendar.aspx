<%@ Page Title="iTask Calendar" Language="C#" MasterPageFile="~/Task.Master" AutoEventWireup="true" CodeBehind="TaskCalendar.aspx.cs" Inherits="IAS.Tasks.TaskCalendar" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/jquery-1.12.4.min.js"></script>
    <script src="/Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

    <style>
        .calendar_green_event_inner {
            overflow: hidden;
            position: absolute;
            top: 0px;
            bottom: 2px;
            left: 2px;
            right: 0px;
            margin-right: 1px;
            font-size: 12px;
            padding: 2px;
            padding-left: 8px; /* make space for duration bar */
            color: #ffffff;
            background: #a2c200;
            background: -moz-linear-gradient( top, #a2c200 0%, #8aaa00);
            background: -webkit-gradient( linear, left top, left bottom, from(#a2c200), to(#8aaa00));
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr="#a2c200", endColorStr="#8aaa00");
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #7cb316;
            -moz-box-shadow: 0px 2px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0.8);
            -webkit-box-shadow: 0px 2px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0.8);
            box-shadow: 0px 2px 3px rgba(000,000,000,0.3), inset 0px 0px 2px rgba(255,255,255,0.8);
            text-shadow: 0px -1px 0px rgba(000,000,000,0.2), 0px 1px 0px rgba(255,255,255,1);
        }


        /* outer duration bar box */
        .calendar_green_event_bar {
            top: 3px;
            bottom: 4px;
            left: 6px;
            width: 2px;
            background-color: #C0D46A;
            background-color: #C7D48D;
        }


        /* duration bar */
        .calendar_green_event_bar_inner {
            position: absolute;
            width: 2px;
            background-color: #6E8700;
        }
    </style>
    <script type="text/javascript">
        var dp = new DayPilot.Calendar("dp");
        dp.viewType = "Week";

        dp.init();
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox runat="server" ID="txtWebAuthUser" Visible="false"></asp:TextBox>
    <div class="space">
    Week:
    <a href="javascript:dpc.commandCallBack("previous");">Previous</a>
    |
    <a href="javascript:dpc.commandCallBack("next");">Next</a>
</div>
    <div id="dp"></div>

    <DayPilot:DayPilotCalendar ID="DayPilotCalendar1"
        runat="server"
        CellHeight="30"
        DataEndField="EventEnd"
        DataIdField="TaskID"
        DataSourceID="EventsDataSource"
        DataStartField="EventStart"
        DataTextField="TaskName"
        Days="7"
        ViewType="WorkWeek"
        DurationBarVisible="true"
        DurationBarWidth="10" OnCommand="DayPilotCalendar1_Command" />

    <asp:SqlDataSource ID="EventsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:IASDBContext %>"
        SelectCommand="SELECT  [TaskID],[TaskName],[EventStart],[EventEnd],[UserName]  FROM [IAS_Preprod].[task].[EventView] where UserName = @CurrentUser" SelectCommandType="Text">
        <SelectParameters>
            <asp:ControlParameter Name="CurrentUser" ControlID="txtWebAuthUser" Type="String" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
