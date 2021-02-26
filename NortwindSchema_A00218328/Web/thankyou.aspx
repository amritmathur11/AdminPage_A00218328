<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="Web.thankyou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    <div class="alert alert-warning text-center text-uppercase">
    <h3>Your Order has been placed sucessfully<br /> your order number is <asp:Label ID="lbl_number" runat="server" Text=""></asp:Label></h3>
        <small>you can track your order by using order number</small>
        </div><img src="Images/1343.jpg" class="img-responsive" />
</asp:Content>
