<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="DatabaseCoursework.Jobs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Jobs</title>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;JOBS&quot; WHERE &quot;JOB_ID&quot; = :JOB_ID" InsertCommand="INSERT INTO &quot;JOBS&quot; (&quot;JOB_ID&quot;, &quot;JOB_NAME&quot;, &quot;MIN_SALARY&quot;, &quot;MAX_SALARY&quot;) VALUES (:JOB_ID, :JOB_NAME, :MIN_SALARY, :MAX_SALARY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot;, &quot;MIN_SALARY&quot;, &quot;MAX_SALARY&quot; FROM &quot;JOBS&quot;" UpdateCommand="UPDATE &quot;JOBS&quot; SET &quot;JOB_NAME&quot; = :JOB_NAME, &quot;MIN_SALARY&quot; = :MIN_SALARY, &quot;MAX_SALARY&quot; = :MAX_SALARY WHERE &quot;JOB_ID&quot; = :JOB_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="JOB_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="JOB_ID" Type="Decimal" />
                        <asp:Parameter Name="JOB_NAME" Type="String" />
                        <asp:Parameter Name="MIN_SALARY" Type="Decimal" />
                        <asp:Parameter Name="MAX_SALARY" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="JOB_NAME" Type="String" />
                        <asp:Parameter Name="MIN_SALARY" Type="Decimal" />
                        <asp:Parameter Name="MAX_SALARY" Type="Decimal" />
                        <asp:Parameter Name="JOB_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="JOB_ID" HeaderText="Job ID" ReadOnly="True" SortExpression="JOB_ID" />
                        <asp:BoundField DataField="JOB_NAME" HeaderText="Job Name" SortExpression="JOB_NAME" />
                        <asp:BoundField DataField="MIN_SALARY" HeaderText="Minimum Salary" SortExpression="MIN_SALARY" />
                        <asp:BoundField DataField="MAX_SALARY" HeaderText="Maximum Salary" SortExpression="MAX_SALARY" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        Job ID:
                    <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' CssClass="form-control" />
                        <br />
                        Job Name:
                    <asp:TextBox ID="JOB_NAMETextBox" runat="server" Text='<%# Bind("JOB_NAME") %>' CssClass="form-control" />
                        <br />
                        Minimum Salary:
                    <asp:TextBox ID="MIN_SALARYTextBox" runat="server" Text='<%# Bind("MIN_SALARY") %>' CssClass="form-control" />
                        <br />
                        Maximum Salary:
                    <asp:TextBox ID="MAX_SALARYTextBox" runat="server" Text='<%# Bind("MAX_SALARY") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-primary" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </form>
    </main>
</body>
</html>
