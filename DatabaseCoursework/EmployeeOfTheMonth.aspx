<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeOfTheMonth.aspx.cs" Inherits="DatabaseCoursework.EmployeeOfTheMonth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Employee of the Month</title>
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
                <asp:SqlDataSource ID="MonthFilterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT distinct vote_month FROM voteyear"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT distinct EXTRACT(year from vote_year) &quot;VOTE_YEAR&quot; FROM voteyear"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="VOTE_YEAR" DataValueField="VOTE_YEAR">
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="MonthFilterDataSource" DataTextField="VOTE_MONTH" DataValueField="VOTE_MONTH">
                </asp:DropDownList>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" DataSourceID="EOMDataSource">
                </asp:GridView>
                <asp:SqlDataSource ID="EOMDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM
(SELECT
    EXTRACT(YEAR FROM vy1.vote_year) &quot;Vote Year&quot;,
    vy1.vote_month                   &quot;Vote Month&quot;,
    cand.employee_name               AS &quot;Candidate's Name&quot;,
    cand.date_of_birth               AS &quot;Candidate's DOB&quot;,
    cand.contact                     AS &quot;Candidate's Contact&quot;,
    cand_role.role_name              AS &quot;Candidate's Role&quot;,
    COUNT(*)                         &quot;Total Votes&quot;
FROM
         voteyear vy1
    INNER JOIN employee cand ON vy1.candidate_id = cand.employee_id
    INNER JOIN role     cand_role ON cand.role_id = cand_role.role_id
GROUP BY
    EXTRACT(YEAR FROM vy1.vote_year),
    vy1.vote_month,
    cand.employee_name,
    cand.date_of_birth,
    cand.contact,
    cand_role.role_name
HAVING
    EXTRACT(YEAR FROM vy1.vote_year)=:vote_year AND
    vy1.vote_month=:vote_month
ORDER BY
    &quot;Total Votes&quot; DESC)
WHERE ROWNUM &lt;= 3">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="vote_year" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="vote_month" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </div>
        </form>
    </main>
</body>
</html>
