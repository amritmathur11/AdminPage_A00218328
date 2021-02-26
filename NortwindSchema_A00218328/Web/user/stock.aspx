<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="stock.aspx.cs" Inherits="Web.user.stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-8">

        <div class="panel panel-primary">

            <div class="panel-heading">STOCK STATUS</div>
             <div class="panel-body">

                 
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Product" HeaderText="Product" />           
            <asp:BoundField HeaderText="Current Stock" DataField="Current" />            
            <asp:BoundField HeaderText="Total Sold" DataField="Sold" />                        
        </Columns>
</asp:GridView>

                 </div>

            </div>        


    </div>
    <div class="col-md-4">

        <div class="panel panel-primary">

            <div class="panel-heading">UPDATE STOCK</div>
             <div class="panel-body">

        <div class="form-group">
            <label>Product</label>
            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">                
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Quantity</label>
        <asp:TextBox ID="txt_quantity"  TextMode="Number" minvalue="0" CssClass="form-control" runat="server"></asp:TextBox></div>
        <asp:Button ID="Button1"  runat="server" Text="Add New" CssClass="btn btn-primary" OnClick="Button1_Click"  />

    </div></div></div>
</asp:Content>
