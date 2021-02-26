<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="orderdetails.aspx.cs" Inherits="Web.user.orderdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    ORDER DETAILS
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel-body">
    <asp:Literal ID="lbl_details" runat="server"></asp:Literal>
            </div></div></div>
    <div class="col-md-4">

        <div class="panel panel-primary">

            <div class="panel-heading">CHANGE STATUS</div>

                <div class="panel-body">


        <div class="form-group">
            <label>Status</label>
            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                <asp:ListItem Value="InProcess">InProcess</asp:ListItem>
                <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
            </asp:DropDownList>
        </div>
                    <asp:TextBox ID="txt_id" Visible="false" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Update" CssClass="form-control" OnClick="Button1_Click" />
    </div>
</div></div>
</asp:Content>

