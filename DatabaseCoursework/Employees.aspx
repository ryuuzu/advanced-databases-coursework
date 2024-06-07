<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="DatabaseCoursework.Employees" %>

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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;CONTACT&quot;, &quot;ROLE_ID&quot;, &quot;MANAGER_ID&quot; FROM &quot;EMPLOYEE&quot; ORDER BY &quot;EMPLOYEE_ID&quot;" DeleteCommand="DELETE FROM &quot;EMPLOYEE&quot; WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID" InsertCommand="INSERT INTO &quot;EMPLOYEE&quot; (&quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;CONTACT&quot;, &quot;ROLE_ID&quot;, &quot;MANAGER_ID&quot;) VALUES (:EMPLOYEE_ID, :EMPLOYEE_NAME, :DATE_OF_BIRTH, :CONTACT, :ROLE_ID, :MANAGER_ID)" UpdateCommand="UPDATE &quot;EMPLOYEE&quot; SET &quot;EMPLOYEE_NAME&quot; = :EMPLOYEE_NAME, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH, &quot;CONTACT&quot; = :CONTACT, &quot;ROLE_ID&quot; = :ROLE_ID, &quot;MANAGER_ID&quot; = :MANAGER_ID WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
                        <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
                        <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                        <asp:Parameter Name="CONTACT" Type="String" />
                        <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                        <asp:Parameter Name="MANAGER_ID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
                        <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                        <asp:Parameter Name="CONTACT" Type="String" />
                        <asp:Parameter Name="ROLE_ID" Type="Decimal" />
                        <asp:Parameter Name="MANAGER_ID" Type="Decimal" />
                        <asp:Parameter Name="EMPLOYEE_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="Employee ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                        <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="Employee Name" SortExpression="EMPLOYEE_NAME" />
                        <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="Date of Birth" SortExpression="DATE_OF_BIRTH" />
                        <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                        <asp:BoundField DataField="ROLE_ID" HeaderText="Role ID" SortExpression="ROLE_ID" />
                        <asp:TemplateField HeaderText="Role Name">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="RoleNameData" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="RoleNameData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MANAGER_ID" HeaderText="Manager ID" SortExpression="MANAGER_ID" />
                        <asp:TemplateField HeaderText="Manager Name">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" Enabled="False" SelectedValue='<%# Bind("MANAGER_ID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT employee_id, employee_name FROM employee UNION SELECT NULL, 'None' FROM dual"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        Employee ID:
                    <asp:TextBox ID="EMPLOYEE_IDTextBox" CssClass="form-control" runat="server" Text='<%# Bind("EMPLOYEE_ID") %>' />
                        <br />
                        Employee Name:
                    <asp:TextBox ID="EMPLOYEE_NAMETextBox" CssClass="form-control" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
                        <br />
                        Date of Birth:
                    <asp:TextBox ID="DATE_OF_BIRTHTextBox" CssClass="form-control" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                        <br />
                        Contact:
                    <asp:TextBox ID="CONTACTTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CONTACT") %>' />
                        <br />
                        Role ID:
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting1" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
                        <br />
                        Manager ID:
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("MANAGER_ID") %>'>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
