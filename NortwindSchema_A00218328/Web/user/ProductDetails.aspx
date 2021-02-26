<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Web.user.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    PRODUCT DETAILS
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" ValidationGroup="ORDER" />
    <h3><asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label></h3>

        <div class="panel panel-primary">
            <div class="panel-heading">
                Product Details
            </div>

            <div class="panel-body">
                          
                <div class="col-md-12">                
                    <div class="form-group">
                    <label>Title *</label>
                    <asp:TextBox ID="txt_title" ValidationGroup="ORDER" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator maxlength="45" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_title" ErrorMessage=" Title is a required field" ValidationGroup="ORDER" Display="None">Title is a required field</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>Old Price *</label>
                    <asp:TextBox TextMode="Number" ID="txt_old" CssClass="form-control" ValidationGroup="ORDER" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_old" ErrorMessage="Old Price is a required field" ValidationGroup="ORDER" Display="None">Old Price is a required field</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-6">
                
                    <div class="form-group">
                    <label>New Price *</label>
                    <asp:TextBox ID="txt_new" TextMode="Number" ValidationGroup="ORDER" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_new" ErrorMessage="New Price is a required field." ValidationGroup="ORDER" Display="None">Price is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-12">
                
                    <div class="form-group">
                    <label>Short Description *</label>

                    <asp:TextBox TextMode="MultiLine" ID="txt_short" Rows="5" MaxLength="100" CssClass="form-control" ValidationGroup="ORDER" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_short" ErrorMessage="Short Description is a required field." ValidationGroup="ORDER" Display="None">Short Description is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>                 

                <div class="col-md-12">
                
                    <div class="form-group">
                    <label>Long Description *</label>
                    <asp:TextBox ID="txt_long" ValidationGroup="ORDER" CssClass="form-control" runat="server" Rows="6" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_long" ErrorMessage="Description is a required field." ValidationGroup="ORDER" Display="None">Description is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>

                <div class="col-md-4">
                
                    <div class="form-group">
                    <label>Status</label>
                        <asp:CheckBox CssClass="form-control" ID="chk_status" runat="server" />
                </div>
                    </div>

                <div class="col-md-4">
                
                    <div class="form-group">
                    <label>Featured</label>
                        <asp:CheckBox CssClass="form-control" ID="chk_featured" runat="server" />
                </div>
                    </div>

                <div class="col-md-4">
                
                    <div class="form-group">
                    <label>Category</label>
                        <asp:DropDownList CssClass="form-control" ID="cmb_categories" runat="server">
                            
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cmb_categories" ErrorMessage="Category is a required field." ValidationGroup="ORDER" Display="None">Category is a required field.</asp:RequiredFieldValidator>
                </div>
                    </div>                

            </div> 
            
             <div class="panel-footer">
                <asp:Button ID="btn_submit" ValidationGroup="ORDER" CssClass="btn btn-warning" runat="server" Text="Add New" OnClick="btn_submit_Click"  />
                 <asp:Button ID="btn_update" Visible="false" ValidationGroup="ORDER" CssClass="btn btn-warning" runat="server" Text="Update" OnClick="btn_update_Click"  />
            </div>            
        </div>
</asp:Content>
