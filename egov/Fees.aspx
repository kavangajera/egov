<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="egov.Fees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fees Status</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        :root {
            --primary-color: #6C63FF;
            --secondary-color: #4CAF50;
            --background-color: #F0F2F5;
            --text-color: #333;
            --light-text-color: #666;
        }

        label {
            display: block;
            font-size: 1.1rem;
            color: var(--text-color);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 1rem;
        }

        .container {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            width: 100%;
        }

        h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
            background-color: var(--background-color);
        }

        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: var(--table-header-color);
            color: white;
            font-weight: 600;
        }

        td {
            color: var(--text-color);
        }

        .header-bold-black {
            color: black;
            font-weight: bold;
        }

        .error-message {
            color: red;
            font-weight: bold;
            font-size: 1rem;
            text-align: center;
        }

        /* New style for the fancy Home button */
        .home-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--primary-color);
            color: white;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .home-button i {
            margin-right: 10px;
        }

        .home-button:hover {
            background-color: var(--secondary-color);
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
            }

            h1 {
                font-size: 1.5rem;
            }

            th, td {
                padding: 10px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Fees Status</h1>

            <!-- Fancy Home Button -->
            <a href="StudentInfo.aspx" class="home-button">
                <i class="fas fa-home"></i> Home
            </a>

            <!-- Fees table to display the status -->
            <asp:Table ID="tblFees" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell CssClass="header-bold-black">Semester</asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="header-bold-black">Amount</asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="header-bold-black">Mode of Payment</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>

            <asp:Label ID="lblmsg" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
