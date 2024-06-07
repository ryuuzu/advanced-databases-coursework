<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DatabaseCoursework.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Dashboard</title>
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
                <div class="row">
                    <div class="col">
                        <h1>Employee Of The Month</h1>
                        <div>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="VoteYear" DataTextField="VOTE_YEAR" DataValueField="VOTE_YEAR">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="VoteYear" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT distinct EXTRACT(year from vote_year) &quot;VOTE_YEAR&quot; FROM voteyear"></asp:SqlDataSource>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="VoteMonthDataSource" DataTextField="VOTE_MONTH" DataValueField="VOTE_MONTH" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="VoteMonthDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT distinct vote_month FROM voteyear"></asp:SqlDataSource>
                        </div>
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="VoteRecordsDataSource">
                            <Series>
                                <asp:Series Name="Series1" ChartType="Pie" XValueMember="Employee Name" YValueMembers="Total Votes">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>

                        <asp:SqlDataSource ID="VoteRecordsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT
    cand.employee_name    &quot;Employee Name&quot;,
    COUNT(*)                         &quot;Total Votes&quot;
FROM
         voteyear vy1
    INNER JOIN employee cand ON vy1.candidate_id = cand.employee_id
GROUP BY
    EXTRACT(YEAR FROM vy1.vote_year),
    vy1.vote_month,
    cand.employee_name
HAVING
    EXTRACT(YEAR FROM vy1.vote_year)=:vote_year AND
    vy1.vote_month=:vote_month
ORDER BY
    &quot;Total Votes&quot; DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="vote_year" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropDownList2" Name="vote_month" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                    <div class="col">
                        <h1>Total Employees in Roles</h1>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT role.role_name &quot;Role Name&quot;, COUNT(*) &quot;Total Employees&quot; FROM employee JOIN role ON employee.role_id=role.role_id GROUP BY role.role_name"></asp:SqlDataSource>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="Role Name" YValueMembers="Total Employees">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h1>Total Employees In Department</h1>
                        <asp:Chart ID="Chart3" runat="server" DataSourceID="EmployeesInDepartmentDataSource">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="Department Name" YValueMembers="Total Employees">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="EmployeesInDepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT dpt.department_name &quot;Department Name&quot;, COUNT(*) &quot;Total Employees&quot; FROM job_history jh JOIN department dpt ON jh.department_id = dpt.department_id WHERE end_date IS NULL GROUP BY dpt.department_name"></asp:SqlDataSource>
                    </div>
                    <div class="col">
                        <h1>Total Roles In Job</h1>
                        <asp:Chart ID="Chart4" runat="server" DataSourceID="RolesInJobsDataSource">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="Job Name" YValueMembers="Total Roles">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="RolesInJobsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT jobs.job_name &quot;Job Name&quot;, COUNT(*) &quot;Total Roles&quot; FROM role JOIN jobs ON role.job_id=jobs.job_id GROUP BY jobs.job_name"></asp:SqlDataSource>

                    </div>
                </div>
            </div>
        </form>
    </main>
</body>
</html>
