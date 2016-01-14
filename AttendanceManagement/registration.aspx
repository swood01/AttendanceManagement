<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="AttendanceManagement.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Attendance Management | Event Registration</title>

    <!-- JQuery Core Library -->
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>

   

    <!-- Bootstrap theme Library-->
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>      
   
    <!-- stylesheets -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/custom.css" />

</head>
<body>
    <form id="form1" runat="server">

        <!-- start navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="navbar-inner">  
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>    
            <a class="navbar-brand" href="#"><span style="color:#FAEBD7">Attendance Management</span></a>
        </div>
        <div class="navbar-collapse collapse">
               <ul id="mainmenu" class="nav navbar-nav">
                    <li id="m1"><a href="default.aspx">Home</a></li>
                    <li id="m2"><a href="default.aspx">History</a></li>
                    <li id="m3"><a href="default.aspx">Admin</a></li>                    
                </ul>          
            <p class="navbar-text navbar-right"><asp:LinkButton ID="lbImpersonate" CssClass="label label-danger" Text="[x] Impersonating" Visible="false" runat="server"></asp:LinkButton><a href="#" class="navbar-link"><asp:Label ID="lblUser" runat="server"></asp:Label></a></p>            
        </div><!-- end navbar-collapse -->
      </div><!-- end container -->
    </div><!-- end navbar-inner -->
    </div><!-- end navbar -->
        <!-- end navbar -->

    <div class="container">
        <br />
            <br /><br />
            <a href="http://www.le.ac.uk/">
                <img src="images/uollogo.png" alt="University of Leicester" title="University of Leicester" /></a>
        
            <br />
            <br />
        <div class="row">
            <div class="col-sm-8">
               <h4><asp:label ID="lblResult" runat="server"></asp:label></h4>
               <asp:Panel ID="panelRegister" runat="server">
                    <div class="col-sm-8">
                        <strong>IT account name</strong> <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox><br />
                        <asp:button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnSubmit_Click" />                                                
                    </div>
               </asp:Panel>                    
            </div>
        </div>
    </div>
    </form>
</body>
</html>
