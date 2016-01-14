<%@ Register TagPrefix="usercontrol" TagName="menu" Src="menu/menu.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="AttendanceManagement._event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Attendance Management | Event</title>

    <!-- JQuery Core Library -->
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>       

    <!-- Bootstrap theme Library-->
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>      
   
    <!-- stylesheets -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/custom.css" />

    <script src='Scripts/event.js'></script>        

    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>

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
                                        <div class="col-sm-2 col-md-offset-3">Event</div>
                                        <div class="col-sm-5">
                                            <strong><asp:Label ID="lblEvent" runat="server"></asp:Label><asp:Label ID="lblSlot" runat="server" Visible="false"></asp:Label></strong>                        
                                        </div>                                                                                        
                                </div>                                
                                <div class="row">
                                    <div class="col-sm-2 col-md-offset-3">Date</div>
                                    <div class="col-sm-5">
                                        <strong><asp:label ID="lblDate" runat="server"></asp:label></strong>                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 col-md-offset-3">Time</div>
                                    <div class="col-sm-5">
                                        <strong><asp:label ID="lblTime" runat="server"></asp:label></strong>                        
                                    </div>
                                </div>
                            <div class="row">
                                    <div class="col-sm-2 col-md-offset-3">&nbsp;</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 col-md-offset-3">Location</div>
                                    <div class="col-sm-5">                                        
                                        
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
                                    <div class="col-sm-2 col-md-offset-3">&nbsp;</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 col-md-offset-3">Room</div>
                                    <div class="col-sm-5">                                                                                                  

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
                                    <div class="col-sm-2 col-md-offset-3">&nbsp;</div>
                                </div>

                            <!--start -->
                             <div class="row">
                                                <div class="col-sm-2 col-md-offset-3">Expected</div>
                                                <div class="col-sm-5">
                                                                                    <div class="progress">
                                                                                        <div id="pbExpected" class="progress-bar progress-bar-info" runat="server" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                                                                            <asp:label id="lblExpected" runat="server"></asp:label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                            </div>                                              
                                                   
                                            <div class="row">
                                                                               <div class="col-sm-2 col-md-offset-3">Present</div>
                                                                                <div class="col-sm-5">
                                                                                    <div class="progress">
                                                                                        <div id="pbPresent" class="progress-bar progress-bar-success" runat="server" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                                                                            <asp:label id="lblPresent" runat="server"></asp:label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                </div>

                                            <div id="unexpected" class="row">
                                                                                <div class="col-sm-2 col-md-offset-3">Unexpected</div>
                                                                                <div class="col-sm-5">
                                                                                    <div class="progress">
                                                                                        <div id="pbUnexpected" class="progress-bar progress-bar-warning" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                                                                            <asp:label id="lblUnexpected" runat="server"></asp:label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                            </div>   

                            <!--end -->



                        </div>
                        <div class="col-sm-4">
                            <asp:Image ID="img" runat="server"/><br /><br />

                            <strong>Show Images</strong> <input type="checkbox" id="chkShowImages" runat="server" checked data-toggle="toggle" data-onstyle="success" />

                        </div>
                </div>

    <!-- progress bar end -->

        <h4>Expected Students</h4>                        

        <div id="ExpectedStudents" runat="server">            
        </div>             

        <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Student Details</h4>
                        </div>
                        <div class="modal-body text-center">
                            <img id="studentImage" src="" alt="" />
                            <br />
                            <br />
                            <strong>Name: </strong>
                            <p id="fullName"></p>
                            <strong>Account Name: </strong>
                            <p id="accName"></p>
                            <strong>Email: </strong>
                            <p id="email"></p>
                            <strong>Student Code: </strong>
                            <p id="studentNo"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

    </div>
    </form>
</body>
</html>
