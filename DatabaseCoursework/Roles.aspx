<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="DatabaseCoursework.Roles" %>

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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ROLE&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID" InsertCommand="INSERT INTO &quot;ROLE&quot; (&quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;, &quot;JOB_ID&quot;) VALUES (:ROLE_ID, :ROLE_NAME, :JOB_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;, &quot;JOB_ID&quot; FROM &quot;ROLE&quot;" UpdateCommand="UPDATE &quot;ROLE&quot; SET &quot;ROLE_NAME&quot; = :ROLE_NAME, &quot;JOB_ID&quot; = :JOB_ID WHERE &quot;ROLE_ID&quot; = :ROLE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                        <asp:Parameter Name="ROLE_NAME" Type="String" />
                        <asp:Parameter Name="JOB_ID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ROLE_NAME" Type="String" />
                        <asp:Parameter Name="JOB_ID" Type="Decimal" />
                        <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ROLE_ID" HeaderText="Role ID" ReadOnly="True" SortExpression="ROLE_ID" />
                        <asp:BoundField DataField="ROLE_NAME" HeaderText="Role Name" SortExpression="ROLE_NAME" />
                        <asp:BoundField DataField="JOB_ID" HeaderText="Job ID" SortExpression="JOB_ID" />
                        <asp:TemplateField HeaderText="Job Name">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="JobNameDataSource" DataTextField="JOB_NAME" DataValueField="JOB_ID" Enabled="False" SelectedValue='<%# Bind("JOB_ID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="JobNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOBS&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        Role ID:
                    <asp:TextBox ID="ROLE_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ROLE_ID") %>' />
                        <br />
                        Role Name:
                    <asp:TextBox ID="ROLE_NAMETextBox" CssClass="form-control" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                        <br />
                        Job ID:
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="JobIDDataSource" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="JobIDDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOBS&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" CssClass="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </form>
    </main>
</body>
</html>
