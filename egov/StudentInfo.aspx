<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="egov.StudentInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Info</title>
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
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            text-align: center;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .info-card {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .info-card h2 {
            font-size: 1.2rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .info-card p {
            font-size: 1rem;
            color: var(--light-text-color);
        }

        .actions {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            color: white;
            background-color: var(--primary-color);
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #5753D9;
            transform: scale(1.05);
        }

        .btn-secondary {
            background-color: red;
        }

        .btn-secondary:hover {
            background-color: #ff4d4d;
        }

        #pnlSemesters, #pnlSessionals, #pnlResult {
            display: none;
            margin-top: 1rem;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            h1 {
                font-size: 2rem;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <h1>Student Dashboard</h1>
            </div>
        </header>
        <main class="container">
            <div class="info-grid">
                <div class="info-card">
                    <h2>Personal Information</h2>
                    <p><strong>Name:</strong> <asp:Label ID="lblFirstName" runat="server"></asp:Label> <asp:Label ID="lblMiddleName" runat="server"></asp:Label> <asp:Label ID="lblLastName" runat="server"></asp:Label></p>
                    <p><strong>Date of Birth:</strong> <asp:Label ID="lblDateOfBirth" runat="server"></asp:Label></p>
                    <p><strong>Mobile:</strong> <asp:Label ID="lblMobileNumber" runat="server"></asp:Label></p>
                </div>
                <div class="info-card">
                    <h2>Academic Information</h2>
                    <p><strong>Branch:</strong> <asp:Label ID="lblBranchName" runat="server"></asp:Label></p>
                    <p><strong>Admission Quota:</strong> <asp:Label ID="lblAdmissionQuota" runat="server"></asp:Label></p>
                    <p><strong>Enrollment Date:</strong> <asp:Label ID="lblEnrollmentDate" runat="server"></asp:Label></p>
                    <p><strong>Semester:</strong> <asp:Label ID="lblSem" runat="server"></asp:Label></p>
                </div>
            </div>
            <div class="actions">
                <asp:HyperLink ID="hlFee" runat="server" NavigateUrl="~/Fees.aspx" CssClass="btn">Fees Status</asp:HyperLink>
                <asp:HyperLink ID="hlAtd" runat="server" NavigateUrl="~/Attendence.aspx" CssClass="btn">Attendance Status</asp:HyperLink>
                <asp:Button ID="btnInternalResult" runat="server" Text="Internal Result" CssClass="btn" OnClientClick="toggleSemesters(); return false;" />
                <asp:Button ID="btnExternalResult" runat="server" Text="External Result" CssClass="btn" OnClientClick="toggleSemesters(true); return false;" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-secondary" />
            </div>

            <asp:Panel ID="pnlSemesters" runat="server" CssClass="actions">
                <!-- Semester buttons will be dynamically added here -->
            </asp:Panel>

            <asp:Panel ID="pnlSessionals" runat="server" CssClass="actions">
                <asp:Button ID="btnSessional1" runat="server" Text="Sessional 1" CssClass="btn" OnClientClick="showResult(1); return false;" />
                <asp:Button ID="btnSessional2" runat="server" Text="Sessional 2" CssClass="btn" OnClientClick="showResult(2); return false;" />
                <asp:Button ID="btnSessional3" runat="server" Text="Sessional 3" CssClass="btn" OnClientClick="showResult(3); return false;" />
            </asp:Panel>

            <asp:Panel ID="pnlResult" runat="server" CssClass="info-card">
                <h2>Result</h2>
                <p id="resultContent">Your result will be displayed here.</p>
            </asp:Panel>
            <asp:HiddenField ID="hdnResultType" runat="server" />

        </main>
    </form>


    <script type="text/javascript">
        var currentSemester = <%= ViewState["CurrentSemester"] %>;

        function toggleSemesters(isExternal) {
            var panel = document.getElementById('pnlSemesters');
            document.getElementById('<%= hdnResultType.ClientID %>').value = isExternal ? 'External' : 'Internal'; // Set the result type

            if (panel.style.display === 'none' || panel.style.display === '') {
                panel.style.display = 'flex';
                if (panel.children.length === 0) {
                    for (var i = 1; i <= currentSemester; i++) {
                        var btn = document.createElement('button');
                        btn.innerHTML = 'Sem ' + i;
                        btn.className = 'btn';
                        btn.onclick = function () {
                            showSessionals(parseInt(this.innerHTML.split(' ')[1])); // Call showSessionals with the selected semester
                            return false;
                        };
                        panel.appendChild(btn);
                    }
                }
            } else {
                panel.style.display = 'none';
                document.getElementById('pnlSessionals').style.display = 'none';
                document.getElementById('pnlResult').style.display = 'none';
            }
        }


        function showSessionals(semester) {
            var resultType = document.getElementById('<%= hdnResultType.ClientID %>').value;

            if (resultType === 'External') {
                showExternalResult(semester); // If External Result is clicked, go to External.aspx
            } else {
                var panel = document.getElementById('pnlSessionals');
                panel.style.display = 'flex';
                document.getElementById('pnlResult').style.display = 'none';
                for (var i = 1; i <= 3; i++) {
                    var btn = document.getElementById('btnSessional' + i);
                    btn.onclick = (function (sem, sessional) {
                        return function () {
                            showResult(sem, sessional);
                            return false;
                        };
                    })(semester, i);
                }
            }
        }

        function showExternalResult(semester) {
            // Construct the URL for External.aspx with the selected semester
            var url = 'External.aspx?semester=' + semester;

            // Redirect to External.aspx
            window.location.href = url;
        }


        function showResult(semester, sessional) {
            // Ensure semester is an integer
            var semesterInt = parseInt(semester);

            var url = 'Sessional.aspx?semester=' + semesterInt + '&sessional=' + sessional;

            // Redirect to the constructed URL
            window.location.href = url;
        }

    </script>
</body>
</html>