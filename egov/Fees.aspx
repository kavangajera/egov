<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="egov.Fees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fees Page</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        form {
            background-color: #fff;
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f0ad4e;
            color: white;
        }

        .form-label {
            font-size: 18px;
            color: #333;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }

        .btn-submit {
            background-color: #f0ad4e;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #ec971f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Table ID="tblFees" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
                <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                <asp:TableHeaderCell>Mode of Payment</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
        </p>
    </form>
</body>
</html>
