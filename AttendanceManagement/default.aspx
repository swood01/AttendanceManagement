<%@ Register TagPrefix="usercontrol" TagName="menu" Src="menu/menu.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="AttendanceManagement.LecturerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Attendance Management | Home</title>

    <!-- JQuery Core Library -->
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>  

    <!-- Bootstrap theme Library-->
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>      
   
    <!-- stylesheets -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/custom.css" />       
    <link rel='stylesheet' href='Content/fullcalendar.css' />
   
    <script src='Scripts/moment.min.js'></script>
    <script src='Scripts/fullcalendar/fullcalendar.js'></script>
    <script src='Scripts/calendar.js'></script>

</head>
<body>
    <form id="form1" runat="server">

        <!-- start navbar -->
        <usercontrol:menu ID="custom_menu" runat="server"></usercontrol:menu>
        <!-- end navbar -->

    <div class="container">
        <br />
            <br /><br />
            <a href="http://www.le.ac.uk/">
                <img src="images/uollogo.png" alt="University of Leicester" title="University of Leicester" /></a>
        
            <br />
            <br />

        <div class="pull-right">
            <asp:LinkButton ID="lbCalendarMode" runat="server" OnClick="lbCalendarMode_Click"><span class="glyphicon glyphicon-calendar"></span> Calendar Mode</asp:LinkButton>
            <asp:LinkButton ID="lbListMode" Visible="false" runat="server" OnClick="lbListMode_Click"><span class="glyphicon glyphicon-list"></span> List Mode</asp:LinkButton>            
        </div>
            <h4>Events</h4>        
        
         <asp:ListView ID="lvEvents" FullRowSelect="True" OnItemCommand="lvEvents_OnItemCommand" runat="server">             
             <LayoutTemplate>
                <span class="list-group">
                    <span id="ItemPlaceholder" runat="server" class="list-group-item">
                </span>
             </LayoutTemplate>
            <ItemTemplate>
                <span class="list-group-item">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:LinkButton id="lblTitle" Text='<%# DataBinder.Eval(Container.DataItem, "vcTitle")%>' CommandName="cnLoadEvent" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "vcSlot")%>' runat="server"></asp:LinkButton>                            
                        </div>
                        <div class="col-md-4">                
                <asp:LinkButton ID="lbLocation" Text='<%# DataBinder.Eval(Container.DataItem, "vcLocation")%>' runat="server" CommandName="cnLoadEvent" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "vcSlot")%>'></asp:LinkButton>
                (<asp:LinkButton ID="lbRoom" Text='<%# DataBinder.Eval(Container.DataItem, "vcRoom")%>' runat="server" CommandName="cnLoadEvent" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "vcSlot")%>'></asp:LinkButton>)
                            </div>
                        <div class="col-md-2">
                <asp:LinkButton ID="lbStart" Text='<%# DataBinder.Eval(Container.DataItem, "dtStart", "{0:HH:mm}")%>' runat="server" CommandName="cnLoadEvent" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "vcSlot")%>'></asp:LinkButton> 
                            - <asp:LinkButton ID="lbEnd" Text='<%# DataBinder.Eval(Container.DataItem, "dtEnd", "{0:HH:mm}")%>' runat="server" CommandName="cnLoadEvent" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "vcSlot")%>'></asp:LinkButton>                                
                            </div>

                            <div class="col-md-2">
                                   <asp:LinkButton ID="lbStartDate" Text='<%# DataBinder.Eval(Container.DataItem, "dtStart", "{0:d/MM/yyyy}")%>' runat="server" CommandName="cnLoadEvent" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "vcSlot")%>'></asp:LinkButton>              
                            </div>
                    </div>
                </span>

            </ItemTemplate>             
        </asp:ListView>         
        <div id="newRegistrations" runat="server">
            <asp:Label ID="lblNewRegistrations" runat="server"></asp:Label>
        </div>

        <asp:Panel ID="panelCalendar" BackColor="White" runat="server" Visible="false">
            <div id='calendar'></div>
        </asp:Panel>

        <hr />
      <footer>
        <p>&copy; University of Leicester 2016 | IT Services</p>
      </footer>

    </div>
     
    </form>
</body>
</html>
