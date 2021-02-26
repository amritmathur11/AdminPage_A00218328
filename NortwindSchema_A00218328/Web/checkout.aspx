<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Web.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h5><strong>Kindly fill in your details below to place the order. Our Customer relation department will contact you before your order is dispatched.</strong></h5>

    <div id="loginform" runat="server" class="alert alert-info">
        Returning customer? <a href="login.aspx">Click here to login</a>
    </div>

    <div id="guestform" runat="server" >
    <h4 class="page-header text-uppercase">Checkout as Guest</h4>
        <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" ValidationGroup="ORDER" />
        <div class="panel panel-warning">
            <div class="panel-heading">
                CUSTOMER DETAILS
            </div>

            <div class="panel-body">

                

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>First Name *</label>
                    <asp:TextBox ID="txt_firstname" ValidationGroup="ORDER" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_firstname" ErrorMessage=" First name is a required field" ValidationGroup="ORDER" Display="None"> First name is a required field</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Last Name *</label>
                    <asp:TextBox ID="txt_lastname" CssClass="form-control" ValidationGroup="ORDER" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_lastname" ErrorMessage="Last name is a required field" ValidationGroup="ORDER" Display="None">Last name is a required field</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-12">
                
                    <div class="form-group">
                    <label>Street Address *</label>
                    <asp:TextBox ID="txt_address" ValidationGroup="ORDER" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_address" ErrorMessage="Address is a required field." ValidationGroup="ORDER" Display="None">Address is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-12">
                
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
                </div>
                    </div>
            </div>           
        </div>
</div>
        <div class="panel panel-warning">
            <div class="panel-heading">
                YOUR ORDER
            </div>

            <div class="panel-body">
                <asp:Literal runat="server" ID="lbl_cart" />
            </div>   
            
            <div class="panel-footer">
                <asp:Button ID="btn_submit" ValidationGroup="ORDER" CssClass="btn btn-warning" runat="server" Text="PLACE ORDER" OnClick="btn_submit_Click" />
            </div>   
                    
        </div>
    
</asp:Content>
