<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="egov.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
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
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem;
            min-height: 100vh;
            overflow-y: auto;
        }

        .form-container {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px; /* Increased max width for two cards */
            margin: auto;
        }

        h1 {
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        label {
            font-size: 1rem;
            color: var(--text-color);
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 0.8rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn:hover {
            background-color: #5753D9;
            transform: scale(1.05);
        }

        .error {
            color: #e74c3c;
            font-size: 0.9rem;
        }

        .login-link {
            text-align: center;
            margin-top: 1rem;
        }

        .login-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 1.5rem;
            }

            h1 {
                font-size: 1.5rem;
            }

            .form-control {
                font-size: 0.9rem;
            }

            .btn {
                font-size: 0.9rem;
            }

            .form-grid {
                grid-template-columns: 1fr; /* Stack vertically on small screens */
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h1>Sign Up</h1>
            <div class="card">
                <div class="form-grid">
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
                </div>
            </div>

            <div class="card">
                <div class="form-grid">
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
                </div>
                <asp:Button ID="Button1" runat="server" OnClick="datasubmit" Text="Sign Up" CssClass="btn" />
                <div class="login-link">
                    <p>Already registered? <a href="Login.aspx">Login here</a></p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
