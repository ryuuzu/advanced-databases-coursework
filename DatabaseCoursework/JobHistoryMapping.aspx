<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobHistoryMapping.aspx.cs" Inherits="DatabaseCoursework.JobHistoryMapping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Job History Mapping</title>
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
            <asp:SqlDataSource ID="EpicComplexForm" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT
    jh.history_id          AS &quot;History ID&quot;,
    jh.start_date          AS &quot;Start Date&quot;,
    jh.end_date            AS &quot;End Date&quot;,
    emp.employee_name      AS &quot;Employee Name&quot;,
    emp.date_of_birth      AS &quot;Date of Birth&quot;,
    emp.contact            AS &quot;Contact&quot;,
    dpt.department_name    AS &quot;Department Name&quot;,
    dpt.department_email   AS &quot;Department Email&quot;,
    dpt.department_contact AS &quot;Department Contact&quot;,
    role.role_name         AS &quot;Role Name&quot;,
    jobs.job_name          AS &quot;Job Name&quot;
FROM
         job_history jh
    INNER JOIN employee   emp ON jh.employee_id = emp.employee_id
    INNER JOIN department dpt ON jh.department_id = dpt.department_id
    INNER JOIN role ON jh.role_id = role.role_id
    INNER JOIN jobs ON role.job_id = jobs.job_id
WHERE
    jh.end_date IS NOT NULL AND emp.employee_id = :employee">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="EmployeeIDNameDataSource" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" CssClass="table" runat="server" DataSourceID="EpicComplexForm">
            </asp:GridView>
            <asp:SqlDataSource ID="EmployeeIDNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
            <div>
            </div>
        </form>
    </main>
</body>
</html>
