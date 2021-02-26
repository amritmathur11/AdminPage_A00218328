<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="sms.aspx.cs" Inherits="Web.user.sms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="table table-bordered">

        <tr>
            <td>Total Clients</td>
            <td>::</td>
            <td>            <asp:Label ID="lbl_total" runat="server" Text=""></asp:Label></td>
        </tr>

        <tr>
            <td>Product</td>
            <td>::</td>
            <td><asp:Label ID="lbl_product" runat="server" Text=""></asp:Label></td>
        </tr>

         <tr>
            <td>Message</td>
            <td>::</td>
            <td><asp:Button ID="btn_send" runat="server" CssClass="btn btn-primary" Text="SEND MESSAGES" OnClick="btn_send_Click" /></td>
             
        </tr>

    </table>

    


</asp:Content>
