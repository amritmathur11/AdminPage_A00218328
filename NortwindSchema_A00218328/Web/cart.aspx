<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Web.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <h3 runat="server" id="lbl_empty" class="text-warning text-center text-uppercase" > <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Your cart is currently empty.</h3>
        <asp:Literal runat="server" ID="lbl_cart" />
   

</asp:Content>
