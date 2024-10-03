<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="egov.Attendence" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        :root {
            --primary-color: #6C63FF;
            --secondary-color: #4CAF50;
            --warning-color: #FF6B6B;
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
            min-height: 100vh;
            padding: 1rem;
        }

        .container {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            text-align: center;
        }

        .attendance-card {
            margin-bottom: 1.5rem;
            padding: 1.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: var(--background-color);
        }

        label {
            display: block;
            font-size: 1.1rem;
            color: var(--text-color);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .value {
            font-size: 1.1rem;
            font-weight: 400;
            color: var(--light-text-color);
            margin-bottom: 1rem;
        }

        .status {
            font-size: 1.2rem;
            font-weight: 600;
            margin-top: 1rem;
        }

        .status.eligible {
            color: var(--secondary-color);
        }

        .status.not-eligible {
            color: var(--warning-color);
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
            margin-bottom: 1rem;
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

            label, .value, .status {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Attendance Status</h1>

            <!-- Fancy Home Button -->
            <a href="StudentInfo.aspx" class="home-button">
                <i class="fas fa-home"></i> Home
            </a>

            <!-- PlaceHolder for dynamically generated attendance cards -->
            <asp:PlaceHolder ID="phAttendanceCards" runat="server"></asp:PlaceHolder>

        </div>
    </form>
</body>
</html>
