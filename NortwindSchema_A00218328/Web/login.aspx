<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Web.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
    <div class="panel panel-warning">
            	 <div class="panel-heading">Login</div>
				 <div class="panel-body">	
                     <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
          
      <asp:TextBox TextMode="Email"  ID="txt_username" ValidationGroup="login" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ValidationGroup="login"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="please fill out this field" ControlToValidate="txt_username"></asp:RequiredFieldValidator>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
      <asp:TextBox TextMode="Password" ID="txt_pass" ValidationGroup="login" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ValidationGroup="login"  ID="RequiredFieldValidator2" runat="server" ErrorMessage="please fill out this field" ControlToValidate="txt_pass"></asp:RequiredFieldValidator>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Login As</label>
      <asp:DropDownList CssClass="form-control" ID="cmb_type" runat="server">
          <asp:ListItem Value="User">User</asp:ListItem>
          <asp:ListItem Value="Vendor">Vendor</asp:ListItem>
      </asp:DropDownList>      
  </div>
      <asp:Button ValidationGroup="login" ID="btn_submit" class="btn btn-warning" runat="server" Text="Login" OnClick="btn_submit_Click" />                    
				  </div>
            </div>  
    </div>
</asp:Content>
