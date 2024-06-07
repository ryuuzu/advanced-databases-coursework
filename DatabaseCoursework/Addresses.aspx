<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addresses.aspx.cs" Inherits="DatabaseCoursework.Address" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Address</title>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STATE&quot;, &quot;COUNTRY&quot;) VALUES (:ADDRESS_ID, :STREET, :CITY, :STATE, :COUNTRY)" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;STREET&quot;, &quot;CITY&quot;, &quot;STATE&quot;, &quot;COUNTRY&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;STREET&quot; = :STREET, &quot;CITY&quot; = :CITY, &quot;STATE&quot; = :STATE, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                        <asp:Parameter Name="STREET" Type="String" />
                        <asp:Parameter Name="CITY" Type="String" />
                        <asp:Parameter Name="STATE" Type="String" />
                        <asp:Parameter Name="COUNTRY" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="STREET" Type="String" />
                        <asp:Parameter Name="CITY" Type="String" />
                        <asp:Parameter Name="STATE" Type="String" />
                        <asp:Parameter Name="COUNTRY" Type="String" />
                        <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ADDRESS_ID" HeaderText="Address ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                        <asp:BoundField DataField="STREET" HeaderText="Street" SortExpression="STREET" />
                        <asp:BoundField DataField="CITY" HeaderText="City" SortExpression="CITY" />
                        <asp:BoundField DataField="STATE" HeaderText="State" SortExpression="STATE" />
                        <asp:BoundField DataField="COUNTRY" HeaderText="Country" SortExpression="COUNTRY" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        <label class="form-label">Address ID:</label>
                        <asp:TextBox ID="ADDRESS_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                        <br />
                        <label class="form-label">Street:</label>
                        <asp:TextBox ID="STREETTextBox" CssClass="form-control" runat="server" Text='<%# Bind("STREET") %>' />
                        <br />
                        <label class="form-label">City:</label>
                        <asp:TextBox ID="CITYTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CITY") %>' />
                        <br />
                        <label class="form-label">State:</label>
                        <asp:TextBox ID="STATETextBox" CssClass="form-control" runat="server" Text='<%# Bind("STATE") %>' />
                        <br />
                        <label class="form-label">Country:</label>
                        <asp:TextBox ID="COUNTRYTextBox" CssClass="form-control" runat="server" Text='<%# Bind("COUNTRY") %>' />
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
