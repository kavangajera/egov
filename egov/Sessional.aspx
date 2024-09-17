<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sessional.aspx.cs" Inherits="egov.Sessional" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sessional Results</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblSessionalResult" runat="server" Text=""></asp:Label>
            <asp:GridView ID="gvSessionalResults" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                    <asp:BoundField DataField="marks" HeaderText="Marks" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>