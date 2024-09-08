<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendence.aspx.cs" Inherits="egov.Attendence" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblSem" runat="server" Text="Semester"></asp:Label>
&nbsp;
            <asp:Label ID="lblSemVal" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblAtd" runat="server" Text="Overall Attendence"></asp:Label>
&nbsp;
            <asp:Label ID="lblAtdVal" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
