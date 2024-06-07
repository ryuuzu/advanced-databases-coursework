<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VotingRecord.aspx.cs" Inherits="DatabaseCoursework.VotingRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Roles</title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/font-awesome/css/all.css" rel="stylesheet" />
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container">
                <h2>Employee Voting System</h2>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Dashboard.aspx">Home</a></li>
                        <li class="nav-item"><a runat="server" class="nav-link" href="~/Addresses.aspx">Address</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Departments.aspx">Department</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Employees.aspx">Employee</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Jobs.aspx">Jobs</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Roles.aspx">Roles</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/JobHistoryMapping.aspx">Job History</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/VotingRecord.aspx">Voting Record</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/EmployeeOfTheMonth.aspx">Employee Of The Month</a></li>
                    </ul>

                </div>
            </div>
        </nav>
    </header>
    <main class="p-4">
        <form id="form1" runat="server">
            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT
    vy.vote_year_id      AS &quot;Vote Record ID&quot;,
    voter.employee_name  AS &quot;Voter's Name&quot;,
    voter.date_of_birth  AS &quot;Voter's DOB&quot;,
    voter.contact        AS &quot;Voter's Contact&quot;,
    voter_role.role_name AS &quot;Voter's Role&quot;,
    cand.employee_name   AS &quot;Candidate's Name&quot;,
    cand.date_of_birth   AS &quot;Candidate's DOB&quot;,
    cand.contact         AS &quot;Candidate's Contact&quot;,
    cand_role.role_name  AS &quot;Candidate's Role&quot;
FROM
         voteyear vy
    INNER JOIN employee voter ON vy.voter_id = voter.employee_id
    INNER JOIN employee cand ON vy.candidate_id = cand.employee_id
    INNER JOIN role     cand_role ON cand.role_id = cand_role.role_id
    INNER JOIN role     voter_role ON voter.role_id = voter_role.role_id
WHERE voter.employee_id = :employee">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="EmployeeDataSource" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_NAME&quot;, &quot;EMPLOYEE_ID&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" DataSourceID="SqlDataSource1">
                </asp:GridView>
            </div>
        </form>
    </main>
</body>
</html>
