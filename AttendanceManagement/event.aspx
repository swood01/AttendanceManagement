<%@ Register TagPrefix="usercontrol" TagName="menu" Src="menu/menu.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="AttendanceManagement._event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- JQuery Core Library -->
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>

   

    <!-- Bootstrap theme Library-->
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>      
   
    <!-- stylesheets -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/custom.css" />

    <script type="text/javascript">

        //Get id parameter from URL so correct event can be loaded
        var eventid = getUrlParameter('id');              

        //doc ready function loads up expected students against actual attendees on page load
        $(document).ready(function () {                      
         
            $.ajax({
                url: 'handlers/event.ashx',
                type: 'POST',
                data: { 'Event': eventid },
                dataType: 'json',
                success: function (data) {

                    $('#ExpectedStudents').html(data);
                    UpdateAttendanceCounts();
                },
                error: function (errorText) {

                }
            });
        });

        /*
        Function to refresh the expected students div every 10 seconds
        */
        var auto_refresh = setInterval(
        function () {            
            $('#ExpectedStudents').empty();

            $.ajax({
                url: 'handlers/event.ashx',
                type: 'POST',
                data: { 'Event': eventid },
                dataType: 'json',
                success: function (data) {
                    
                    $('#ExpectedStudents').html(data);
                    UpdateAttendanceCounts();
                    
                },
                error: function (errorText) {
                    
                }
            });

           

        }, 10000); // refresh every 10000 milliseconds
        
        /*
        Function to update attendance counts within events page
        */
        function UpdateAttendanceCounts()
        {
            
            var expected = 0;
            var present = 0;
            var authorised = 0;
            var reported = 0
            
            expected = document.getElementsByClassName("list-group-item").length;
            present = document.getElementsByClassName("btn btn-primary present").length;            
            authorised = document.getElementsByClassName("btn btn-primary authorised").length;
            
            reported = authorised + present;
            
            var perReported = (reported / expected) * 100;
            var perPresent = (present / expected) * 100;                       

            $('#lblReported').text(reported);
            $('#lblExpected').text(expected);
            $('#lblPresent').text(present);
            
            $('#pbExpected').attr("style", "width:100%");
            $('#pbReported').attr("style", "width:" + perReported + "%;");
            $('#pbPresent').attr("style", "width:" + perPresent + "%;");                       

        }
       
        /*
        Function to get parameters from url
        */
        function getUrlParameter(sParam) {
            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : sParameterName[1];
                }
            }
        };

    </script>

</head>
<body>    <form id="form1" runat="server">
   
    <usercontrol:menu ID="custom_menu" runat="server"></usercontrol:menu>
        <!-- end navbar -->

    <div class="container">
        <br />
            <br /><br />
            <a href="http://www.le.ac.uk/">
                <img src="images/uollogo.png" alt="University of Leicester" title="University of Leicester" /></a>                      

                <div class="row">
                        <div class="col-sm-8">    
                            <!-- start nested rows -->
                                <div class="row">                                    
                                        <div class="col-sm-1 col-md-offset-5">Event</div>
                                        <div class="col-sm-4">
                                            <strong><asp:Label ID="lblEvent" runat="server"></asp:Label><asp:Label ID="lblSlot" runat="server" Visible="false"></asp:Label></strong>                        
                                        </div>                                                                                        
                                </div>                                
                                <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">Date</div>
                                    <div class="col-sm-4">
                                        <strong><asp:label ID="lblDate" runat="server"></asp:label></strong>                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">Time</div>
                                    <div class="col-sm-4">
                                        <strong><asp:label ID="lblTime" runat="server"></asp:label></strong>                        
                                    </div>
                                </div>
                            <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">&nbsp;</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">Location</div>
                                    <div class="col-sm-4">                                        
                                        
                                        <div class="btn-group">
                                          <asp:Button ID="btnLocation" runat="server" class="btn btn-sm btn-primary"></asp:Button>                                          
                                          <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="caret"></span>
                                            <span class="sr-only">Toggle Dropdown</span>
                                          </button>
                                          <ul class="dropdown-menu">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="#">Separated link</a></li>
                                          </ul>
                                        </div>
                                                                
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">&nbsp;</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">Room</div>
                                    <div class="col-sm-4">                                                                                                  

                                        <div class="btn-group">
                                          <asp:Button ID="btnRoom" runat="server" class="btn btn-sm btn-primary"></asp:Button>                                          
                                          <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="caret"></span>
                                            <span class="sr-only">Toggle Dropdown</span>
                                          </button>
                                          <ul class="dropdown-menu">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="#">Separated link</a></li>
                                          </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1 col-md-offset-5">&nbsp;</div>
                                </div>

                            <!--start -->
                             <div class="row">
                                                <div class="col-sm-1 col-md-offset-5">Expected</div>
                                                <div class="col-sm-4">
                                                                                    <div class="progress">
                                                                                        <div id="pbExpected" class="progress-bar progress-bar-success" runat="server" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                                                                            <asp:label id="lblExpected" runat="server"></asp:label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                            </div>
                                            <div class="row">
                                                                                <div class="col-sm-1 col-md-offset-5">Reported</div>
                                                                                <div class="col-sm-4">
                                                                                    <div class="progress">
                                                                                        <div id="pbReported" class="progress-bar progress-bar-danger" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                                                                            <asp:label id="lblReported" runat="server"></asp:label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                            </div>   
      
                                                    
                                                   
                                            <div class="row">
                                                                               <div class="col-sm-1 col-md-offset-5">Present</div>
                                                                                <div class="col-sm-4">
                                                                                    <div class="progress">
                                                                                        <div id="pbPresent" class="progress-bar progress-bar-warning" runat="server" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                                                                            <asp:label id="lblPresent" runat="server"></asp:label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                </div>
                            <!--end -->



                        </div>
                        <div class="col-sm-4">
                            <asp:Image ID="img" runat="server"/>
                        </div>
                </div>

    <!-- progress bar end -->

        <h4>Expected Students</h4>                        

        <div id="ExpectedStudents" runat="server">            
        </div>             

    </div>
    </form>
</body>
</html>
