<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="egov.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
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

.form-container {
    background-color: #fff; /* White background for the form */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

h1 {
    color: #f5c518; /* Yellow text color */
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #555; /* Slightly darker grey for labels */
}

.form-control {
    width: 100%;
    padding: 10px;
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
    margin-top: 20px;
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
        <div class="form-container">
            <h1>Sign Up</h1>
            <div class="form-group">
                <label for="fname">First Name</label>
                <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="mname">Middle Name</label>
                <asp:TextBox ID="mname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <asp:TextBox ID="lname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile no.</label>
                <asp:TextBox ID="mobile" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RangeValidator ID="RangeMob" runat="server" ControlToValidate="mobile" ErrorMessage="Please enter a valid Mobile number" CssClass="error" MaximumValue="9999999999" MinimumValue="6000000000"></asp:RangeValidator>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularEmail" runat="server" ControlToValidate="email" ErrorMessage="Please enter a valid email" CssClass="error" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="pass">Password</label>
                <asp:TextBox ID="pass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularPass" runat="server" ControlToValidate="pass" ErrorMessage="Length of password must be 6 or more" CssClass="error" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="cpass">Confirm Password</label>
                <asp:TextBox ID="cpass" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ID="ComparePass" runat="server" ControlToCompare="pass" ControlToValidate="cpass" ErrorMessage="It must be the same as password" CssClass="error"></asp:CompareValidator>
            </div>
            <div class="form-group">
                <label for="dob">DOB</label>
                <asp:TextBox ID="dob" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="quota">Quota</label>
                <asp:TextBox ID="quota" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="branch">Branch</label>
                <asp:TextBox ID="branch" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" OnClick="datasubmit" Text="Sign Up" CssClass="btn" />
        </div>
    </form>
</body>
</html>
