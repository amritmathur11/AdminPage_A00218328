<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="Web.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-header">ORDER HISTORY</h2>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</asp:Content>
