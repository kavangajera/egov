<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="egov.StudentInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Info</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: papayawhip;
        }
        .table-container {
            margin: 20px;
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="table-container">
            <table>
                <tr>
                    <th>First Name</th>
                    <td><asp:Label ID="lblFirstName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Middle Name</th>
                    <td><asp:Label ID="lblMiddleName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td><asp:Label ID="lblLastName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><asp:Label ID="lblDateOfBirth" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Mobile</th>
                    <td><asp:Label ID="lblMobileNumber" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Branch</th>
                    <td><asp:Label ID="lblBranchName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Admission Quota</th>
                    <td><asp:Label ID="lblAdmissionQuota" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Enrollment Date</th>
                    <td><asp:Label ID="lblEnrollmentDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Semester</th>
                    <td><asp:Label ID="lblSem" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            
            <!-- Existing Links -->
            <asp:HyperLink ID="hlFee" runat="server" NavigateUrl="~/Fees.aspx">Fees Status</asp:HyperLink>
            &nbsp;&nbsp; |&nbsp;&nbsp;
            <asp:HyperLink ID="hlAtd" runat="server" NavigateUrl="~/Attendence.aspx">Attendance Status</asp:HyperLink>
            &nbsp;&nbsp; |&nbsp;&nbsp;
            <!-- Using LinkButton instead of HyperLink to trigger server-side event -->
            <asp:LinkButton ID="lbSessional" runat="server" OnClick="lbSessional_Click" Visible="true">Sessional Result</asp:LinkButton>
            
            <!-- Panel for dynamically displaying sessional links -->
            <asp:Panel ID="pnlSessionalLinks" runat="server" Visible="false">
                <br />
                <asp:HyperLink ID="hlSessional1" runat="server" Text="Sessional 1" NavigateUrl="~/Sessional.aspx/?sessional=1"></asp:HyperLink>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <asp:HyperLink ID="hlSessional2" runat="server" Text="Sessional 2" NavigateUrl="~/Sessional.aspx/?sessional=2"></asp:HyperLink>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <asp:HyperLink ID="hlSessional3" runat="server" Text="Sessional 3" NavigateUrl="~/Sessional.aspx/?sessional=3"></asp:HyperLink>
            </asp:Panel>

            <br /><br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
