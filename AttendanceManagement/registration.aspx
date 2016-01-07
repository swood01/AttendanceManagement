<%@ Register TagPrefix="usercontrol" TagName="menu" Src="menu/menu.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="AttendanceManagement.registration" %>

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
        <div class="row">
    
               <h4><asp:label ID="lblResult" runat="server"></asp:label></h4>
               <asp:Panel ID="panelRegister" runat="server">
                    <div class="col-sm-8">
                        <strong>IT account name</strong> <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox><br />
                        <asp:button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />                                                
                    </div>
               </asp:Panel>                    

        </div>
    </div>
    </form>
</body>
</html>
