<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sessional.aspx.cs" Inherits="egov.Sessional" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sessional Results</title>
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
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
            position: relative;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            text-align: center;
        }

        /* Fancy Home Button */
        .home-button {
            position: absolute;
            top: 1rem;
            left: 1rem;
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

        .info-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2rem;
        }

        .results-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .results-table th,
        .results-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .results-table th {
            background-color: var(--primary-color);
            color: white;
        }

        .results-table tr:last-child td {
            border-bottom: none;
        }

        .message {
            font-size: 1.2rem;
            color: var(--light-text-color);
            text-align: center;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <h1>Sessional Results</h1>

                <!-- Fancy Home Button -->
                <a href="StudentInfo.aspx" class="home-button">
                    <i class="fas fa-home"></i> Home
                </a>
            </div>
        </header>
        <main class="container">
            <div class="info-grid">
                <asp:Label ID="lblSessionalResult" runat="server" CssClass="message"></asp:Label>
                <asp:GridView ID="gvSessionalResults" runat="server" AutoGenerateColumns="False" CssClass="results-table">
                    <Columns>
                        <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                        <asp:BoundField DataField="marks" HeaderText="Marks" />
                    </Columns>
                </asp:GridView>
            </div>
        </main>
    </form>
</body>
</html>
