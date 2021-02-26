<%@ Page Title="" Language="C#" MasterPageFile= "~/user/user.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Web.user.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-right">
        <a href="ProductDetails.aspx" class="btn btn-sm btn-primary">Add New Product</a>
    </div>
    <h3> PRODUCTS</h3>
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="GridView1_RowDataBound" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField HeaderText="OldPrice" DataField="OldPrice" />
            <asp:BoundField HeaderText="NewPrice" DataField="NewPrice" />
            <asp:BoundField HeaderText="Category" DataField="Category" />
            <asp:BoundField HeaderText="Status" DataField="Status" />
            <asp:BoundField HeaderText="Featured" DataField="Featured" />
            <asp:TemplateField HeaderText="Action">                
                <ItemTemplate>
                    <asp:HyperLink  ID="btn_detail" runat="server">View Detail</asp:HyperLink>
                    <asp:HyperLink ID="btn_images" runat="server">Pictures</asp:HyperLink>
                    <asp:HyperLink id="btn_sms" runat="server">SMS</asp:HyperLink>
                    <asp:HyperLink id="HyperLink1" Visible="false" runat="server">Delete</asp:HyperLink>
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
