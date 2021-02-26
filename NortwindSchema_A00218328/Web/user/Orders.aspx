<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Web.user.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    CUSTOMER ORDERS
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="OrderNumber" HeaderText="Order #" />
            <asp:BoundField HeaderText="Order Date" DataField="OrderDate" />
            <asp:BoundField HeaderText="Total Items" DataField="TotalItems" />
            <asp:BoundField HeaderText="Price" DataField="TotalPrice" />
            <asp:BoundField HeaderText="Status" DataField="Status" />
            <asp:TemplateField HeaderText="Action">
                
                <ItemTemplate>
                    <asp:HyperLink ID="btn_details" runat="server">View Detail</asp:HyperLink>
                </ItemTemplate>                                
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>
</asp:Content>
