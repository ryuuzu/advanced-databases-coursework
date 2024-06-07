<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="DatabaseCoursework.Departments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Voting System - Departments</title>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_EMAIL&quot;, &quot;DEPARTMENT_CONTACT&quot;, &quot;FAX_NUMBER&quot;, &quot;ADDRESS_ID&quot;) VALUES (:DEPARTMENT_ID, :DEPARTMENT_NAME, :DEPARTMENT_EMAIL, :DEPARTMENT_CONTACT, :FAX_NUMBER, :ADDRESS_ID)" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_EMAIL&quot;, &quot;DEPARTMENT_CONTACT&quot;, &quot;FAX_NUMBER&quot;, &quot;ADDRESS_ID&quot; FROM &quot;DEPARTMENT&quot;" UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME, &quot;DEPARTMENT_EMAIL&quot; = :DEPARTMENT_EMAIL, &quot;DEPARTMENT_CONTACT&quot; = :DEPARTMENT_CONTACT, &quot;FAX_NUMBER&quot; = :FAX_NUMBER, &quot;ADDRESS_ID&quot; = :ADDRESS_ID WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="DEPARTMENT_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DEPARTMENT_ID" Type="Decimal" />
                        <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                        <asp:Parameter Name="DEPARTMENT_EMAIL" Type="String" />
                        <asp:Parameter Name="DEPARTMENT_CONTACT" Type="String" />
                        <asp:Parameter Name="FAX_NUMBER" Type="String" />
                        <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                        <asp:Parameter Name="DEPARTMENT_EMAIL" Type="String" />
                        <asp:Parameter Name="DEPARTMENT_CONTACT" Type="String" />
                        <asp:Parameter Name="FAX_NUMBER" Type="String" />
                        <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                        <asp:Parameter Name="DEPARTMENT_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="Department ID" ReadOnly="True" SortExpression="DEPARTMENT_ID" />
                        <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                        <asp:BoundField DataField="DEPARTMENT_EMAIL" HeaderText="Department Email" SortExpression="DEPARTMENT_EMAIL" />
                        <asp:BoundField DataField="DEPARTMENT_CONTACT" HeaderText="Department Contact" SortExpression="DEPARTMENT_CONTACT" />
                        <asp:BoundField DataField="FAX_NUMBER" HeaderText="Fax Number" SortExpression="FAX_NUMBER" />
                        <asp:BoundField DataField="ADDRESS_ID" HeaderText="Address ID" SortExpression="ADDRESS_ID" />
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" Enabled="false" runat="server" DataSourceID="SqlDataSource1" DataTextField="STREET" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
                    <InsertItemTemplate>
                        Department ID:
                    <asp:TextBox ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' CssClass="form-control" />
                        <br />
                        Department Name:
                    <asp:TextBox ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' CssClass="form-control" />
                        <br />
                        Department Email:
                    <asp:TextBox ID="DEPARTMENT_EMAILTextBox" runat="server" Text='<%# Bind("DEPARTMENT_EMAIL") %>' CssClass="form-control" />
                        <br />
                        Department Contact:
                    <asp:TextBox ID="DEPARTMENT_CONTACTTextBox" runat="server" Text='<%# Bind("DEPARTMENT_CONTACT") %>' CssClass="form-control" />
                        <br />
                        Fax Number:
                    <asp:TextBox ID="FAX_NUMBERTextBox" runat="server" Text='<%# Bind("FAX_NUMBER") %>' CssClass="form-control" />
                        <br />
                        Address ID:
                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="STREET" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;STREET&quot;) VALUES (:ADDRESS_ID, :STREET)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;STREET&quot; = :STREET WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                                <asp:Parameter Name="STREET" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="STREET" Type="String" />
                                <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
