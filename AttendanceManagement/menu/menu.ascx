<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="AttendanceManagement.menu.menu" %>
<div class="navbar navbar-custom navbar-fixed-top" role="navigation">
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
          <div class="navbar-form navbar-right"> 
              <strong>Stuart Wood (sw303)</strong>           
            <div class="form-group">
              <input type="text" id="txtSearch" runat="server" placeholder="search..." class="form-control" />
            </div>
              <asp:LinkButton ID="lbSearch" CssClass="btn btn-success" runat="server"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>                          
          </div>
            <p class="navbar-text navbar-right"><asp:LinkButton ID="lbImpersonate" CssClass="label label-danger" Text="[x] Impersonating" Visible="false" runat="server"></asp:LinkButton><a href="#" class="navbar-link"><asp:Label ID="lblUser" runat="server"></asp:Label></a></p>            
        </div><!-- end navbar-collapse -->
      </div><!-- end container -->
    </div><!-- end navbar-inner -->
    </div><!-- end navbar -->
