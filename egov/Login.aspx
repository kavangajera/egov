<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="egov.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style>

        /* styles.css */

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4; /* Light grey background */
    color: #333; /* Dark grey text */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

form {
    background-color: #fff; /* White background for the form */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
}

h1 {
    color: #f5c518; /* Yellow text color */
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #555; /* Slightly darker grey for labels */
}

.form-control {
    width: calc(100% - 20px); /* Full width minus padding */
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.form-control:focus {
    border-color: #f5c518; /* Yellow border on focus */
    outline: none;
}

.btn {
    background-color: #f5c518; /* Yellow button */
    color: #fff; /* White text */
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
}

.btn:hover {
    background-color: #e0b814; /* Slightly darker yellow on hover */
}

.error {
    color: #e74c3c; /* Red for error messages */
    font-size: 12px;
    margin-top: -10px;
    margin-bottom: 15px;
}


    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            Please Login here<br />
        </div>
        <div>
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblValid" runat="server" CssClass="error"></asp:Label>
        </div>
        <div>
            <label for="txtPass">Password</label>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <asp:Label ID="lblPassValid" runat="server" CssClass="error"></asp:Label>
        </div>
        <div>
            <asp:Button ID="loginButton" runat="server" OnClick="loginbtn_click" Text="Login" CssClass="btn"></asp:Button>
        </div>
    </form>
</body>
</html>
