<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="egov.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        :root {
            --primary-color: #6C63FF;
            --secondary-color: #4CAF50;
            --background-color: #F0F2F5;
            --text-color: #333;
            --light-text-color: #666;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            text-align: center;
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-color);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1.5rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
            background-color: var(--primary-color);
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn:hover {
            background-color: #5753D9;
            transform: scale(1.05);
        }

        .error {
            color: #e74c3c;
            font-size: 0.875rem;
            margin-top: -1rem;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            form {
                padding: 1.5rem;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Login</h1>
        <div>
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblValid" runat="server" CssClass="error"></asp:Label>
        </div>
        <div>
            <label for="txtPass">Password</label>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblPassValid" runat="server" CssClass="error"></asp:Label>
        </div>
        <div>
            <asp:Button ID="loginButton" runat="server" OnClick="loginbtn_click" Text="Login" CssClass="btn"></asp:Button>
        </div>

        <div class="signup-link">
            Not registered yet? <a href="SignUp.aspx">Create an account</a>
        </div>
    </form>
</body>
</html>
