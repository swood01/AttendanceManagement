<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cmisimport.aspx.cs" Inherits="AttendanceManagement._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="btnGetEvents" runat="server" Text="Get Events" OnClick="btnGetEvents_Click" />
        <br />
        <asp:Label ID="lblResults" runat="server"></asp:Label>
        <asp:ListView ID="lvEvents" runat="server">
            <ItemTemplate>
                <asp:label id="lblSlotID" Text='<%# DataBinder.Eval(Container.DataItem, "slotid")%>' runat="server"></asp:label>
                <asp:label id="lblModName" Text='<%# DataBinder.Eval(Container.DataItem, "mod_name")%>' runat="server"></asp:label>
                <asp:label id="lblModType" Text='<%# DataBinder.Eval(Container.DataItem, "moduletype")%>' runat="server"></asp:label>
                <asp:label id="lblStartTime" Text='<%# DataBinder.Eval(Container.DataItem, "starttime")%>' runat="server"></asp:label>
                <asp:label id="lblFinishTime" Text='<%# DataBinder.Eval(Container.DataItem, "finishtime")%>' runat="server"></asp:label>
                <asp:label id="lblSiteName" Text='<%# DataBinder.Eval(Container.DataItem, "sitename")%>' runat="server"></asp:label>
                <asp:label id="lblRoomID" Text='<%# DataBinder.Eval(Container.DataItem, "roomid")%>' runat="server"></asp:label>
            </ItemTemplate>

        </asp:ListView>

        <br />
        <br />

        <asp:Button ID="btnUploadEvents" Text="Upload Events" runat="server" OnClick="btnUploadEvents_Click" />

        <br />
        <br />

        <asp:Button ID="btnGetStudents" runat="server" Text="Get Expected Students" OnClick="btnGetStudents_Click" />

        <br />

        <asp:ListView ID="lvStudents" runat="server">
            <ItemTemplate>
                <asp:Label ID="lblSlotID" Text='<%# DataBinder.Eval(Container.DataItem, "slotid")%>' runat="server"></asp:Label>
                <asp:Label ID="lblStudentID" Text='<%# DataBinder.Eval(Container.DataItem, "studentid")%>' runat="server"></asp:Label>
                </ItemTemplate>
        </asp:ListView>
             <br />
        <br />
        
        <asp:Button ID="btnUploadStudents" runat="server" text="Upload Students" OnClick="btnUploadStudents_Click" />
    </div>
    </form>
</body>
</html>
