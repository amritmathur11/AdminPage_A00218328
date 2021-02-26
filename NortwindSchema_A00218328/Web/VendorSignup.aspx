<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="VendorSignup.aspx.cs" Inherits="Web.VendorSignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" ValidationGroup="ORDER" />
    <h3><asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label></h3>

        <div class="panel panel-warning">
            <div class="panel-heading">
                CREATE Supplier ACCOUNT
            </div>

            <div class="panel-body">

                
            

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Shop Name *</label>
                    <asp:TextBox ID="txt_shop" ValidationGroup="ORDER" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_shop" ErrorMessage="Shop name is a required field" ValidationGroup="ORDER" Display="None"> First name is a required field</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Last Name *</label>
                    <asp:TextBox ID="txt_lastname" CssClass="form-control" ValidationGroup="ORDER" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_lastname" ErrorMessage="Name is a required field" ValidationGroup="ORDER" Display="None">Last name is a required field</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-12">
                
                    <div class="form-group">
                    <label>Street Address *</label>
                    <asp:TextBox ID="txt_address" ValidationGroup="ORDER" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_address" ErrorMessage="Address is a required field." ValidationGroup="ORDER" Display="None">Address is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Town\City *</label>
                    <asp:TextBox ID="txt_city" CssClass="form-control" ValidationGroup="ORDER" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_city" ErrorMessage="City is a required field." ValidationGroup="ORDER" Display="None">City is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>                 

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Phone *</label>
                    <asp:TextBox ID="txt_phone" ValidationGroup="ORDER" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_phone" ErrorMessage=" Phone is a required field." ValidationGroup="ORDER" Display="None"> Phone is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ValidationGroup="ORDER" ID="txt_email" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_phone" ErrorMessage="Email is a required field." ValidationGroup="ORDER" Display="None">Email is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Confirm Email</label>
                    <asp:TextBox ValidationGroup="ORDER" ID="txt_c_email" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_email" ControlToValidate="txt_c_email" ErrorMessage="Both email should match" ValidationGroup="ORDER">Both email should match</asp:CompareValidator>
                        
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ValidationGroup="ORDER" ID="txt_pass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_phone" ErrorMessage=" Password is a required field." ValidationGroup="ORDER" Display="None"> Password is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>
                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Confirm Password</label>
                    <asp:TextBox ValidationGroup="ORDER" ID="txt_c_pass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txt_pass" ControlToValidate="txt_c_pass" ErrorMessage="Both password should match" ValidationGroup="ORDER">Both password should match</asp:CompareValidator>
                </div>
                    </div>

            </div> 
            
             <div class="panel-footer">
                <asp:Button ID="btn_submit" ValidationGroup="ORDER" CssClass="btn btn-warning" runat="server" Text="CREATE ACCOUNT" OnClick="btn_submit_Click" />
            </div>            
        </div>

</asp:Content>
