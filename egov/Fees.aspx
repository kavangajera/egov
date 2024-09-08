<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="egov.Fees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fees Page</title>
    <style>
        body {
            background-color: #f0f0f0; /* light grey */
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

        .form-label {
            font-size: 18px;
            color: #333; /* dark grey */
        }

        .form-label-highlight {
            color: #f0ad4e; /* yellow highlight */
            font-weight: bold;
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
        <div>
            <asp:Label ID="lblModeVal" CssClass="form-label form-label-highlight" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMsg" CssClass="error-message" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
