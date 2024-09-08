<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="egov.StudentInfo" %>

<!DOCTYPE html>
<html>
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
            background-color: papayawhip; /* Light yellow */
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
           
            <br />
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
            <asp:HyperLink ID="hlFee" runat="server" NavigateUrl="~/Fees.aspx" OnDataBinding="goToFee">Fees Status</asp:HyperLink>
&nbsp;&nbsp; |&nbsp;&nbsp;
            <asp:HyperLink ID="hlAtd" runat="server" NavigateUrl="~/Attendence.aspx" OnDataBinding="goToAttendence">Attendence Status</asp:HyperLink>
            &nbsp; |&nbsp;&nbsp;
            <asp:HyperLink ID="hlSessional" runat="server" NavigateUrl="~/Sessional.aspx" OnDataBinding="goToSessional">Sessional Result</asp:HyperLink>
            <br />
            <br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
